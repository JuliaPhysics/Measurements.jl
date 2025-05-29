module MeasurementsForwardDiffExt

using ForwardDiff: Dual, DiffRules, NaNMath, LogExpFunctions, SpecialFunctions,≺
using Measurements: Measurement, Measurements
import Base: +,-,/,*,promote_rule
using ForwardDiff: AMBIGUOUS_TYPES, partials, values, Partials, value
using ForwardDiff: ForwardDiff

#=
overload in ForwardDiff.construct_seeds and ForwardDiff.single_seed

A ForwardDiff.Partials is a static vector, containing the derivative component.
construct_seeds makes a tuple of partials, each partial is full of zeros, except in the position i.
ForwardDiff.single_seed(::Type{Partials{N},Val{i}) is the function that constructs those partials.

The problem is that ForwardDiff uses one(T) to build such tuples.

In Measurements.jl, one(::Type{Measurement{T}})::T has a different return type compared to zero(::Measurement{T})::Measurement{T}

This causes ForwardDiff to fail, as it expects that typeof(one(T)) == typeof(zero(T)) == T.

The error is in ForwardDiff, as the correct function to use is oneunit(T).

Now, @generated functions don't allow new dispatches for functions inside their body, but add new methods to an existing @generated function. 
That is why both single_seed and construct_seeds body are rewritten in terms of the function _single_seed.
=#
@generated function ForwardDiff.construct_seeds(::Type{Partials{N,V}}) where {N,V<:Measurement}
    return Expr(:tuple, [:(_single_seed(Partials{N,V}, Val{$i}())) for i in 1:N]...)
end

@generated function _single_seed(::Type{Partials{N,V}}, ::Val{i}) where {N,V,i}
    ex = Expr(:tuple, [ifelse(i === j, :(oneunit(V)), :(zero(V))) for j in 1:N]...)
    return :(Partials($(ex)))
end

@generated function ForwardDiff.single_seed(p::Type{Partials{N,V}}, v::Val{i}) where {N,V <: Measurement,i}
    return :(_single_seed(p,v))
end

#=
promote_rule

ForwardDiff.Dual wants to convert every real it encounters into a ForwardDiff.Dual.
Measurements.Measurement wants to convert every real it encounters into a Measurements.Measurement.
now, when a Dual and a Measurement encounter, we need to decide to which number type the result is promoted.

There are two options:
- Measurement{Dual}: not possible, Dual is not an AbstractFloat
- Dual{Measurement}: possible, and the approach taken by this extension
=#
function promote_rule(::Type{Measurement{V}}, ::Type{Dual{T, V, N}}) where {T,V,N}
    Dual{T, Measurement{V}, N}
end

function promote_rule(::Type{Measurement{V1}}, ::Type{Dual{T, V2, N}}) where {V1<:AbstractFloat, T, V2, N}
    Vx = Measurement{promote_type(V1,V2)}
    return Dual{T, Vx, N}
end

function promote_rule(::Type{Measurement{V1}}, ::Type{Dual{T, Measurement{V2}, N}}) where {V1<:AbstractFloat, T, V2<:AbstractFloat, N}
    Vx = Measurement{promote_type(V1,V2)}
    return Dual{T, Vx, N}
end

function promote_rule(::Type{Dual{T, V, N}}, ::Type{Measurement{V}}) where {T,V,N}
    Dual{T, Measurement{V}, N}
end

function promote_rule( ::Type{Dual{T, V2, N}}, ::Type{Measurement{V1}}) where {T, V2, N, V1<:AbstractFloat}
    Vx = Measurement{promote_type(V1,V2)}
    return Dual{T, Vx, N}
end

function promote_rule(::Type{Dual{T, Measurement{V2}, N}}, ::Type{Measurement{V1}}) where {T, V2<:AbstractFloat, N, V1<:AbstractFloat}
    Vx = Measurement{promote_type(V1,V2)}
    return Dual{T, Vx, N}
end

function Base.oneunit(::Type{Dual{T, Measurement{V}, N}}) where {T,V,N}
    return Dual{T,Measurement{V},N}(oneunit(Measurement{V}))
end

#=
overload_ambiguous_binary

ForwardDiff works via overloading.
It takes a long list from DiffRules.jl and evaluates new methods to allow passing Duals.
ForwardDiff already takes care of ambiguous types (like rationals and BigFloat), by adding aditional dispatches like the one below.
what we do in this package is just wrap the measument inside a dual and let the existing ForwardDiff machinery do its work.
=#
function overload_ambiguous_binary(M,f)
    Mf = :($M.$f)
    return quote
        @inline function $Mf(x::Dual{Tx}, y::Measurement) where {Tx}
            ∂ = promote_type(typeof(x),typeof(y))
            ∂y = convert(∂,y)
            $Mf(x,∂y)
        end

        @inline function $Mf(x::Measurement,y::Dual{Ty}) where {Ty}
            ∂ = promote_type(typeof(x),typeof(y))
            ∂x = convert(∂,x)
            $Mf(∂x,y)
        end
    end
end

#=
define_ternary_dual_op2

Code modified from https://github.com/JuliaDiff/ForwardDiff.jl/blob/fb93a82bf744d27ee4a3b455bb693f0ce18439b4/src/dual.jl#L156-L200

Ternary ops are overloaded in the following way:

1. ForwardDiff first defines dispatches where all three arguments are duals
2. Then, it overloads all dispatches with one ambiguous type and two Duals (for each element of AMBIGUOUS_TYPES)
3. Then, it overloads all dispatches with two different ambiguous types and a Dual (for each combination of two different elements of AMBIGUOUS_TYPES)
4. finally, it overloads the case of one dual and two arguments of the same ambiguous type (for each element of AMBIGUOUS_TYPES)
This code does (2), (3) and (4)
The second step only evaluates the case of two duals and one measurement.
The third step evaluates the case of one dual, one ambiguous type and one measurement.
The fourth step evaluates the case of one dual and two measurements.
=#
macro define_ternary_dual_op2(f, xyz_body, xy_body, xz_body, yz_body, x_body, y_body, z_body)
    FD = ForwardDiff
    R = Measurement
    #step two: measurement and two Duals
    defs = quote
        @inline $(f)(x::$FD.Dual{Txy}, y::$FD.Dual{Txy}, z::$R) where {Txy} = $xy_body
        @inline $(f)(x::$FD.Dual{Tx}, y::$FD.Dual{Ty}, z::$R)  where {Tx, Ty} = Ty ≺ Tx ? $x_body : $y_body
        @inline $(f)(x::$FD.Dual{Txz}, y::$R, z::$FD.Dual{Txz}) where {Txz} = $xz_body
        @inline $(f)(x::$FD.Dual{Tx}, y::$R, z::$FD.Dual{Tz}) where {Tx,Tz} = Tz ≺ Tx ? $x_body : $z_body
        @inline $(f)(x::$R, y::$FD.Dual{Tyz}, z::$FD.Dual{Tyz}) where {Tyz} = $yz_body
        @inline $(f)(x::$R, y::$FD.Dual{Ty}, z::$FD.Dual{Tz}) where {Ty,Tz} = Tz ≺ Ty ? $y_body : $z_body
    end

    #step three: one dual, one ambiguous type and one measurement
    for Q in AMBIGUOUS_TYPES
        expr = quote
            @inline $(f)(x::$FD.Dual{Tx}, y::$R, z::$Q) where {Tx} = $x_body
            @inline $(f)(x::$R, y::$FD.Dual{Ty}, z::$Q) where {Ty} = $y_body
            @inline $(f)(x::$R, y::$Q, z::$FD.Dual{Tz}) where {Tz} = $z_body
        end
        append!(defs.args, expr.args)
    end
    #step four: one dual, two measurements
    expr = quote
        @inline $(f)(x::$FD.Dual{Tx}, y::$R, z::$R) where {Tx} = $x_body
        @inline $(f)(x::$R, y::$FD.Dual{Ty}, z::$R) where {Ty} = $y_body
        @inline $(f)(x::$R, y::$R, z::$FD.Dual{Tz}) where {Tz} = $z_body
    end
    append!(defs.args, expr.args)
    return esc(defs)
end
#=
overload loop

Modified from https://github.com/JuliaDiff/ForwardDiff.jl/blob/fb93a82bf744d27ee4a3b455bb693f0ce18439b4/src/dual.jl#L482-L496

We don't need to overload unary definitions.
and only need to evaluate the ambiguous cases for binary definitions.
=#
for (M, f, arity) in DiffRules.diffrules(filter_modules = nothing)
    if !(isdefined(@__MODULE__, M) && isdefined(getfield(@__MODULE__, M), f))
        continue  # Skip rules for methods not defined in the current scope
    end
    if arity == 2
        eval(overload_ambiguous_binary(M,f))
    else
        # error("ForwardDiff currently only knows how to autogenerate Dual definitions for unary and binary functions.")
        # However, the presence of N-ary rules need not cause any problems here, they can simply be ignored.
    end
end

#ternary overloads, same as ForwardDiff.jl
@define_ternary_dual_op2(
    Base.hypot,
    ForwardDiff.calc_hypot(x, y, z, Txyz),
    ForwardDiff.calc_hypot(x, y, z, Txy),
    ForwardDiff.calc_hypot(x, y, z, Txz),
    ForwardDiff.calc_hypot(x, y, z, Tyz),
    ForwardDiff.calc_hypot(x, y, z, Tx),
    ForwardDiff.calc_hypot(x, y, z, Ty),
    ForwardDiff.calc_hypot(x, y, z, Tz),
)

@define_ternary_dual_op2(
    Base.fma,
    ForwardDiff.calc_fma_xyz(x, y, z),                         # xyz_body
    ForwardDiff.calc_fma_xy(x, y, z),                          # xy_body
    ForwardDiff.calc_fma_xz(x, y, z),                          # xz_body
    Base.fma(y, x, z),                                         # yz_body
    Dual{Tx}(Base.fma(value(x), y, z), partials(x) * y),       # x_body
    Base.fma(y, x, z),                                         # y_body
    Dual{Tz}(Base.fma(x, y, value(z)), partials(z))            # z_body
)

@define_ternary_dual_op2(
    Base.muladd,
    ForwardDiff.calc_muladd_xyz(x, y, z),                         # xyz_body
    ForwardDiff.calc_muladd_xy(x, y, z),                          # xy_body
    ForwardDiff.calc_muladd_xz(x, y, z),                          # xz_body
    Base.muladd(y, x, z),                             # yz_body
    Dual{Tx}(Base.muladd(value(x), y, z), partials(x) * y), # x_body
    Base.muladd(y, x, z),                             # y_body
    Dual{Tz}(Base.muladd(x, y, value(z)), partials(z))      # z_body
)

#=
Derivatives of Measurements.value and Measurements.uncertainty
Apply those functions to the real and partial part.
=#
function Measurements.value(x::Dual{T,V,N}) where {T, V <: Measurement, N}
    x_value = Measurements.value(ForwardDiff.value(x))
    p = partials(x)
    p_value = ntuple(i -> Measurements.value(p[i]),Val(N))
    return ForwardDiff.Dual{T}(x_value,Partials(p_value))
end

function Measurements.uncertainty(x::Dual{T,V,N}) where {T, V <: Measurement, N}
    x_err = Measurements.uncertainty(ForwardDiff.value(x))
    p = partials(x)
    p_err = ntuple(i -> Measurements.uncertainty(p[i]),Val(N))
    return ForwardDiff.Dual{T}(x_err,Partials(p_err))
end

#=
start of derivatives of Measurements.measurement

Derivative with respect to the value:
f(x) = measurement(n*x,m*y), derivative(f,x) = n ± 0

Derivative with respect to the uncertainty:
f(x) = measurement(n*x,m*y), derivative(f,x) = 0 ± m
=#
function dmeasurement_val(x::Dual{T,V,N},err::Real) where {T,V,N}

    val = ForwardDiff.value(x)
    _1,_0 = oneunit(val),zero(val)
    x_value = Measurements.measurement(val,err)
    x_der = Measurements.measurement(_1,_0)
    v = Dual{T}(x_value,x_der * partials(x))
end

function dmeasurement_err(x::Real,err::Dual{T,V,N}) where {T,V,N}
    errval = ForwardDiff.value(err)
    _1,_0 = oneunit(errval),zero(errval)
    x_value = Measurements.measurement(x,errval)
    x_der = Measurements.measurement(_0,_1)
    v = Dual{T}(x_value,x_der * partials(err))
end

function dmeasurement_val_and_err(x::Dual{T,V1,N},err::Dual{T,V2,N}) where {T,V1,V2,N}
    xval = ForwardDiff.value(x)
    errval = ForwardDiff.value(err)
    xp = partials(x)
    errp = partials(err)
    measurement_primal = Measurements.measurement(xval,errval)
    measurement_partials_tuple = ntuple(i -> Measurements.measurement(xp[i],errp[i]),Val(N))
    return Dual{T}(measurement_primal,Partials(measurement_partials_tuple))
end

function Measurements.measurement(x::ForwardDiff.Dual{T,V,N}) where {T,V,N}
    return dmeasurement_val(x,zero(ForwardDiff.value(x)))
end

ForwardDiff.@define_binary_dual_op(
    Measurements.measurement,
    dmeasurement_val_and_err(x,y),
    dmeasurement_val(x,y),
    dmeasurement_err(x,y),
)

end #module
