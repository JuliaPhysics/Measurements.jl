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
    weightedmean(iterable; dims=:) -> measurement(weighted_mean, standard_deviation)

Return the weighted mean of measurements listed in `iterable`, using
inverse-variance weighting. `dims` can be provided to compute the variance
over dimensions.
NOTA BENE: correlation is not taken into account.
"""
function weightedmean(iterable; dims=:)
    length(iterable) == 0 && return throw(ArgumentError("weightedmean: iterable must not be empty"))
    first(iterable) isa Measurement || throw(ArgumentError("weightedmean: iterable must contain Measurements"))
    T = gettype(iterable)

    if dims isa Colon
        out = mapreduce((a, b) -> map(.+, a, b), iterable; init=(zero(T), zero(T))) do el::Measurement
            w = inv(el.err)^2
            el.val * w, w
        end
        invsumw = inv(out[2])
        return measurement(out[1] * invsumw, sqrt(invsumw))
    end

    out = mapreduce((a, b) -> map(.+, a, b), iterable; dims=dims, init=(zero(T), zero(T))) do el::Measurement
        w = inv(el.err)^2
        el.val * w, w
    end
    invsumw = map(x -> inv(x[2]), out)
    return measurement.(map((x, y) -> y * x[1], out, invsumw), sqrt.(invsumw))
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
value(a::Missing) = missing
uncertainty(a::Missing) = missing


"""
    Measurements.value(x::Measurement)
    Measurements.value(x::Complex{Measurement})
    Measurements.value(x::Missing)

Return the nominal value of measurement `x`.
"""
value

"""
    Measurements.uncertainty(x::Measurement)
    Measurements.uncertainty(x::Complex{Measurement})
    Measurements.uncertainty(x::Missing)

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

"""
    Measurements.cov(x::AbstractVector{<:Measurement})

Returns the covariance matrix of a vector of correlated `Measurement`s.
"""
function cov(x::AbstractVector{Measurement{T}}) where T
    S = length(x)
    covariance_matrix = zeros(T, (S, S))

    for (ii, i) = enumerate(eachindex(x)), (jj, j) = Iterators.take(enumerate(eachindex(x)), ii)
        covariance_matrix[ii, jj] = cov(x[i], x[j])
    end

    return Symmetric(covariance_matrix, :L)
end

"""
    Measurements.cov(a::Measurement, b::Measurement)

Returns the (scalar) covariance between `Measurment`s `a` and `b`.
"""
function cov(a::Measurement{T}, b::Measurement{T}) where {T}
    overlap = keys(a.der) ∩ keys(b.der)
    return isempty(overlap) ? zero(T) : sum(overlap) do var
        a.der[var] * b.der[var] * var[2]^2
    end
end

"""
    Measurements.cor(x::AbstractVector{<:Measurement})

Returns the correlation matrix of a vector of correlated `Measurement`s.
"""
function cor(x::AbstractVector{<:Measurement})
    covariance_matrix = cov(x)
    standard_deviations = sqrt.(diag(covariance_matrix))
    return covariance_matrix ./ standard_deviations ./ standard_deviations'
end

"""
    Measurements.cor(a::Measurement, b::Measurement)

Returns the (scalar) correlation between `Measurment`s `a` and `b`.
"""
cor(a::Measurement, b::Measurement) = cov(a,b)/(a.err*b.err)

"""
    Measurements.correlated_values(
        nominal_values::AbstractVector{<:Real},
        covariance_matrix::AbstractMatrix{<:Real}
    )

Returns correlated `Measurement`s given their nominal values
and their covariance matrix.
"""
function correlated_values(
    nominal_values::AbstractVector{<:Real},
    covariance_matrix::AbstractMatrix{<:Real},
)
    standard_deviations = sqrt.(diag(covariance_matrix))

    standard_deviations_nonzero = deepcopy(standard_deviations)
    standard_deviations_nonzero[findall(iszero, standard_deviations_nonzero)] .= 1

    correlation_matrix = covariance_matrix ./ standard_deviations_nonzero ./ standard_deviations_nonzero'

    return correlated_values(nominal_values, standard_deviations, correlation_matrix)
end

"""
    Measurements.correlated_values(
        nominal_values::AbstractVector{<:Real},
        standard_deviations::AbstractVector{<:Real},
        correlation_matrix::AbstractMatrix{<:Real}
    )

Returns correlated `Measurement`s given their nominal values,
their standard deviations and their correlation matrix.
"""
function correlated_values(
    nominal_values::AbstractVector{<:Real},
    standard_deviations::AbstractVector{<:Real},
    correlation_matrix::AbstractMatrix{<:Real},
)
    eig = eigen(correlation_matrix)::Eigen{Float64}

    variances = eig.values

    # Inverse is equal to transpose for unitary matrices
    transform = eig.vectors'

    # Avoid numerical errors
    variances[findall(x -> x < eps(1.0), variances)] .= 0
    variables = map(variances) do variance
        measurement(0, sqrt(variance))
    end

    transform .*= standard_deviations'
    transform_columns = [view(transform,:,i) for i in axes(transform, 2)]

    values_funcs = [Measurements.result(n, t, variables) for (n, t) in zip(nominal_values, transform_columns)]

    return values_funcs
end
