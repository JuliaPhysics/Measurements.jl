### math.jl
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
# This file contains definition of mathematical functions that support
# Measurement objects.
#
# Note: some functions defined here (like all degree-related and reciprocal
# trigonometric functions, fld, cld, hypot, cbrt, abs, mod) are redundant in the
# sense that you would get the correct result also without their definitions,
# but having them defined here avoids some calculations and slightly improves
# performance.  Likewise, multiple methods are provided for functions taking two
# (or more) arguments because when only one argument is of Measurement type we
# can use the simple `result' function for one derivative that is faster than
# the generic method.
#
### Code:

# Here we use and extend some methods defined in the following modules.
using SpecialFunctions, QuadGK

export @uncertain

# This function is to be used by methods of mathematical operations to produce a
# `Measurement' object in output.  Arguments are:
#   * val: the nominal result of operation G(a)
#   * der: the derivative ∂G/∂a of G with respect to the variable a
#   * a: the only argument of G
# In this simple case of unary function, we don't have the problem of correlated
# variables (thus making this method much faster than the next one), so we can
# calculate the uncertainty of G(a) as
#   σ_G = |σ_a·∂G/∂a|
# The list of derivatives with respect to each measurement is updated with
#   ∂G/∂a · previous_derivatives
@inline function result(val::Real, der::Real, a::Measurement{<:AbstractFloat})
    newder = empty_der1(a)
    @inbounds for tag in keys(a.der)
        if ! iszero(tag[2]) # Skip values with 0 uncertainty
            newder = Derivatives(newder, tag=>der*a.der[tag])
        end
    end
    # If uncertainty of "a" is null, the uncertainty of result is null as well,
    # even if the derivative is NaN or infinite.  In any other case, use
    # σ_G = |σ_a·∂G/∂a|.
    σ = iszero(a.err) ? a.err : abs(der*a.err)
    # The tag is NaN because we don't care about tags of derived quantities, we
    # are only interested in independent ones.
    Measurement(val,  σ, NaN, newder)
end

# Get the common type parameter of a collection of Measurement objects.  The first two
# methods are for the trivial cases of homogeneous tuples and arrays, the last, inefficient,
# method is for inhomogeneous collections (probably the least common case).
gettype(::Tuple{Vararg{Measurement{T}}}) where {T<:AbstractFloat} = T
gettype(::AbstractArray{Measurement{T}}) where {T<:AbstractFloat} = T
_eltype(::Measurement{T}) where {T<:AbstractFloat} = T
gettype(collection) = promote_type(_eltype.(collection)...)

# This function is similar to the previous one, but applies to mathematical
# operations with more than one argument, so the formula to propagate
# uncertainty is more complicated because we have to take into account
# correlation between arguments.  The arguments are the same as above, but `der'
# and `a' are tuples of the same length (`der' has the derivatives of G with
# respect to the corresponding variable in `a').
#
# Suppose we have a function G = G(a1, a2) of two arguments.  a1 and a2 are
# correlated, because they come from some mathematical operations on really
# independent variables x, y, z, say a1 = a1(x, y), a2 = a2(x, z).  The
# uncertainty on G(a1, a2) is calculated as follows:
#   σ_G = sqrt((σ_x·∂G/∂x)^2 + (σ_y·∂G/∂y)^2 + (σ_z·∂G/∂z)^2)
# where ∂G/∂x is the partial derivative of G with respect to x, and so on.  We
# can expand the previous formula to:
#   σ_G = sqrt((σ_x·(∂G/∂a1·∂a1/∂x + ∂G/∂a2·∂a2/∂x))^2 + (σ_y·∂G/∂a1·∂a1/∂y)^2 +
#               + (σ_z·∂G/∂a2·∂a2/∂z)^2)
@inline function result(val, der, a)
    @assert length(der) == length(a)
    T = gettype(a)
    nil::T = zero(T)
    err = nil
    newder = empty_der2(nil)
    # Iterate over all independent variables.  We first iterate over all
    # variables listed in `a' in order to get all independent variables upon
    # which those variables depend, then we get the `tag' of each independent
    # variable, skipping variables that have been already taken into account.
    @inbounds for y in a
        for tag in keys(y.der)
            if tag ∉ keys(newder) # Skip independent variables already considered
                σ_x = tag[2]
                if ! iszero(σ_x)  # Skip values with 0 uncertainty
                    ∂G_∂x::T = nil
                    # Iteratate over all the arguments of the function
                    for (i, x) in enumerate(a)
                        # Calculate the derivative of G with respect to the
                        # current independent variable.  In the case of the x
                        # independent variable of the example above, we should
                        # get   ∂G/∂x = ∂G/∂a1·∂a1/∂x + ∂G/∂a2·∂a2/∂x
                        ∂a_∂x = derivative(x, tag) # ∂a_i/∂x
                        if ! iszero(∂a_∂x) # Skip values with 0 partial derivative
                            # der[i] = ∂G/∂a_i
                            ∂G_∂x = ∂G_∂x + der[i]*∂a_∂x
                        end
                    end
                    if ! iszero(∂G_∂x)
                        # Add (σ_x·∂G/∂x)^2 to the total uncertainty (squared), but only if
                        # the derivative is not zero.
                        newder = Derivatives(newder, tag=>∂G_∂x)
                        err = err + abs2(σ_x*∂G_∂x)
                    end
                end
            end
        end
    end
    return Measurement(T(val), sqrt(err), NaN, newder)
end

# "result" function for complex-valued functions (like "besselh").  This takes
# the same argument as the first implementation of "result", but with complex
# "val" and "der".
function result(val::Complex, der::Complex, a::Measurement)
    return complex(result(real(val), real(der), a), result(imag(val), imag(der), a))
end

### @uncertain macro.
"""
    @uncertain f(value ± stddev, ...)

A macro to calculate \$f(value) ± uncertainty\$, with \$uncertainty\$ derived
from \$stddev\$ according to rules of linear error propagation theory.

Function \$f\$ can accept any number of real arguments, the type of the
arguments provided must be `Measurement`.
"""
macro uncertain(expr::Expr)
    f = esc(expr.args[1]) # Function name
    n = length(expr.args) - 1
    if n == 1
        a = esc(expr.args[2]) # Argument, of Measurement type
        return :( result($f($a.val), Calculus.derivative($f, $a.val), $a) )
    else
        a = expr.args[2:end] # Arguments, as an array of expressions
        args = :([])  # Build up array of arguments
        [push!(args.args, :($(esc(a[i])))) for i=1:n] # Fill the array
        argsval =:([])  # Build up the array of values of arguments
        [push!(argsval.args, :($(args.args[i]).val)) for i=1:n] # Fill the array
        return :( result($f($argsval...),
                         (Calculus.gradient(x -> $f(x...), $argsval)...),
                         ($args...)) )
    end
end

### Elementary arithmetic operations:
import Base: +, -, *, /, div, inv, fld, cld

# Addition: +
+(a::Measurement, b::Measurement) = result(a.val + b.val, (1, 1), (a, b))
+(a::Real, b::Measurement) = result(a + b.val, 1, b)
+(a::Measurement, b::Bool) = result(a.val +b, 1, a)
+(a::Measurement, b::Real) = result(a.val + b, 1, a)

# Subtraction: -
-(a::Measurement) = result(-a.val, -1, a)
-(a::Measurement, b::Measurement) = result(a.val - b.val, (1, -1), (a, b))
-(a::Real, b::Measurement) = result(a - b.val, -1, b)
-(a::Measurement, b::Real) = result(a.val - b, 1, a)

# Multiplication: *
function *(a::Measurement, b::Measurement)
    aval = a.val
    bval = b.val
    return result(aval*bval, (bval, aval), (a, b))
end
*(a::Bool, b::Measurement) = result(a*b.val, a, b)
*(a::Real, b::Measurement) = result(a*b.val, a, b)
*(a::Measurement, b::Bool) = result(a.val*b, b, a)
*(a::Measurement, b::Real) = result(a.val*b, b, a)

# muladd and fma
import Base: muladd, fma

for f in (:fma, :muladd)
    @eval begin
        # All three arguments are Measurement
        function ($f)(a::Measurement, b::Measurement, c::Measurement)
            x = a.val
            y = b.val
            z = c.val
            return result(($f)(x, y, z), (y, x, one(z)), (a, b, c))
        end

        # First argument is always Measurement
        function ($f)(a::Measurement, b::Measurement, c::Real)
            x = a.val
            y = b.val
            return result(($f)(x, y, c), (y, x), (a, b))
        end

        function ($f)(a::Measurement, b::Real, c::Measurement)
            x = a.val
            z = c.val
            return result(($f)(x, b, z), (b, one(z)), (a, c))
        end

        ($f)(a::Measurement, b::Real, c::Real) =
            result(($f)(a.val, b, c), b, a)

        # Secon argument is always Measurement
        function ($f)(a::Real, b::Measurement, c::Measurement)
            y = b.val
            z = c.val
            return result(($f)(a, y, z), (a, one(z)), (b, c))
        end

        ($f)(a::Real, b::Measurement, c::Real) =
            result(($f)(a, b.val, c), a, b)

        # Third argument is Measurement
        function ($f)(a::Real, b::Real, c::Measurement)
            z = c.val
            return result(($f)(a, b, z), one(z), c)
        end
    end
end

# Division: /, div, fld, cld
function /(a::Measurement, b::Measurement)
    x = a.val
    y = b.val
    oneovery = 1 / y
    return result(x / y, (oneovery, -x * abs2(oneovery)), (a, b))
end
/(a::Real, b::Measurement) = result(a/b.val, -a/abs2(b.val), b)
/(a::Measurement, b::Real) = result(a.val/b, 1/b, a)

# 0.0 as partial derivative for both arguments of "div", "fld", "cld" should be
# correct for most cases.  This has been tested against "@uncertain" macro.
div(a::Measurement, b::Measurement) = result(div(a.val, b.val), (0, 0), (a, b))
div(a::Measurement, b::Real) = result(div(a.val, b), 0, a)
div(a::Real, b::Measurement) = result(div(a, b.val), 0, b)

fld(a::Measurement, b::Measurement) = result(fld(a.val, b.val), (0, 0), (a, b))
fld(a::Measurement, b::Real) = result(fld(a.val, b), 0, a)
fld(a::Real, b::Measurement) = result(fld(a, b.val), 0, b)

cld(a::Measurement, b::Measurement) = result(cld(a.val, b.val), (0, 0), (a, b))
cld(a::Measurement, b::Real) = result(cld(a.val, b), 0, a)
cld(a::Real, b::Measurement) = result(cld(a, b.val), 0, b)

# Inverse: inv
function inv(a::Measurement)
    inverse = inv(a.val)
    return result(inverse, -abs2(inverse), a)
end

# signbit
import Base: signbit

signbit(a::Measurement) = signbit(a.val)

# Power: ^
import Base: ^, exp2

function ^(a::Measurement, b::Measurement)
    aval = a.val
    bval = b.val
    pow = aval^bval
    return result(pow, (aval^(bval - 1)*bval, pow*log(aval)), (a, b))
end

function ^(a::Measurement, b::Integer)
    x = a.val
    return result(x ^ b, b * x ^ (b - 1), a)
end

function ^(a::Measurement{T},  b::Rational) where {T<:AbstractFloat}
    x = a.val
    return result(x ^ b, b * x ^ (b - one(T)), a)
end

function ^(a::Measurement,  b::Real)
    x = a.val
    return result(x ^ b, b * x ^ (b - 1), a)
end

^(::Irrational{:e}, b::Measurement) = exp(b)

function ^(a::Real,  b::Measurement)
    res = a^b.val
    return result(res, res*log(a), b)
end

function exp2(a::Measurement{T}) where {T<:AbstractFloat}
    pow = exp2(a.val)
    return result(pow, pow*log(T(2)), a)
end

### Trigonometric functions

# deg2rad, rad2deg
import Base: deg2rad, rad2deg

deg2rad(a::Measurement) = a * (oftype(a.val, pi) / 180)
rad2deg(a::Measurement) = a * (180 / oftype(a.val, pi))

# Cosine: cos, cosd, cosh
import Base: cos, cosd, cosh

function cos(a::Measurement)
    aval = a.val
    result(cos(aval), -sin(aval), a)
end

function cosd(a::Measurement)
    aval = a.val
    return result(cosd(aval), -deg2rad(sind(aval)), a)
end

function cosh(a::Measurement)
    aval = a.val
    result(cosh(aval), sinh(aval), a)
end

# Sine: sin, sind, sinh
import Base: sin, sind, sinh

function sin(a::Measurement)
    aval = a.val
    result(sin(aval), cos(aval), a)
end

function sind(a::Measurement)
    aval = a.val
    return result(sind(aval), deg2rad(cosd(aval)), a)
end

function sinh(a::Measurement)
    aval = a.val
    result(sinh(aval), cosh(aval), a)
end

# Tangent: tan, tand, tanh
import Base: tan, tand, tanh

function tan(a::Measurement)
    aval = a.val
    return result(tan(aval), abs2(sec(aval)), a)
end

function tand(a::Measurement)
    aval = a.val
    return result(tand(aval), deg2rad(abs2(secd(aval))), a)
end

function tanh(a::Measurement)
    aval = a.val
    return result(tanh(aval), abs2(sech(aval)), a)
end

# Pi-related functions: sinpi, cospi
import Base: sinpi, cospi

function sinpi(a::Measurement)
    x = a.val
    return result(sinpi(x), cospi(x) * pi, a)
end

function cospi(a::Measurement)
    x = a.val
    return result(cospi(x), -sinpi(x) * pi, a)
end

# Inverse trig functions: acos, acosd, acosh, asin, asind, asinh, atan, atand,
# atan2, atanh
import Base: acos, acosd, acosh, asin, asind, asinh, atan, atand, atan2, atanh

function acos(a::Measurement{T}) where {T<:AbstractFloat}
    aval = a.val
    return result(acos(aval), -inv(sqrt(one(T) - abs2(aval))), a)
end

function acosd(a::Measurement{T}) where {T<:AbstractFloat}
    aval = a.val
    return result(acosd(aval), -rad2deg(inv(sqrt(one(T) - abs2(aval)))), a)
end

function acosh(a::Measurement{T}) where {T<:AbstractFloat}
    aval = a.val
    return result(acosh(aval), inv(sqrt(abs2(aval) - one(T))), a)
end

function asin(a::Measurement{T}) where {T<:AbstractFloat}
    aval = a.val
    return result(asin(aval), inv(sqrt(one(T) - abs2(aval))), a)
end

function asind(a::Measurement{T}) where {T<:AbstractFloat}
    aval = a.val
    return result(asind(aval), rad2deg(inv(sqrt(one(T) - abs2(aval)))), a)
end

function asinh(a::Measurement{T}) where {T<:AbstractFloat}
    aval = a.val
    return result(asinh(aval), inv(hypot(aval, one(T))), a)
end

function atan(a::Measurement{T}) where {T<:AbstractFloat}
    aval = a.val
    return result(atan(aval), inv(abs2(aval) + one(T)), a)
end

function atand(a::Measurement{T}) where {T<:AbstractFloat}
    aval = a.val
    return result(atand(aval), rad2deg(inv(abs2(aval) + one(T))), a)
end

function atanh(a::Measurement{T}) where {T<:AbstractFloat}
    aval = a.val
    return result(atanh(aval), inv(one(T) - abs2(aval)), a)
end

function atan2(a::Measurement, b::Measurement)
    aval = a.val
    bval = b.val
    denom = abs2(aval) + abs2(bval)
    return result(atan2(aval, bval),
                  (bval / denom, -aval / denom),
                  (a, b))
end

function atan2(a::Measurement, b::Real)
    x = a.val
    return result(atan2(x, b), -b/(abs2(x) + abs2(b)), a)
end

function atan2(a::Real, b::Measurement)
    y = b.val
    return result(atan2(a, y), -a/(abs2(a) + abs2(y)), b)
end

# Reciprocal trig functions: csc, cscd, csch, sec, secd, sech, cot, cotd, coth
import Base: csc, cscd, csch, sec, secd, sech, cot, cotd, coth

function csc(a::Measurement)
    aval = a.val
    val = csc(aval)
    return result(val, -val*cot(aval), a)
end

function cscd(a::Measurement)
    aval = a.val
    val = cscd(aval)
    return result(val, -deg2rad(val*cotd(aval)), a)
end

function csch(a::Measurement)
    aval = a.val
    val = csch(aval)
    return result(val, -val*coth(aval), a)
end

function sec(a::Measurement)
    aval = a.val
    val = sec(aval)
    return result(val, val*tan(aval), a)
end

function secd(a::Measurement)
    aval = a.val
    val = secd(aval)
    return result(val, deg2rad(val*tand(aval)), a)
end

function sech(a::Measurement)
    aval = a.val
    val = sech(aval)
    return result(val, val*tanh(aval), a)
end

function cot(a::Measurement)
    aval = a.val
    return result(cot(aval), -abs2(csc(aval)), a)
end

function cotd(a::Measurement)
    aval = a.val
    return result(cotd(aval), -deg2rad(abs2(cscd(aval))), a)
end

function coth(a::Measurement)
    aval = a.val
    return result(coth(aval), -abs2(csch(aval)), a)
end

### Exponential-related

# Exponentials: exp, expm1, exp10, frexp, ldexp
import Base: exp, expm1, exp10, frexp, ldexp

function exp(a::Measurement)
    val = exp(a.val)
    return result(val, val, a)
end

function expm1(a::Measurement)
    aval = a.val
    return result(expm1(aval), exp(aval), a)
end

function exp10(a::Measurement{T}) where {T<:AbstractFloat}
    val = exp10(a.val)
    return result(val, log(T(10))*val, a)
end

function frexp(a::Measurement)
    x, y = frexp(a.val)
    return (result(x, inv(exp2(y)), a), y)
end

ldexp(a::Measurement{T}, e::Integer) where {T<:AbstractFloat} =
    result(ldexp(a.val, e), ldexp(one(T), e), a)

# Logarithms
import Base: log, log2, log10, log1p

function log(a::Measurement, b::Measurement)
    aval = a.val
    bval = b.val
    val = log(aval, bval)
    loga = log(aval)
    return result(val, (-val / (aval * loga), 1 / (loga * bval)), (a, b))
end

function log(a::Measurement) # Special case
    aval = a.val
    return result(log(aval), inv(aval), a)
end

function log2(a::Measurement{T}) where {T<:AbstractFloat} # Special case
    x = a.val
    return result(log2(x), inv(log(T(2)) * x), a)
end

function log10(a::Measurement{T}) where {T<:AbstractFloat} # Special case
    aval = a.val
    return result(log10(aval), inv(log(T(10)) * aval), a)
end

function log1p(a::Measurement{T}) where {T<:AbstractFloat} # Special case
    aval = a.val
    return result(log1p(aval), inv(aval + one(T)), a)
end

log(::Irrational{:e}, a::Measurement) = log(a)

function log(a::Real, b::Measurement{T}) where {T<:AbstractFloat}
    bval = b.val
    return result(log(a, bval), inv(log(a) * bval), b)
end

function log(a::Measurement, b::Real)
    aval = a.val
    res = log(aval, b)
    return result(res, -res/(aval*log(aval)), a)
end

# Hypotenuse: hypot
import Base: hypot

function hypot(a::Measurement, b::Measurement)
    aval = a.val
    bval = b.val
    val = hypot(aval, bval)
    return result(val,
                  (aval / val, bval / val),
                  (a, b))
end

function hypot(a::Real, b::Measurement)
    bval = b.val
    res = hypot(a, bval)
    return result(res, bval / res, b)
end

function hypot(a::Measurement, b::Real)
    aval = a.val
    res = hypot(aval, b)
    return result(res, aval / res, a)
end

# Square root: sqrt
import Base: sqrt

function sqrt(a::Measurement)
    val = sqrt(a.val)
    return result(val, inv(2 * val), a)
end

# Cube root: cbrt
import Base: cbrt

function cbrt(a::Measurement)
    aval = a.val
    val = cbrt(aval)
    return result(val, val / (3 * aval), a)
end

### Absolute value, sign and the likes

# Absolute value
import Base: abs, abs2

function abs(a::Measurement)
    aval = a.val
    return result(abs(aval), copysign(1, aval), a)
end

function abs2(a::Measurement)
    x = a.val
    return result(abs2(x), 2*x, a)
end

# Sign: sign, copysign, flipsign
import Base: sign, copysign, flipsign

sign(a::Measurement) = result(sign(a.val), 0, a)

copysign(a::Measurement, b::Measurement) = ifelse(signbit(a)!=signbit(b), -a, a)
copysign(a::Measurement, b::Real)        = ifelse(signbit(a)!=signbit(b), -a, a)
flipsign(a::Measurement, b::Measurement) = ifelse(signbit(b), -a, a)
flipsign(a::Measurement, b::Real)        = ifelse(signbit(b), -a, a)
for T in (Signed, Rational, Float32, Float64, Real)
    @eval copysign(a::$T, b::Measurement) = copysign(a, b.val)
    @eval flipsign(a::$T, b::Measurement) = flipsign(a, b.val)
end

### Special functions

# Error function: erf, erfinv, erfc, erfcinv, erfcx, erfi, dawson
import Base: erf, erfinv, erfc, erfcinv, erfcx, erfi, dawson

function erf(a::Measurement{T}) where {T<:AbstractFloat}
    aval = a.val
    return result(erf(aval), 2*exp(-abs2(aval))/sqrt(T(pi)), a)
end

function erfinv(a::Measurement{T}) where {T<:AbstractFloat}
    res = erfinv(a.val)
    # For the derivative, see http://mathworld.wolfram.com/InverseErf.html
    return result(res, sqrt(T(pi)) * exp(abs2(res)) / 2, a)
end

function erfc(a::Measurement{T}) where {T<:AbstractFloat}
    aval = a.val
    return result(erfc(aval), -2*exp(-abs2(aval))/sqrt(T(pi)), a)
end

function erfcinv(a::Measurement{T}) where {T<:AbstractFloat}
    res = erfcinv(a.val)
    # For the derivative, see http://mathworld.wolfram.com/InverseErfc.html
    return result(res, -sqrt(T(pi)) * exp(abs2(res)) / 2, a)
end

function erfcx(a::Measurement{T}) where {T<:AbstractFloat}
    aval = a.val
    res = erfcx(aval)
    return result(res, 2 * (aval * res - inv(sqrt(T(pi)))), a)
end

function erfi(a::Measurement{T}) where {T<:AbstractFloat}
    aval = a.val
    return result(erfi(aval), 2*exp(abs2(aval))/sqrt(T(pi)), a)
end

function dawson(a::Measurement{T}) where {T<:AbstractFloat}
    aval = a.val
    res = dawson(aval)
    return result(res, one(T) - 2 * aval * res, a)
end

# Factorial and gamma
import Base: factorial, gamma, lgamma, digamma, invdigamma, trigamma, polygamma

function factorial(a::Measurement)
    aval = a.val
    fact = factorial(aval)
    return result(fact, fact*digamma(aval + one(aval)), a)
end

function gamma(a::Measurement)
    aval = a.val
    Γ = gamma(aval)
    return result(Γ, Γ*digamma(aval), a)
end

function lgamma(a::Measurement)
    aval = a.val
    return result(lgamma(aval), digamma(aval), a)
end

function digamma(a::Measurement)
    aval = a.val
    return result(digamma(aval), trigamma(aval), a)
end

function invdigamma(a::Measurement)
    aval = a.val
    res = invdigamma(aval)
    return result(res, inv(trigamma(res)), a)
end

function trigamma(a::Measurement)
    aval = a.val
    return result(trigamma(aval), polygamma(2, aval), a)
end

function polygamma(n::Integer, a::Measurement)
    aval = a.val
    return result(polygamma(n, aval), polygamma(n + 1, aval), a)
end

# Beta function: beta, lbeta
import Base: beta, lbeta

function beta(a::Measurement, b::Measurement)
    aval = a.val
    bval = b.val
    res = beta(aval, bval)
    return result(res,
                  (res*(digamma(aval) - digamma(aval + bval)),
                   res*(digamma(bval) - digamma(aval + bval))),
                  (a, b))
end

function beta(a::Measurement, b::Real)
    aval = a.val
    res = beta(aval, b)
    return result(res, res*(digamma(aval) - digamma(aval + b)), a)
end

beta(a::Real, b::Measurement) = beta(b, a)

function lbeta(a::Measurement, b::Measurement)
    aval = a.val
    bval = b.val
    return result(lbeta(aval, bval),
                  (digamma(aval) - digamma(aval + bval),
                   digamma(bval) - digamma(aval + bval)),
                  (a, b))
end

function lbeta(a::Measurement, b::Real)
    aval = a.val
    return result(lbeta(aval, b), digamma(aval) - digamma(aval + b), a)
end

lbeta(a::Real, b::Measurement) = lbeta(b, a)

# Airy functions
import Base: airyai, airyaiprime, airybi, airybiprime

for f in (:airyai, :airybi)
    der = Symbol(string(f) * "prime")
    @eval begin
        function $f(a::Measurement)
            x = a.val
            return result($f(x), $der(x), a)
        end
        function $der(a::Measurement)
            x = a.val
            # Use Airy equation: y'' - xy = 0 => y'' = xy
            return result($der(x), x * $f(x), a)
        end
    end
end

# Bessel functions
import Base: besselj0, besselj1, besselj, bessely0, bessely1, bessely, besselh,
besseli, besselix, besselk, besselkx

function besselj0(a::Measurement)
    x = a.val
    return result(besselj0(x), -besselj1(x), a)
end

function besselj1(a::Measurement)
    x = a.val
    return result(besselj1(x), (besselj0(x) - besselj(2, x)) / 2, a)
end

# XXX: I don't know a closed form expression for the derivative with respect to
# first argument of J_n.  Arguably, there will be more cases where the
# measurement is the second argument, than the first one.  In any case, you can
# use "@uncertain" macro when both arguments are of Measurement type.
function besselj(nu::Real, a::Measurement)
    x = a.val
    return result(besselj(nu, x), (besselj(nu - 1, x) - besselj(nu + 1, x)) / 2, a)
end

function bessely0(a::Measurement)
    x = a.val
    return result(bessely0(x), -bessely1(x), a)
end

function bessely1(a::Measurement)
    x = a.val
    return result(bessely1(x), (bessely0(x) - bessely(2, x)) / 2, a)
end

# XXX: I don't know a closed form expression for the derivative with respect to
# first argument of y_n, see comments about "besselj".
function bessely(nu::Real, a::Measurement)
    x = a.val
    return result(bessely(nu, x), (bessely(nu - 1, x) - bessely(nu + 1, x)) / 2, a)
end

function besselh(nu::Real, k::Integer, a::Measurement)
    x = a.val
    return result(besselh(nu, k, x),
                  (besselh(nu - 1, k, x) - besselh(nu + 1, k, x)) / 2,
                  a)
end

function besseli(nu::Real, a::Measurement)
    x = a.val
    return result(besseli(nu, x), (besseli(nu - 1, x) + besseli(nu + 1, x)) / 2, a)
end

function besselix(nu::Real, a::Measurement)
    x = a.val
    return result(besselix(nu, x),
                  (besseli(nu - 1, x) + besseli(nu + 1, x)) * exp(-abs(x)) / 2 -
                  besseli(nu, x)*sign(x)*exp(-abs(x)),
                  a)
end

function besselk(nu::Real, a::Measurement)
    x = a.val
    return result(besselk(nu, x), -(besselk(nu - 1, x) + besselk(nu + 1, x)) / 2, a)
end

function besselkx(nu::Real, a::Measurement)
    x = a.val
    return result(besselkx(nu, x),
                  -(besselk(nu - 1, x) + besselk(nu + 1, x)) * exp(x) / 2 +
                  besselk(nu, x)*exp(x),
                  a)
end

### Modulo

import Base: mod, rem, mod2pi

# Use definition of "mod" function:
# http://docs.julialang.org/en/stable/manual/mathematical-operations/#division-functions
mod(a::Measurement, b::Measurement) = a - fld(a, b)*b
mod(a::Measurement, b::Real) = result(mod(a.val, b), 1, a)
mod(a::Real, b::Measurement) = result(mod(a, b.val), -fld(a, b.val), b)

# Use definition of "rem" function:
# http://docs.julialang.org/en/stable/manual/mathematical-operations/#division-functions
rem(a::Measurement, b::Measurement) = a - div(a, b)*b
rem(a::Measurement, b::Real) = result(rem(a.val, b), 1, a)
rem(a::Real, b::Measurement) = result(rem(a, b.val), -div(a, b.val), b)

mod2pi(a::Measurement) = result(mod2pi(a.val), 1, a)

### Machine precision

import Base: eps, nextfloat, maxintfloat, typemax

eps(::Type{Measurement{T}}) where {T<:AbstractFloat} = eps(T)
eps(a::Measurement) = eps(a.val)

nextfloat(a::Measurement) = nextfloat(a.val)
nextfloat(a::Measurement, n::Integer) = nextfloat(a.val, n)

maxintfloat(::Type{Measurement{T}}) where {T<:AbstractFloat} = maxintfloat(T)

typemax(::Type{Measurement{T}}) where {T<:AbstractFloat} = typemax(T)

### Rounding
import Base: round, floor, ceil, trunc

round(a::Measurement) = measurement(round(value(a)), round(uncertainty(a)))
round(a::Measurement, digits::Integer, base::Integer=10) =
    measurement(round(value(a), digits, base),
                round(uncertainty(a), digits, base))
round(::Type{T}, a::Measurement) where {T<:Integer} = round(T, a.val)
floor(a::Measurement) = measurement(floor(a.val))
floor(::Type{T}, a::Measurement) where {T<:Integer} = floor(T, a.val)
ceil(a::Measurement) = measurement(ceil(a.val))
ceil(::Type{T}, a::Measurement) where {T<:Integer} = ceil(Integer, a.val)
trunc(a::Measurement) = measurement(trunc(a.val))
trunc(::Type{T}, a::Measurement) where {T<:Integer} = trunc(T, a.val)

# Widening
import Base: widen

widen(::Type{Measurement{T}}) where {T<:AbstractFloat} = Measurement{widen(T)}

# To big float
import Base: big

big(::Type{Measurement}) = Measurement{BigFloat}
big(::Type{Measurement{T}}) where {T<:AbstractFloat} = Measurement{BigFloat}
big(x::Measurement{<:AbstractFloat}) = convert(Measurement{BigFloat}, x)
big(x::Complex{Measurement{<:AbstractFloat}}) = convert(Complex{Measurement{BigFloat}}, x)

# Sum and prod
import Base: sum, prod

# This definition is not strictly needed, because `sum' works out-of-the-box
# with Measurement type, but this makes the function linear instead of quadratic
# in the number of arguments, but `result' is quadratic in the number of
# arguments, so in the end the function goes from cubic to quadratic.  Still not
# ideal, but this is an improvement.
sum(a::AbstractArray{<:Measurement}) = result(sum(value.(a)), ones(length(a)), a)

# Same as above.  I'm not particularly proud of how the derivatives are
# computed, but something like this is needed in order to avoid errors with null
# nominal values: you may think to x ./ prod(x), but that would fail if one or
# more elements are zero.
function prod(a::AbstractArray{<:Measurement})
    x = value.(a)
    return result(prod(x),
                  [prod(deleteat!(copy(x), i)) for i in eachindex(x)],
                  a)
end

### Integration with QuadGK

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
