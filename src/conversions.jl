### conversions.jl
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
# This file defines conversion and promotion rules involving Measurement
# objects.
#
### Code:

### Conversions

import Base: convert, float, promote_rule

## Independent Measurement

convert(::Type{IndependentMeasurement}, a::IndependentMeasurement) = a

convert{T<:AbstractFloat}(::Type{IndependentMeasurement{T}},
                          a::IndependentMeasurement{T}) = a

convert{T<:AbstractFloat}(::Type{IndependentMeasurement{T}},
                          a::IndependentMeasurement) =
                              IndependentMeasurement(T(a.val), T(a.err), a.tag)

convert(::Type{Measurement}, a::IndependentMeasurement) = a

convert{T<:AbstractFloat}(::Type{Measurement{T}}, a::IndependentMeasurement) =
    IndependentMeasurement{T}(a)

# Numbers.
convert{S}(::Type{IndependentMeasurement}, a::Rational{S}) = measurement(a)
convert{R<:Real}(::Type{IndependentMeasurement}, a::R) = measurement(a)
convert(::Type{Signed}, a::Measurement) = convert(Signed, a.val)

convert{T<:AbstractFloat}(::Type{IndependentMeasurement{T}}, a::Irrational) =
    measurement(T(a), zero(T))
convert{T<:AbstractFloat, S}(::Type{IndependentMeasurement{T}}, a::Rational{S}) =
    measurement(T(a), zero(T))
convert{T<:AbstractFloat,R<:Real}(::Type{IndependentMeasurement{T}}, a::R) =
    measurement(T(a), zero(T))

## Dependent Measurement

convert(::Type{DependentMeasurement}, a::DependentMeasurement) = a

convert{T<:AbstractFloat}(::Type{DependentMeasurement{T}},
                          a::DependentMeasurement{T}) = a

function convert{T<:AbstractFloat}(::Type{DependentMeasurement{T}},
                                   a::DependentMeasurement)
    newder = Derivatives{Tuple{T, T, Float64}, T}()
    for tag in keys(a.der)
        newder = Derivatives(newder, (T(tag[1]), T(tag[2]), tag[3])=>T(a.der[tag]))
    end
    DependentMeasurement(T(a.val), T(a.err), newder)
end

convert(::Type{DependentMeasurement}, a::IndependentMeasurement) =
    DependentMeasurement(a.val, a.err,
                         Derivatives((a.val,a.err,a.tag)=>one(a.val)))

function convert{T<:AbstractFloat}(::Type{DependentMeasurement{T}},
                                   a::IndependentMeasurement{T})
    return DependentMeasurement(a.val, a.err,
                                Derivatives((a.val,a.err,a.tag)=>one(T)))
end

function convert{T<:AbstractFloat}(::Type{DependentMeasurement{T}},
                                   a::IndependentMeasurement)
    val, err = T(a.val), T(a.err)
    return DependentMeasurement(val, err,
                                Derivatives((val,err,a.tag)=>one(T)))
end

convert(::Type{Measurement}, a::DependentMeasurement) = a

convert{T<:AbstractFloat}(::Type{Measurement{T}}, a::DependentMeasurement) =
    DependentMeasurement{T}(a)

# Numbers.
convert{S}(::Type{DependentMeasurement}, a::Rational{S}) =
    convert(DependentMeasurement, measurement(a))
convert{R<:Real}(::Type{DependentMeasurement}, a::R) =
    convert(DependentMeasurement, measurement(a))

convert{T<:AbstractFloat}(::Type{DependentMeasurement{T}}, a::Irrational) =
    convert(DependentMeasurement{T}, measurement(T(a), zero(T)))
convert{T<:AbstractFloat, S}(::Type{DependentMeasurement{T}}, a::Rational{S}) =
    convert(DependentMeasurement{T}, measurement(T(a), zero(T)))
convert{T<:AbstractFloat,R<:Real}(::Type{DependentMeasurement{T}}, a::R) =
    convert(DependentMeasurement{T}, measurement(T(a), zero(T)))



### To floating point

float{T<:AbstractFloat}(a::Measurement{T}) = a

### Promotion

# IndependentMeasurement + IndependentMeasurement = IndependentMeasurement
promote_rule{T<:AbstractFloat, S<:AbstractFloat}(::Type{IndependentMeasurement{T}},
                                                 ::Type{IndependentMeasurement{S}}) =
                                                     IndependentMeasurement{promote_type(T, S)}
# DependentMeasurement + DependentMeasurement = DependentMeasurement
promote_rule{T<:AbstractFloat, S<:AbstractFloat}(::Type{DependentMeasurement{T}},
                                                 ::Type{DependentMeasurement{S}}) =
                                                     DependentMeasurement{promote_type(T, S)}
# IndependentMeasurement + DependentMeasurement = DependentMeasurement
promote_rule{T<:AbstractFloat, S<:AbstractFloat}(::Type{IndependentMeasurement{T}},
                                                 ::Type{DependentMeasurement{S}}) =
                                                     DependentMeasurement{promote_type(T, S)}
# DependentMeasurement + IndependentMeasurement = DependentMeasurement
promote_rule{T<:AbstractFloat, S<:AbstractFloat}(::Type{DependentMeasurement{T}},
                                                 ::Type{IndependentMeasurement{S}}) =
                                                     DependentMeasurement{promote_type(T, S)}
# IndependentMeasurement + Real = IndependentMeasurement
promote_rule{T<:AbstractFloat, S<:Real}(::Type{IndependentMeasurement{T}}, ::Type{S}) =
    IndependentMeasurement{promote_type(T, S)}
# DependentMeasurement + Real = DependentMeasurement
promote_rule{T<:AbstractFloat, S<:Real}(::Type{DependentMeasurement{T}}, ::Type{S}) =
    DependentMeasurement{promote_type(T, S)}

### Complex numbers.
import Base: complex

# The implementation of log for complex numbers, does not accept a type
# T<:AbstractFloat for which typeof(log(::Complex{T}))!=Complex{T}, thus we have
# to promote any IndependentMeasurement to DependentMeasurement before creating
# a complex number.
complex{S<:AbstractFloat,T<:AbstractFloat}(a::Measurement{S}, b::Measurement{T}) =
    Complex{DependentMeasurement{promote_type(S, T)}}(a, b)
complex{T<:AbstractFloat}(a::IndependentMeasurement{T}) =
    Complex{DependentMeasurement{T}}(a)
