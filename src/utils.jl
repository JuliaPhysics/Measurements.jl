export stdscore, weightedmean
using LinearAlgebra

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
stdscore(a::Measurement{S}, b::Measurement{T}) where {S<:AbstractFloat,T<:AbstractFloat} =
    stdscore(a - b, zero(promote_type(S, T)))

# Weighted Average with Inverse-Variance Weighting
"""
    weightedmean(iterable) -> measurement(weighted_mean, standard_deviation)

Return the weighted mean of measurements listed in `iterable`, using
inverse-variance weighting.  NOTA BENE: correlation is not taken into account.
"""
function weightedmean(iterable)
    v = [el.val for el in iterable]
    w = [inv(el.err)^2 for el in iterable]
    invsumw = inv(sum(w))
    return measurement(dot(v, w)*invsumw, sqrt(invsumw))
end

# Derivative and Gradient
derivative(a::Measurement{F},
           tag::Tuple{T, T, UInt64}) where {F<:AbstractFloat, T<:AbstractFloat} =
               get(a.der, tag, zero(F))

"""
    derivative(x::Measurement, y::Measurement)

Return the value of the partial derivative of `x` with respect to the
independent measurement `y`, calculated on the nominal value of `y`.  Return
zero if `x` does not depend on `y`.

Use `Measurements.derivative.(x, array)` to calculate the gradient of `x` with respect to an
array of independent measurements.
"""
derivative(a::Measurement, b::Measurement) =
    derivative(a, (b.val, b.err, b.tag))

# value and uncertainty
for (f, field) in ((:value, :val), (:uncertainty, :err))
    @eval begin
        ($f)(a::Measurement) = a.$field
        ($f)(a::Complex{<:Real}) = complex(($f)(a.re), ($f)(a.im))
    end
end
value(a::Real) = a
uncertainty(a::Real) = zero(a)

"""
    Measurements.value(x::Measurement)
    Measurements.value(x::Complex{Measurement})

Return the nominal value of measurement `x`.
"""
value

"""
    Measurements.uncertainty(x::Measurement)
    Measurements.uncertainty(x::Complex{Measurement})

Return the uncertainty of measurement `x`.
"""
uncertainty

"""
    Measurements.uncertainty_components(x::Measurement)

Return the components to the uncertainty of the dependent quantity `x` in the
form of a `Dict` for all the independent `Measurement`s from which `x` is
derived.

The key of each entry of the dictionary is the triplet (value, uncertainty, tag)
of an independent `Measurement`, and the value is the absolute value of the
product between its uncertainty and the partial derivative of `x` with respect
to this `Measurement`.
"""
function uncertainty_components(x::Measurement{T}) where {T<:AbstractFloat}
    out = Dict{Tuple{T, T, UInt64}, T}()
    for var in keys(x.der)
        out[var] = abs(var[2] * Measurements.derivative(x, var))
    end
    return out
end
