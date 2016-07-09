### utils.jl
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
# This file defines some utility functions.
#
### Code:

export stdscore, weightedmean

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

# Derivative and Gradient
derivative{F<:AbstractFloat, T<:AbstractFloat}(a::Measurement{F},
                                               tag::Tuple{T, T, Float64}) =
                                                   get(a.der, tag, zero(F))

"""
    derivative(x::Measurement, y::Measurement)

Return the value of the partial derivative of `x` with respect to the
independent measurement `y`, calculated on the nominal value of `y`.  Return
`0.0` if `x` does not depend on `y`.

Use `Measurements.gradient` to calculate the gradient of `x` with respect to an
arrays of independent measurements.
"""
derivative(a::Measurement, b::Measurement) =
    derivative(a, (b.val, b.err, b.tag))

"""
    gradient(x::Measurement, [y::AbstractArray{Measurement}])

Return the gradient of `x` with respect to the independent measurements
contained in `y` array, each calculated on the nominal value of the
corresponding measurement.  Return `0.0` for the variables on which `x` does not
depend.

Use `Measurements.derivative` to calculate the partial derivative of `x` with
respect to a single independent measurement.
"""
function gradient{F<:AbstractFloat, T<:Measurement}(a::Measurement{F},
                                                    b::AbstractArray{T})
    out = similar(b, F)
    for i in eachindex(b)
        out[i] = derivative(a, b[i])
    end
    return out
end
