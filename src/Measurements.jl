# This file is a part of Measurements.jl.  License is MIT "Expat".
# Copyright (C) 2016 Mosè Giordano.

module Measurements

# Functions to handle new type
import Base: show, convert, promote_rule, float
# Comparison and test operators
import Base: ==, isless, <, <=, isnan, isfinite, isinf
# Mathematical operations to be redefined
import Base: +, -, *, /, inv, ^, exp2, cos, sin, deg2rad, rad2deg, cosd, sind,
             cosh, sinh, tan, tand, tanh, acos, acosd, acosh, asin, asind,
             asinh, atan, atan2, atand, atanh, csc, cscd, csch, sec, secd, sech,
             cot, cotd, coth, exp, expm1, exp10, frexp, log, log10, log1p,
             hypot, sqrt, cbrt, abs, sign, copysign, zero, one, erf, erfc,
             factorial, gamma, lgamma, signbit, modf

export Measurement, ±, stdscore, weightedmean

# Useful constants
const logten = log(10)
const logtwo = log(2)
const twooversqrtpi = 2/sqrt(pi)

# Define the new type
immutable Measurement{T<:Real} <: Real
    val::T # The value
    err::T # The uncertainty, assumed to be standard deviation
end
# Constructors
Measurement(val::Real, err::Real) = Measurement(promote(val, err)...)
Measurement(value::Irrational) = Measurement(value, zero(float(value)))
Measurement(value::Real) = Measurement(value, zero(value))
const ± = Measurement

# Conversion and Promotion
convert{T<:Real}(::Type{Measurement{T}}, a::Irrational) =
    Measurement{T}(a, zero(float(a)))
convert{T<:Real}(::Type{Measurement{T}}, a::Real) =
    Measurement{T}(a, zero(a))
convert{T<:Real}(::Type{Measurement{T}}, a::Measurement) =
    Measurement{T}(a.val, a.err)
convert(::Type{Measurement}, a::Measurement) = a
convert(::Type{Measurement}, a::Real) = Measurement(a)

float{T<:AbstractFloat}(a::Measurement{T}) = a
float(a::Measurement) = Measurement(float(a.val), float(a.err))

promote_rule{T<:Real, S<:Real}(::Type{Measurement{T}}, ::Type{S}) =
    Measurement{promote_type(T, S)}
promote_rule{T<:Real, S<:Real}(::Type{Measurement{T}},
                                   ::Type{Measurement{S}}) =
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

##### Comparison and Test Operators
# Two measurements are equal if they have same value and same uncertainty.  XXX:
# Make two measurements equal if they are exaclty the same thing?  This can be
# done, for example, by adding another field with a random (or randn'om) value.
==(a::Measurement, b::Measurement) = (a.val==b.val && a.err==b.err)

# Comparison with Real: they are equal if the value of Measurement is equal to
# the number.  If you want to treat the Real like a measurement convert it with
# `Measurement'.
==(a::Measurement, b::Irrational) = a.val==float(b)
==(a::Measurement, b::Real) = a.val==b
==(a::Irrational, b::Measurement) = float(a)==b.val
==(a::Real, b::Measurement) = a==b.val

# Order relation is based on the value of measurements, uncertainties are ignored
<(a::Measurement, b::Measurement) = <(a.val, b.val)
<=(a::Measurement, b::Measurement) = <=(a.val, b.val)
isless(a::Measurement, b::Measurement) = isless(a.val, b.val)

isnan(a::Measurement) = isnan(a.val)
isfinite(a::Measurement) = isfinite(a.val)
isinf(a::Measurement) = isinf(a.val)

##### Mathematical Operations
# Addition: +
+(a::Measurement) = a
+(a::Measurement, b::Measurement) =
    Measurement(promote(a.val + b.val, hypot(a.err, b.err))...)
+(a::Real, b::Measurement) = +(Measurement(a), b)
+(a::Measurement, b::Real) = +(a, Measurement(b))

# Subtraction: -
-(a::Measurement) = Measurement(-a.val, a.err)
-(a::Measurement, b::Measurement) = a + (-b)
-(a::Real, b::Measurement) = -(Measurement(a), b)
-(a::Measurement, b::Real) = -(a, Measurement(b))

# Multiplication: *
function *(a::Measurement, b::Measurement)
    prod = a.val*b.val
    if prod == 0
        return Measurement(zero(prod))
    else
        return Measurement(promote(prod, abs(prod)*hypot(a.err*inv(a.val),
                                                         b.err*inv(b.val)))...)
    end
end
*(a::Bool, b::Measurement) = *(Measurement(a), b)
*(a::Measurement, b::Bool) = *(a, Measurement(b))
*(a::Real, b::Measurement) = *(Measurement(a), b)
*(a::Measurement, b::Real) = *(a, Measurement(b))

# Division: /
function /(a::Measurement, b::Measurement)
    div = a.val*inv(b.val)
    if div == 0
        return Measurement(zero(div))
    else
        return Measurement(promote(div, abs(div)*(hypot(a.err*inv(a.val),
                                                        b.err*inv(b.val))))...)
    end
end
/(a::Real, b::Measurement) = /(Measurement(a), b)
/(a::Measurement, b::Real) = /(a, Measurement(b))

# Inverse: inv
function inv(a::Measurement)
    inverse = inv(a.val)
    return Measurement(promote(inverse, inverse*inverse*a.err)...)
end

# signbit
signbit(a::Measurement) = signbit(a.val)

# Power: ^
function ^(a::Measurement, b::Measurement)
    if b == -1
        return inv(a)
    else
        pow = a.val^b.val
        return Measurement(promote(pow, hypot(pow*inv(a.val)*b.val*a.err,
                                              pow*log(a.val)*b.err))...)
    end
end
^{T<:Integer}(a::Measurement, b::T) = ^(a, Measurement(b))
^{T<:Rational}(a::Measurement, b::T) = ^(a, Measurement(b))
^{T<:Real}(a::Measurement,  b::T) = ^(a, Measurement(b))
^{T<:Integer}(a::T, b::Measurement) = ^(Measurement(a), b)
^(::Irrational{:e}, b::Measurement) = exp(b)
^(a::Irrational, b::Measurement) = Measurement(float(a))^b
^{T<:Real}(a::T,  b::Measurement) = ^(Measurement(a), b)

function exp2(a::Measurement)
    pow = exp2(a.val)
    return Measurement(promote(pow, abs(pow*logtwo*a.err))...)
end

# deg2rad and rad2deg
rad2deg(z::Measurement) = z*(180.0/pi)
deg2rad(z::Measurement) = z*(pi/180.0)

# Cosine: cos cosd cosh
cos(a::Measurement) =
    Measurement(promote(cos(a.val), abs(sin(a.val)*a.err))...)
cosd(a::Measurement) = cos(deg2rad(a))
cosh(a::Measurement) =
    Measurement(promote(cosh(a.val), abs(sinh(a.val)*a.err))...)

# Sine: sin sind sinh
sin(a::Measurement) =
    Measurement(promote(sin(a.val), abs(cos(a.val)*a.err))...)
sind(a::Measurement) = sin(deg2rad(a))
sinh(a::Measurement) =
    Measurement(promote(sinh(a.val), abs(cosh(a.val)*a.err))...)

# Tangent: tan tand tanh
function tan(a::Measurement)
    seca = sec(a.val)
    return Measurement(promote(tan(a.val), abs(seca*seca*a.err))...)
end
tand(a::Measurement) = tan(deg2rad(a))
function tanh(a::Measurement)
    secha = sech(a.val)
    return Measurement(promote(tanh(a.val), abs(secha*secha*a.err))...)
end

# Inverse trig functions: acos acosd acosh asin asind asinh atan atan2 atand atanh
acos(a::Measurement) =
    Measurement(promote(acos(a.val), abs(a.err*inv(sqrt(1.0 - a.val*a.val))))...)
acosd(a::Measurement) = rad2deg(acos(a))
acosh(a::Measurement) =
    Measurement(promote(acosh(a.val), abs(a.err*inv(sqrt(a.val*a.val - 1.0))))...)

asin(a::Measurement) =
    Measurement(promote(asin(a.val), abs(a.err*inv(sqrt(1.0 - a.val*a.val))))...)
asind(a::Measurement) = rad2deg(asin(a))
asinh(a::Measurement) =
    Measurement(promote(asinh(a.val), abs(a.err*inv(hypot(a.val, 1.0))))...)

atan(a::Measurement) =
    Measurement(promote(atan(a.val), abs(a.err*inv(a.val*a.val + 1.0)))...)
atand(a::Measurement) = rad2deg(atan(a))
atanh(a::Measurement) =
    Measurement(promote(atanh(a.val), abs(a.err*inv(1.0 - a.val*a.val)))...)
function atan2(a::Measurement, b::Measurement)
    invdenom = inv(a.val*a.val + b.val*b.val)
    return Measurement(promote(atan2(a.val, b.val),
                               hypot(a.err*b.val*invdenom,
                                     b.err*a.val*invdenom))...)
end
atan2(a::Measurement, b::Real) = atan2(a, Measurement(b))
atan2(a::Real, b::Measurement) = atan2(Measurement(a), b)

# Reciprocal trig functions: csc cscd csch sec secd sec cot cotd coth
function csc(a::Measurement)
    val = csc(a.val)
    return Measurement(promote(val, abs(a.err*val*cot(a.val)))...)
end
cscd(a::Measurement) = rad2deg(csc(a))
function csch(a::Measurement)
    val = csch(a.val)
    return Measurement(promote(val, abs(a.err*val*coth(a.val)))...)
end

function sec(a::Measurement)
    val = sec(a.val)
    return Measurement(promote(val, abs(a.err*val*tan(a.val)))...)
end
secd(a::Measurement) = rad2deg(sec(a))
function sech(a::Measurement)
    val = sech(a.val)
    return Measurement(promote(val, abs(a.err*val*tanh(a.val)))...)
end

function cot(a::Measurement)
    csca = csc(a.val)
    return Measurement(promote(cot(a.val), abs(a.err*csca*csca))...)
end
cotd(a::Measurement) = rad2deg(cot(a))
function coth(a::Measurement)
    cscha = csch(a.val)
    return Measurement(promote(coth(a.val), abs(a.err*cscha*cscha))...)
end

# Exponentials: exp, expm1, exp2, frexp
function exp(a::Measurement)
    val = exp(a.val)
    return Measurement(promote(val, abs(val*a.err))...)
end

expm1(a::Measurement) =
    Measurement(promote(expm1(a.val), abs(exp(a.val)*a.err))...)

function exp10(a::Measurement)
    val = exp10(a.val)
    return Measurement(promote(float(val), abs(logten*val*a.err))...)
end

function frexp(a::Measurement)
    x, y = frexp(a.val)
    return (Measurement(x, a.err/2^y), y)
end

# Logarithm: log
function log(a::Measurement, b::Measurement)
    val = log(a.val, b.val)
    loga = log(a.val)
    logb = val*loga # This should avoid some calculations
    return Measurement(promote(val, hypot(a.err*val*inv(a.val*loga),
                                          b.err*inv(loga*b.val)))...)
end
log(a::Measurement) = # Special case
    Measurement(promote(log(a.val), a.err*inv(a.val))...)
log10(a::Measurement) = # Special case
    Measurement(promote(log10(a.val), a.err*inv(logten*a.val))...)
log1p(a::Measurement) = # Special case
    Measurement(promote(log1p(a.val), a.err*inv(a.val + one(a.val)))...)
log(::Irrational{:e}, a::Measurement) = log(a)
log(a::Real, b::Measurement) = log(Measurement(a), b)
log(a::Irrational, b::Measurement) = log(float(a), b)
log(a::Measurement, b::Real) = log(a, Measurement(b))

# Hypotenuse: hypot
function hypot(a::Measurement, b::Measurement)
    val = hypot(a.val, b.val)
    return Measurement(promote(val, abs(hypot(a.val*a.err,
                                              b.val*b.err)*inv(val)))...)
end
hypot(a::Real, b::Measurement) = hypot(Measurement(a), b)
hypot(a::Measurement, b::Real) = hypot(a, Measurement(b))

# Square root: sqrt
function sqrt(a::Measurement)
    val = sqrt(a.val)
    return Measurement(promote(val, 0.5*a.err*inv(val))...)
end

# Cube root: cbrt
function cbrt(a::Measurement)
    val = cbrt(a.val)
    return Measurement(promote(val, a.err*val*inv(3.0*a.val))...)
end

# Absolute value: abs
abs(a::Measurement) = Measurement(promote(abs(a.val), a.err)...)

# Sign: sign copysign
sign(a::Measurement) = Measurement(sign(a.val))
copysign(a::Measurement, b::Measurement) =
    Measurement(copysign(a.val, b.val), a.err)
copysign(a::Measurement, b::Real) = copysign(a, Measurement(b))
copysign(a::Signed, b::Measurement) = copysign(Measurement(a), b)
copysign(a::Rational, b::Measurement) = copysign(Measurement(a), b)
copysign(a::Float32, b::Measurement) = copysign(Measurement(a), b)
copysign(a::Float64, b::Measurement) = copysign(Measurement(a), b)
copysign(a::Real, b::Measurement) = copysign(Measurement(a), b)

# Zero: zero
zero(a::Measurement) = Measurement(zero(a.val))

# One: one
one(a::Measurement) = Measurement(one(a.val))

# Error function: erf erfc
function erf(a::Measurement)
    aval = a.val
    return Measurement(promote(erf(aval),
                               twooversqrtpi*exp(-aval*aval)*a.err)...)
end
function erfc(a::Measurement)
    aval = a.val
    return Measurement(promote(erfc(aval),
                               twooversqrtpi*exp(-aval*aval)*a.err)...)
end

# Factorial and gamma: factorial gamma lgamma
function factorial(a::Measurement)
    aval = a.val
    fact = factorial(aval)
    return Measurement(promote(fact,
                               abs(fact*a.err*polygamma(0, aval + one(aval))))...)
end
function gamma(a::Measurement)
    aval = a.val
    Γ = gamma(aval)
    return Measurement(promote(Γ,
                               abs(Γ*a.err*polygamma(0, aval)))...)
end
function lgamma(a::Measurement)
    aval = a.val
    return Measurement(promote(lgamma(aval),
                               abs(a.err*polygamma(0, aval)))...)
end

# Modulo: modf
function modf(a::Measurement)
    frac, int = modf(a.val)
    return (Measurement(frac, a.err), int)
end

end # module
