### math.jl
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
# This file contains definition of mathematical functions that support
# Measurement objects.
#
# Note: some functions defined here (like all reciprocal trigonometric
# functions, fld, cld, hypot, cbrt, abs, mod) are redundant in the sense that
# you would get the correct result also without their definitions, but having
# them defined here avoids some calculations and slightly improves performance.
#
### Code:

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
function result{T<:AbstractFloat}(val::Real, der::Real, a::Measurement{T})
    val, der = promote(val, der)
    newder = similar(a.der)
    @inbounds for tag in keys(a.der)
        if tag[2] != 0.0 # Skip values with 0 uncertainty
            newder = Derivatives(newder, tag=>der*a.der[tag])
        end
    end
    # If uncertainty of "a" is null, the uncertainty of result is null as well,
    # even if the derivative is NaN or infinite.  In any other case, use
    # σ_G = |σ_a·∂G/∂a|.
    σ = (a.err == 0.0) ? 0.0 : abs(der*a.err)
    # The tag is NaN because we don't care about tags of derived quantities, we
    # are only interested in independent ones.
    Measurement(val,  σ, NaN, newder)
end

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
#   σ_G = sqrt((σ_x·dG/dx)^2 + (σ_y·dG/dy)^2 + (σ_z·dG/dz)^2)
# where dG/dx is the total derivative of G with respect to x, and so on.  We can
# expand the previous formula to:
#   σ_G = sqrt((σ_x·(∂G/∂a1·∂a1/∂x + ∂G/∂a2·∂a2/∂x))^2 + (σ_y·∂G/∂a1·∂a1/∂y)^2 +
#               + (σ_z·∂G/∂a2·∂a2/∂z)^2)
function result(val::Real, der::Tuple{Vararg{Real}},
                a::Tuple{Vararg{Measurement}})
    @assert length(der) == length(a)
    a = promote(a...)
    T = typeof(a[1].val)
    newder = similar(a[1].der)
    err::T = zero(T)
    # Iterate over all independent variables.  We first iterate over all
    # variables listed in `a' in order to get all independent variables upon
    # which those variables depend, then we get the `tag' of each independent
    # variable, skipping variables that have been already taken into account.
    @inbounds for y in a
        for tag in keys(y.der)
            if tag ∉ keys(newder) # Skip independent variables already considered
                if tag[2] != 0.0 # Skip values with 0 uncertainty
                    deriv::T = 0.0
                    # Iteratate over all the arguments of the function
                    for (i, x) in enumerate(a)
                        # Calculate the derivative of G with respect to the
                        # current independent variable.  In the case of the x
                        # independent variable of the example above, we should
                        # get   dG/dx = ∂G/∂a1·∂a1/∂x + ∂G/∂a2·∂a2/∂x
                        deriv = deriv + der[i]*derivative(x, tag)
                    end
                    newder = Derivatives(newder, tag=>deriv)
                    # Add (σ_x·dG/dx)^2 to the total uncertainty (squared)
                    err = err + abs2(deriv*tag[2])
                end
            end
        end
    end
    return Measurement(T(val), sqrt(err), NaN, newder)
end

# @uncertain macro.  TODO: generalize to any number of arguments.
"""
    @uncertain f(value ± stddev[, value ± stddev])

A macro to calculate \$f(value) ± uncertainty\$, with \$uncertainty\$ derived
from \$stddev\$ according to rules of linear error propagation theory.  Function
\$f\$ can accept one or two real argument, the type of the arguments provided
must be `Measurement`.
"""
macro uncertain(expr::Expr)
    f = esc(expr.args[1]) # Function name
    if length(expr.args) == 2
        a = esc(expr.args[2]) # Argument, of Measurement type
        return :( Measurements.result($f($a.val), Calculus.derivative($f, $a.val), $a) )
    elseif length(expr.args) == 3
        a1 = esc(expr.args[2]) # First argument
        a2 = esc(expr.args[3]) # Second argument
        return :( result($f($a1.val, $a2.val),
                         (Calculus.gradient(x -> $f(x...), [$a1.val, $a2.val])...),
                         ($a1, $a2)) )
    else
        throw(ArgumentError("@uncertain only supports functions with one or two arguments"))
    end
end

### Elementary arithmetic operations:
import Base: +, -, *, /, div, inv, fld, cld

# Addition: +
+(a::Measurement) = a
+(a::Measurement, b::Measurement) =
    result(a.val + b.val, (1.0, 1.0), (a, b))
+(a::Real, b::Measurement) = +(Measurement(a), b)
+(a::Measurement, b::Bool) = +(a, Measurement(b))
+(a::Measurement, b::Rational) = +(a, Measurement(b))
+(a::Measurement, b::Real) = +(a, Measurement(b))

# Subtraction: -
-(a::Measurement) = result(-a.val, -1, a)
-(a::Measurement, b::Measurement) = a + (-b)
-(a::Real, b::Measurement) = -(Measurement(a), b)
-(a::Measurement, b::Real) = -(a, Measurement(b))

# Multiplication: *
function *(a::Measurement, b::Measurement)
    aval = a.val
    bval = b.val
    return result(aval*bval, (bval, aval), (a, b))
end
*(a::Bool, b::Measurement) = *(Measurement(a), b)
*(a::Measurement, b::Bool) = *(a, Measurement(b))
*(a::Real, b::Measurement) = *(Measurement(a), b)
*(a::Measurement, b::Real) = *(a, Measurement(b))

# Division: /, div, fld, cld
function /(a::Measurement, b::Measurement)
    aval = a.val
    oneoverbval = inv(b.val)
    return result(aval*oneoverbval, (oneoverbval, -aval*abs2(oneoverbval)),
                  (a, b))
end
/(a::Real, b::Measurement) = /(Measurement(a), b)
/(a::Measurement, b::Real) = /(a, Measurement(b))

div(a::Measurement, b::Measurement) = Measurement(div(a.val, b.val))
div(a::Measurement, b::Real) = div(a, Measurement(b))
div(a::Real, b::Measurement) = div(Measurement(a), b)

fld(a::Measurement, b::Measurement) = Measurement(fld(a.val, b.val))
fld(a::Measurement, b::Real) = fld(a, Measurement(b))
fld(a::Real, b::Measurement) = fld(Measurement(a), b)

cld(a::Measurement, b::Measurement) = Measurement(cld(a.val, b.val))
cld(a::Measurement, b::Real) = cld(a, Measurement(b))
cld(a::Real, b::Measurement) = cld(Measurement(a), b)

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
    return result(pow, (aval^(bval - 1.0)*bval, pow*log(aval)), (a, b))
end

function ^{T<:Integer}(a::Measurement, b::T)
    aval = a.val
    return result(aval^b, aval^(b-1)*b, a)
end

function ^{T<:Rational}(a::Measurement,  b::T)
    if isinteger(b)
        return a^trunc(Integer, b)
    else
        return ^(a, Measurement(b))
    end
end

function ^{T<:Real}(a::Measurement,  b::T)
    if isinteger(float(b))
        return a^trunc(Integer, b)
    else
        return ^(a, Measurement(b))
    end
end

^{T<:Integer}(a::T, b::Measurement) = ^(Measurement(a), b)
^(::Irrational{:e}, b::Measurement) = exp(b)
^(a::Irrational, b::Measurement) = Measurement(float(a))^b
^{T<:Real}(a::T,  b::Measurement) = ^(Measurement(a), b)

function exp2{T<:AbstractFloat}(a::Measurement{T})
    pow = exp2(a.val)
    return result(pow, pow*log(T(2)), a)
end

# Cosine: cos, cosh
import Base: cos, cosh

function cos(a::Measurement)
    aval = a.val
    result(cos(aval), -sin(aval), a)
end

function cosh(a::Measurement)
    aval = a.val
    result(cosh(aval), sinh(aval), a)
end

# Sine: sin, sinh
import Base: sin, sinh

function sin(a::Measurement)
    aval = a.val
    result(sin(aval), cos(aval), a)
end

function sinh(a::Measurement)
    aval = a.val
    result(sinh(aval), cosh(aval), a)
end

# Tangent: tan, tanh
import Base: tan, tanh

function tan(a::Measurement)
    aval = a.val
    return result(tan(aval), abs2(sec(aval)), a)
end

function tanh(a::Measurement)
    aval = a.val
    return result(tanh(aval), abs2(sech(aval)), a)
end

# Inverse trig functions: acos, acosh, asin, asinh, atan, atan2, atanh
import Base: acos, acosh, asin, asinh, atan, atan2, atanh

function acos(a::Measurement)
    aval = a.val
    return result(acos(aval), -inv(sqrt(1.0 - abs2(aval))), a)
end

function acosh(a::Measurement)
    aval = a.val
    return result(acosh(aval), inv(sqrt(abs2(aval) - 1.0)), a)
end

function asin(a::Measurement)
    aval = a.val
    return result(asin(aval), inv(sqrt(1.0 - abs2(aval))), a)
end

function asinh(a::Measurement)
    aval = a.val
    return result(asinh(a.val), inv(hypot(aval, 1.0)), a)
end

function atan(a::Measurement)
    aval = a.val
    return result(atan(aval), inv(abs2(aval) + 1.0), a)
end

function atanh(a::Measurement)
    aval = a.val
    return result(atanh(aval), inv(1.0 - abs2(aval)), a)
end

function atan2(a::Measurement, b::Measurement)
    aval = a.val
    bval = b.val
    invdenom = inv(abs2(aval) + abs2(bval))
    return result(atan2(aval, bval),
                  (bval*invdenom, -aval*invdenom),
                  (a, b))
end

atan2(a::Measurement, b::Real) = atan2(a, Measurement(b))
atan2(a::Real, b::Measurement) = atan2(Measurement(a), b)

# Reciprocal trig functions: csc, csch, sec, sech, cot, coth
import Base: csc, csch, sec, sech, cot, coth

function csc(a::Measurement)
    aval = a.val
    val = csc(aval)
    return result(val, -val*cot(aval), a)
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

function sech(a::Measurement)
    aval = a.val
    val = sech(aval)
    return result(val, val*tanh(aval), a)
end

function cot(a::Measurement)
    aval = a.val
    return result(cot(aval), -abs2(csc(aval)), a)
end

function coth(a::Measurement)
    aval = a.val
    return result(coth(aval), -abs2(csch(aval)), a)
end

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

function exp10{T<:AbstractFloat}(a::Measurement{T})
    val = exp10(a.val)
    return result(val, log(T(10))*val, a)
end

function frexp(a::Measurement)
    x, y = frexp(a.val)
    return (result(x, inv(2^y), a), y)
end

ldexp(a::Measurement, e::Integer) = result(ldexp(a.val, e), ldexp(1.0, e), a)

# Logarithm: log, log10, log1p
import Base: log, log10, log1p

function log(a::Measurement, b::Measurement)
    aval = a.val
    bval = b.val
    val = log(aval, bval)
    loga = log(aval)
    return result(val, (-val/(aval*loga), inv(loga*bval)), (a, b))
end

function log(a::Measurement) # Special case
    aval = a.val
    return result(log(aval), inv(aval), a)
end

function log10{T<:AbstractFloat}(a::Measurement{T}) # Special case
    aval = a.val
    return result(log10(aval), inv(log(T(10))*aval), a)
end

function log1p(a::Measurement) # Special case
    aval = a.val
    return result(log1p(aval), inv(aval + one(aval)), a)
end

log(::Irrational{:e}, a::Measurement) = log(a)
log(a::Real, b::Measurement) = log(Measurement(a), b)
log(a::Irrational, b::Measurement) = log(float(a), b)
log(a::Measurement, b::Real) = log(a, Measurement(b))

# Hypotenuse: hypot
import Base: hypot

function hypot(a::Measurement, b::Measurement)
    aval = a.val
    bval = b.val
    val = hypot(aval, bval)
    invval = inv(val)
    return result(val,
                  (aval*invval, bval*invval),
                  (a, b))
end

hypot(a::Real, b::Measurement) = hypot(Measurement(a), b)
hypot(a::Measurement, b::Real) = hypot(a, Measurement(b))

# Square root: sqrt
import Base: sqrt

function sqrt(a::Measurement)
    val = sqrt(a.val)
    return result(val, 0.5*inv(val), a)
end

# Cube root: cbrt
import Base: cbrt

function cbrt(a::Measurement)
    aval = a.val
    val = cbrt(aval)
    return result(val, val*inv(3.0*aval), a)
end

# Absolute value: abs
import Base: abs

function abs(a::Measurement)
    aval = a.val
    return result(abs(aval), copysign(1, aval), a)
end

# Sign: sign, copysign, flipsign
import Base: sign, copysign, flipsign

sign(a::Measurement) = result(sign(a.val), 0.0, a)

function copysign(a::Measurement, b::Measurement)
    aval = a.val
    bval = b.val
    result(copysign(aval, bval),
           (copysign(1, aval)/copysign(1, bval), 0.0),
           (a, b))
end

copysign(a::Measurement, b::Real) = copysign(a, Measurement(b))
copysign(a::Signed, b::Measurement) = copysign(Measurement(a), b)
copysign(a::Rational, b::Measurement) = copysign(Measurement(a), b)
copysign(a::Float32, b::Measurement) = copysign(Measurement(a), b)
copysign(a::Float64, b::Measurement) = copysign(Measurement(a), b)
copysign(a::Real, b::Measurement) = copysign(Measurement(a), b)

function flipsign(a::Measurement, b::Measurement)
    flip = flipsign(a.val, b.val)
    return result(flip, (copysign(1.0, flip), 0.0), (a, b))
end

flipsign(a::Measurement, b::Real) = flipsign(a, Measurement(b))
flipsign(a::Signed, b::Measurement) = flipsign(Measurement(a), b)
flipsign(a::Float32, b::Measurement) = flipsign(Measurement(a), b)
flipsign(a::Float64, b::Measurement) = flipsign(Measurement(a), b)
flipsign(a::Real, b::Measurement) = flipsign(Measurement(a), b)

# Error function: erf, erfinv, erfc, erfcinv, erfcx
import Base: erf, erfinv, erfc, erfcinv, erfcx

function erf{T<:AbstractFloat}(a::Measurement{T})
    aval = a.val
    return result(erf(aval), 2*exp(-abs2(aval))/sqrt(T(pi)), a)
end

function erfinv{T<:AbstractFloat}(a::Measurement{T})
    res = erfinv(a.val)
    # For the derivative, see http://mathworld.wolfram.com/InverseErf.html
    return result(res, 0.5*sqrt(T(pi))*exp(abs2(res)), a)
end

function erfc{T<:AbstractFloat}(a::Measurement{T})
    aval = a.val
    return result(erfc(aval), -2*exp(-abs2(aval))/sqrt(T(pi)), a)
end

function erfcinv{T<:AbstractFloat}(a::Measurement{T})
    res = erfcinv(a.val)
    # For the derivative, see http://mathworld.wolfram.com/InverseErfc.html
    return result(res, -0.5*sqrt(T(pi))*exp(abs2(res)), a)
end

function erfcx{T<:AbstractFloat}(a::Measurement{T})
    aval = a.val
    res = erfcx(aval)
    return result(res, 2*(aval*res - inv(sqrt(T(pi)))), a)
end

# Factorial and gamma: factorial, gamma, lgamma
import Base: factorial, gamma, lgamma

function factorial(a::Measurement)
    aval = a.val
    fact = factorial(aval)
    return result(fact, fact*polygamma(0, aval + one(aval)), a)
end

function gamma(a::Measurement)
    aval = a.val
    Γ = gamma(aval)
    return result(Γ, Γ*polygamma(0, aval), a)
end

function lgamma(a::Measurement)
    aval = a.val
    return result(lgamma(aval), polygamma(0, aval), a)
end

# Modulo: rem, mod2pi
import Base: mod, rem, mod2pi

# Use definition of "mod" function:
# http://docs.julialang.org/en/stable/manual/mathematical-operations/#division-functions
mod(a::Measurement, b::Measurement) = a - fld(a, b)*b
mod(a::Measurement, b::Real) = mod(a, Measurement(b))
mod(a::Real, b::Measurement) = mod(Measurement(a), b)

# Use definition of "rem" function:
# http://docs.julialang.org/en/stable/manual/mathematical-operations/#division-functions
rem(a::Measurement, b::Measurement) = a - div(a, b)*b
rem(a::Measurement, b::Real) = rem(a, Measurement(b))
rem(a::Real, b::Measurement) = rem(Measurement(a), b)

mod2pi(a::Measurement) = result(mod2pi(a.val), 1, a)

# Machine precision: eps, nextfloat, maxintfloat
import Base: eps, nextfloat, maxintfloat, typemax

eps{T<:AbstractFloat}(::Type{Measurement{T}}) = eps(T)
eps{T<:AbstractFloat}(a::Measurement{T}) = eps(a.val)

nextfloat(a::Measurement) = nextfloat(a.val)

maxintfloat{T<:AbstractFloat}(::Type{Measurement{T}}) = maxintfloat(T)

typemax{T<:AbstractFloat}(::Type{Measurement{T}}) = typemax(T)

# Rounding: round, floor, ceil, trunc
import Base: round, floor, ceil, trunc

round(a::Measurement) = round(a.val)
round{T<:Integer}(::Type{T}, a::Measurement) = round(T, a.val)
floor(a::Measurement) = floor(a.val)
floor{T<:Integer}(::Type{T}, a::Measurement) = floor(T, a.val)
ceil(a::Measurement) = ceil(a.val)
ceil{T<:Integer}(::Type{T}, a::Measurement) = ceil(Integer, a.val)
trunc(a::Measurement) = trunc(a.val)
trunc{T<:Integer}(::Type{T}, a::Measurement) = trunc(T, a.val)
