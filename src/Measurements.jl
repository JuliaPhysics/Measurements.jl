### Measurements.jl ---  Uncertainty propagation library
#
# Copyright (C) 2016 Mosè Giordano.
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

module Measurements

# Functions to handle new type
import Base: show, convert, promote_rule, float

# Functions provided by this package and exposed to users
export Measurement, ±, stdscore, weightedmean

# Define the new type
immutable Measurement{T<:AbstractFloat} <: AbstractFloat
    val::T # The value
    err::T # The uncertainty, assumed to be standard deviation
end
# Constructors
Measurement(val::Real, err::Real) = Measurement(promote(float(val), float(err))...)
Measurement(value::Irrational) = Measurement(value, zero(float(value)))
Measurement(value::Real) = Measurement(value, zero(value))
const ± = Measurement

# Conversion and Promotion
convert{T<:AbstractFloat}(::Type{Measurement{T}}, a::Irrational) =
    Measurement{T}(a, zero(float(a)))
convert{T<:AbstractFloat, S}(::Type{Measurement{T}}, a::Rational{S}) =
    Measurement{T}(a, zero(a))
convert{T<:AbstractFloat}(::Type{Measurement{T}}, a::Real) =
    Measurement{T}(a, zero(a))
convert{T<:AbstractFloat}(::Type{Measurement{T}}, a::Measurement) =
    Measurement{T}(a.val, a.err)
convert(::Type{Measurement}, a::Measurement) = a
convert{S}(::Type{Measurement}, a::Rational{S}) = Measurement(a)
convert(::Type{Measurement}, a::Real) = Measurement(a)
convert(::Type{Signed}, a::Measurement) = convert(Signed, a.val)

float{T<:AbstractFloat}(a::Measurement{T}) = a

promote_rule{T<:AbstractFloat, S<:Real}(::Type{Measurement{T}}, ::Type{S}) =
    Measurement{promote_type(T, S)}
promote_rule{T<:AbstractFloat, S<:AbstractFloat}(::Type{Measurement{T}}, ::Type{Measurement{S}}) =
    Measurement{promote_type(T, S)}

# Type representation
function show(io::IO, measure::Measurement)
    print(io, measure.val, " ± ", measure.err)
end

# Standard Score
"""
    stdscore(measure::Measurement, expected_value::Real) -> standard_score

Gives the standard score between a measure, with uncertainty, and its expected
value (that may or may not have the uncertainty):

    (measure.val - expected_value)/measure.err
"""
stdscore(a::Measurement, b::Real) = (a.val - b)/(a.err)

# Weighted Average with Inverse-Variance Weighting
"""
    weightedmean(iterable) -> Measurement(weighted_mean, standard_deviation)

Return the weighted mean of measurements listed in `iterable`, using
inverse-variance weighting.
"""
function weightedmean(iterable)
    v = [el.val for el in iterable]
    w = [inv(el.err)^2 for el in iterable]
    invsumw = inv(sum(w))
    return Measurement(dot(v, w)*invsumw, sqrt(invsumw))
end

include("comparisons-tests.jl")
include("math.jl")

end # module
