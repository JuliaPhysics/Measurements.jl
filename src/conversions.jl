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

convert(::Type{Measurement{T}}, a::Irrational) where {T<:AbstractFloat} = measurement(T(a))
convert(::Type{Measurement{T}}, a::Rational{<:Integer}) where {T<:AbstractFloat} =
    measurement(T(a))
convert(::Type{Measurement{T}}, a::Real) where {T<:AbstractFloat} = measurement(T(a))

convert(::Type{Measurement{T}}, a::Measurement{T}) where {T<:AbstractFloat} = a
function convert(::Type{Measurement{T}}, a::Measurement{<:AbstractFloat}) where {T<:AbstractFloat}
    newder = empty_der2(zero(T))
    for tag in keys(a.der)
        newder = Derivatives(newder, (T(tag[1]), T(tag[2]), tag[3])=>T(a.der[tag]))
    end
    Measurement(T(a.val), T(a.err), a.tag, newder)
end

convert(::Type{Measurement}, a::Measurement) = a
convert(::Type{Measurement}, a::Rational{<:Integer}) = measurement(a)
convert(::Type{Measurement}, a::Real) = measurement(a)
convert(::Type{Signed}, a::Measurement) = convert(Signed, a.val)

promote_rule(::Type{Measurement{T}}, ::Type{S}) where {T<:AbstractFloat, S<:Real} =
    Measurement{promote_type(T, S)}
promote_rule(::Type{Measurement{T}}, ::Type{Measurement{S}}) where {T<:AbstractFloat, S<:AbstractFloat} =
    Measurement{promote_type(T, S)}
