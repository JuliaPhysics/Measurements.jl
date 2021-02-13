### quadgk.jl
#
# Copyright (C) 2019 Mosè Giordano.
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
# This file integration with QuadGK.jl.
#
### Code:

# Helper functions to handle result of integration with QuadGK when endpoints are
# Measurement objects.

# The integral itself is a Measurement object, propagate its uncertainty.
quadgk_result(integral::Measurement, derivative::Real, a::Measurement) =
    result(integral.val, (1, derivative.val), (integral, a))
quadgk_result(integral::Measurement, derivatives::Tuple, a::Tuple) =
    result(integral.val, (1, value.(derivatives)...), (integral, a...))
# Only endpoints are are Measurement objects.
quadgk_result(integral::Real, derivative::Real, a::Measurement) =
    result(integral, derivative, a)
quadgk_result(integral::Real, derivatives::Tuple, a::Tuple) =
    result(integral, derivatives, a)

# Upper bound is a Measurement.  The derivative is f(b).
function QuadGK.quadgk(f, a::S, b::Measurement{T}; kws...) where {S,T<:AbstractFloat}
    F = promote_type(S, T)
    bval = b.val
    integral = QuadGK.quadgk(f, convert(F, a), convert(F, bval); kws...)
    return (quadgk_result(integral[1], f(bval), b), integral[2])
end

# Lower bound is a Measurement.  The derivative is -f(a).
function QuadGK.quadgk(f, a::Measurement{T}, b::S; kws...) where {S,T<:AbstractFloat}
    F = promote_type(S, T)
    aval = a.val
    integral = QuadGK.quadgk(f, convert(F, aval), convert(F, b); kws...)
    return (quadgk_result(integral[1], -f(aval), a), integral[2])
end

# Both bounds are Measurement's.  Derivatives are -f(a) and f(b).
function QuadGK.quadgk(f, a::Measurement{T}, b::Measurement{S};
                       kws...) where {T<:AbstractFloat,S<:AbstractFloat}
    F = promote_type(T, S)
    aval = a.val
    bval = b.val
    integral = QuadGK.quadgk(f, convert(F, aval), convert(F, bval); kws...)
    return (quadgk_result(integral[1], (-f(aval), f(bval)), (a, b)), integral[2])
end

# This shouldn't be needed in most cases, but when the extrema of an integral
# are numbers with uncertainty _and_ physical units (from Unitful.jl), the
# unitful property of the numbers is lost, leading to an inconsistency:
# <https://github.com/JuliaPhysics/Measurements.jl/issues/75>.
QuadGK.cachedrule(::Type{Measurement{T}}, n::Integer) where {T<:AbstractFloat} =
    QuadGK.cachedrule(T, n)
