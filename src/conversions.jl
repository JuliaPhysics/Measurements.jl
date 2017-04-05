### conversions.jl
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
# This file defines conversion and promotion rules involving Measurement
# objects.
#
### Code:

import Base: convert, promote_rule

convert{T<:AbstractFloat}(::Type{Measurement{T}}, a::Irrational) =
    measurement(T(a), zero(T))
convert{T<:AbstractFloat, S}(::Type{Measurement{T}}, a::Rational{S}) =
    measurement(T(a), zero(T))
convert{T<:AbstractFloat}(::Type{Measurement{T}}, a::Real) =
    measurement(T(a), zero(T))

function convert{T<:AbstractFloat}(::Type{Measurement{T}}, a::Measurement)
    newder = Derivatives{Tuple{T, T, Float64}, T}()
    for tag in keys(a.der)
        newder = Derivatives(newder, (T(tag[1]), T(tag[2]), tag[3])=>T(a.der[tag]))
    end
    Measurement(T(a.val), T(a.err), a.tag, newder)
end

convert(::Type{Measurement}, a::Measurement) = a
convert{S}(::Type{Measurement}, a::Rational{S}) = measurement(a)
convert(::Type{Measurement}, a::Real) = measurement(a)
convert(::Type{Signed}, a::Measurement) = convert(Signed, a.val)

promote_rule{T<:AbstractFloat, S<:Real}(::Type{Measurement{T}}, ::Type{S}) =
    Measurement{promote_type(T, S)}
promote_rule{T<:AbstractFloat, S<:AbstractFloat}(::Type{Measurement{T}}, ::Type{Measurement{S}}) =
    Measurement{promote_type(T, S)}
