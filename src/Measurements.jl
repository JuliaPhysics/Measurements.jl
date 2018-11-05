### Measurements.jl ---  Uncertainty propagation library
#
# Copyright (C) 2016, 2017 Mosè Giordano.
#
# Maintainer: Mosè Giordano <mose AT gnu DOT org>
# Keywords: uncertainty, error propagation, physics
#
# This file is a part of Measurements.jl.
#
# License is MIT "Expat".
#
### Commentary:
#
# This file is the entry point of the package: it defines the new `Measurement'
# type, some functions to handle it within Julia and the new functions provided
# by the package and exposed to users.
#
### Code:

__precompile__()

module Measurements

# Calculus is used to calculate numerical derivatives in "@uncertain" macro.
using Calculus

# Functions provided by this package and exposed to users
export Measurement, measurement, ±

# Define the "Derivatives" type, used inside "Measurement" type.  This should be
# a lightweight and immutable dictionary.
include("derivatives-type.jl")

##### New Type: Measurement
# Definition.  The Measurement type is composed by the following fields:
#   * val: the nominal value of the measurement
#   * err: the uncertainty, assumed to be standard deviation
#   * tag: a (hopefully) unique identifier, it is used to identify a specific
#     measurement in the list of derivatives.  NOTE: independent measurements
#     have tag > 0.  For dependent quantities the tag is 0.
#   * der: the list of derivates.  It is a lightweight dictionary, whose keys
#     are the tuples (nominal value, uncertainty, tag) of all independent
#     variables from which the object has been derived, the corresponding value
#     is the partial derivative of the object with respect to that independent
#     variable.  This dictionary is useful to trace the contribution of each
#     measurement and propagate the uncertainty in the case of functions with
#     more than one argument (in order to deal with correlation between
#     arguments).
struct Measurement{T<:AbstractFloat} <: AbstractFloat
    val::T
    err::T
    tag::UInt64
    der::Derivatives{T}
    label::String
end
function Measurement(val::V, err::E, tag::UInt64,
                     der::Derivatives{D}, label::String) where {V,E,D}
    T = promote_type(V, E, D)
    return Measurement(T(val), T(err), tag, Derivatives{T}(der), label)
end
Measurement{T}(x::Measurement{S}) where {T,S} = convert(Measurement{T}, x)
Measurement{T}(x::S) where {T,S} = convert(Measurement{T}, x)
Measurement{T}(x::S) where {T,S<:Rational} = convert(Measurement{T}, x)

# Functions to quickly create an empty Derivatives object.
@generated empty_der1(x::Measurement{T}) where {T<:AbstractFloat} = Derivatives{T}()
@generated empty_der2(x::T) where {T<:AbstractFloat} = Derivatives{x}()

const tag_counters = UInt64[1]
function __init__()
    nthr = Base.Threads.nthreads()
    resize!(tag_counters, nthr)[:] = range(UInt64(1), step=typemax(UInt64)÷nthr, length=nthr)
end

measurement(x::Measurement) = x
measurement(val::T; label::String="") where {T<:AbstractFloat} =
    Measurement(val, zero(T), UInt64(0), empty_der2(val), label)
measurement(val::Real; label::String="") = measurement(float(val), label=label)
function measurement(val::T, err::T; label::String="") where {T<:AbstractFloat}
    newder = empty_der2(val)
    if iszero(err)
        Measurement{T}(val, err, UInt64(0), newder, label)
    else
        @inbounds tag = tag_counters[Base.Threads.threadid()] += 1
        return Measurement{T}(val, err, tag,
                              Derivatives(newder, (val, err, tag, label)=>one(T)), label)
    end
end
measurement(val::Real, err::Real; label::String="") =
    measurement(promote(float(val), float(err))..., label=label)
const ± = measurement

"""
    measurement(val::Real, [err::Real]) -> Measurement
    val ± err -> Measurement

Return a `Measurement` object with `val` as nominal value and `err` as
uncertainty.  `err` defaults to 0 if omitted.

The binary operator `±` is equivalent to `measurement`, so you can construct a
`Measurement` object by explicitely writing `123 ± 4`.
"""
measurement

# Type representation
Base.show(io::IO, measure::Measurement) =
    print(io, measure.val, get(io, :compact, false) ? "±" : " ± ", measure.err)
Base.show(io::IO, ::MIME"text/latex", measure::Measurement) =
    print(io, "\$", measure.val, " \\pm ", measure.err, "\$")
for mime in (MIME"text/x-tex", MIME"text/x-latex")
    @eval Base.show(io::IO, ::$mime, measure::Measurement) =
        print(io, measure.val, " \\pm ", measure.err)
end
# Representation of complex measurements.  Print something that is easy to
# understand and that can be meaningfully copy-pasted into the REPL, at least
# for standard numeric types.
function Base.show(io::IO, measure::Complex{<:Measurement})
    r, i = reim(measure)
    compact = get(io, :compact, false)
    print(io, "(", r, ")")
    if signbit(i) && !isnan(i)
        i = -i
        print(io, compact ? "-" : " - ")
    else
        print(io, compact ? "+" : " + ")
    end
    print(io, "(", i, ")im")
end
# This is adapted from base/show.jl for Complex type.
function Base.alignment(io::IO, measure::Measurement)
    m = match(r"^(.*[\±])(.*)$", sprint(show, measure, context=io, sizehint=0))
    m === nothing ? (length(sprint(show, measure, context=io, sizehint=0)), 0) :
        (length(m.captures[1]), length(m.captures[2]))
end

### Juno pretty printing
using Requires
@require Juno="e5e0dc1b-0480-54bc-9374-aad01c23163d" begin
    Juno.render(i::Juno.Inline, measure::Measurement) =
    Juno.render(i, Juno.Row(measure.val, Text(" ± "), measure.err))

    Juno.Row(measure.val, Text(" ± "), measure.err)

    function Juno.render(ji::Juno.Inline, cm::Complex{<:Measurement})
        r, i = reim(cm)
        if signbit(i) && !isnan(i)
            i = -i
            sss = " - "
        else
            sss = " + "
        end
        Juno.render(ji, Juno.Row("(", Juno.render(ji, r), ")", sss,
        "(", Juno.render(ji, i), ")im"))
    end
end

include("conversions.jl")
include("comparisons-tests.jl")
include("utils.jl")
include("math.jl")
include("parsing.jl")
include("plot-recipes.jl")

end # module
