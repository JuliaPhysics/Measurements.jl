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

export stdscore, weightedmean, value, uncertainty

# Standard Score
"""
    stdscore(measure::Measurement, expected_value::Real) -> standard_score

Gives the standard score between a measure, with uncertainty, and its expected
value:

    (measure.val - expected_value)/measure.err
"""
stdscore(a::Measurement, b) = (a.val - b)/(a.err)

"""
    stdscore(measure_1::Measurement, measure_2::Measurement) -> standard_score

Gives the standard score between two measurements (both with uncertainty)
computed as the standard score between their difference and 0:

    stdscore(measure_1 - measure_2, 0)
"""
stdscore{S<:AbstractFloat,T<:AbstractFloat}(a::Measurement{S}, b::Measurement{T}) =
    stdscore(a - b, zero(promote_type(S, T)))

# Weighted Average with Inverse-Variance Weighting
"""
    weightedmean(iterable) -> measurement(weighted_mean, standard_deviation)

Return the weighted mean of measurements listed in `iterable`, using
inverse-variance weighting.
"""
function weightedmean(iterable)
    v = [el.val for el in iterable]
    w = [inv(el.err)^2 for el in iterable]
    invsumw = inv(sum(w))
    return measurement(dot(v, w)*invsumw, sqrt(invsumw))
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

# value and uncertainty
for (f, field) in ((:value, :val), (:uncertainty, :err))
    @eval begin
        ($f)(a::Measurement) = a.$field
        ($f){T<:AbstractFloat}(a::Complex{Measurement{T}}) =
            complex(($f)(a.re), ($f)(a.im))
    end
end

"""
    value(x::Measurement)
    value(x::Complex{Measurement})
    value(x::AbstractArray{Measurement})
    value(x::AbstractArray{Complex{Measurement}})

Return the nominal value of measurement `x`.  If `x` is an array, return an
array of the same length as `x` with the nominal values of each elements of `x`.
"""
value

"""
    uncertainty(x::Measurement)
    uncertainty(x::Complex{Measurement})
    uncertainty(x::AbstractArray{Measurement})
    uncertainty(x::AbstractArray{Complex{Measurement}})

Return the uncertainty of measurement `x`.  If `x` is an array, return an array
of the same length as `x` with the uncertainty of each elements of `x`.
"""
uncertainty
