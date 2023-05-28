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
end
function Measurement(val::V, err::E, tag::UInt64,
                     der::Derivatives{D}) where {V,E,D}
    T = promote_type(V, E, D)
    return Measurement(T(val), T(err), tag, Derivatives{T}(der))
end
Measurement{T}(x::Measurement{S}) where {T,S} = convert(Measurement{T}, x)
Measurement{T}(x::S) where {T,S <: Real} = convert(Measurement{T}, x)

# disambiguities
Measurement{T}(x::S) where {T, S<:Rational} = convert(Measurement{T}, x)
Measurement{T}(x::S) where {T, S<:Complex} = convert(Measurement{T}, x)
Measurement{T}(x::S) where {T, S<:Base.TwicePrecision} = convert(Measurement{T}, x)
Measurement{T}(x::S) where {P, T, S<:Rational{P}} = convert(Measurement{T}, x)
Measurement{T}(x::S) where {T, S <: AbstractChar} = convert(Measurement{T}, x)

function Measurement{T}(::S) where {T, S}
    throw(ArgumentError("cannot convert `$S` to `Measurement{$T}`"))
end

# Functions to quickly create an empty Derivatives object.
@generated empty_der1(x::Measurement{T}) where {T<:AbstractFloat} = Derivatives{T}()
@generated empty_der2(x::T) where {T<:AbstractFloat} = Derivatives{x}()

# Start from 1, 0 is reserved to derived quantities
const tag_counter = Threads.Atomic{UInt64}(1)

measurement(x::Measurement) = x
measurement(val::T) where {T<:AbstractFloat} = Measurement(val, zero(T), UInt64(0), empty_der2(val))
measurement(val::Real) = measurement(float(val))
function measurement(val::T, err::T) where {T<:AbstractFloat}
    newder = empty_der2(val)
    if iszero(err)
        Measurement{T}(val, err, UInt64(0), newder)
    else
        tag = Threads.atomic_add!(tag_counter, UInt64(1))
        return Measurement{T}(val, err, tag, Derivatives(newder, (val, err, tag)=>one(T)))
    end
end
measurement(val::Real, err::Real) = measurement(promote(float(val), float(err))...)
measurement(::Missing, ::Union{Real,Missing} = missing) = missing
const ± = measurement

"""
    measurement(val::Real, [err::Real]) -> Measurement
    measurement(::Missing, [err::Union{Real,Missing}]) -> Missing
    val ± err -> Measurement

Return a `Measurement` object with `val` as nominal value and `err` as
uncertainty.  `err` defaults to 0 if omitted.

The binary operator `±` is equivalent to `measurement`, so you can construct a
`Measurement` object by explicitely writing `123 ± 4`.

If `val` is `missing`, `missing` is returned.
"""
measurement

include("conversions.jl")
include("comparisons-tests.jl")
include("utils.jl")
include("math.jl")
include("linear_algebra.jl")
include("show.jl")
include("parsing.jl")

if !isdefined(Base,:get_extension)
    using Requires
    using RecipesBase
    include("../ext/MeasurementsRecipesBaseExt.jl")
end

@static if !isdefined(Base, :get_extension)
    function __init__()
        @require Unitful="1986cc42-f94f-5a68-af5c-568840ba703d" include("../ext/MeasurementsUnitfulExt.jl")
        @require SpecialFunctions="276daf66-3868-5448-9aa4-cd146d93841b" include("../ext/MeasurementsSpecialFunctionsExt.jl")
        @require Juno="e5e0dc1b-0480-54bc-9374-aad01c23163d" include("../ext/MeasurementsJunoExt.jl")
    end
end

end # module
