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

__precompile__()

module Measurements

# This is used to calculate numerical derivatives in "@uncertain" macro.
using Calculus

# Function to handle new type
import Base: show

# Functions provided by this package and exposed to users
export Measurement, ±, stdscore, weightedmean

# Define the "Derivatives" type, used inside "Measurement" type.  This should be
# a lightweight and immutable dictionary.  In Julia 0.5 we just use
# "Base.ImmutableDict", in previous versions we define the type just like
# "Base.ImmutableDict".
if VERSION >= v"0.5-dev+1910"
    const Derivatives = Base.ImmutableDict
else
    include("derivatives-type.jl")
end

##### New Type: Measurement
# Definition.  The Measurement type is composed by the following fields:
#   * val: the nominal value of the measurement
#   * err: the uncertainty, assumed to be standard deviation
#   * tag: a (hopefully) unique identifier, it is used to identify a specific
#     measurement in the list of derivatives.  This is usually created with
#     `rand'.
#   * der: the list of derivates.  It is a lightweight dictionary, whose keys
#     are the tuples (nominal value, uncertainty, tag) of all independent
#     variables from which the object has been derived, the corresponding value
#     is the total derivative of the object with respect to that independent
#     variable.  This dictionary is useful to trace the contribution of each
#     measurement and propagate the uncertainty in the case of functions with
#     more than one argument (in order to deal with correlation between
#     arguments).
immutable Measurement{T<:AbstractFloat} <: AbstractFloat
    val::T
    err::T
    tag::Float64
    der::Derivatives{Tuple{T, T, Float64}, T}
end

# Constructors
function Measurement(val::Real, err::Real)
    val, err, der = promote(float(val), float(err), one(float(val)))
    tag = rand()
    return Measurement(val, err, tag, Derivatives((val, err, tag)=>der))
end

Measurement(value::Irrational) = Measurement(value, zero(float(value)))
Measurement(value::Real) = Measurement(value, zero(value))
const ± = Measurement

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

include("conversions.jl")
include("comparisons-tests.jl")
include("math.jl")

end # module
