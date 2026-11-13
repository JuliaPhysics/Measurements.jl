### special-functions.jl
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
# This file contains definition of special functions that support
# Measurement objects.
#
### Code:

### Special functions
module MeasurementsSpecialFunctionsExt

using Measurements
using Measurements: result
using SpecialFunctions

# Error function: erf, erfinv, erfc, erfcinv, erfcx, erfi, dawson

function SpecialFunctions.erf(a::Measurement{T}) where {T<:AbstractFloat}
    aval = a.val
    return result(erf(aval), 2*exp(-abs2(aval))/sqrt(T(pi)), a)
end

function SpecialFunctions.erfinv(a::Measurement{T}) where {T<:AbstractFloat}
    res = erfinv(a.val)
    # For the derivative, see http://mathworld.wolfram.com/InverseErf.html
    return result(res, sqrt(T(pi)) * exp(abs2(res)) / 2, a)
end

function SpecialFunctions.erfc(a::Measurement{T}) where {T<:AbstractFloat}
    aval = a.val
    return result(erfc(aval), -2*exp(-abs2(aval))/sqrt(T(pi)), a)
end

function SpecialFunctions.erfcinv(a::Measurement{T}) where {T<:AbstractFloat}
    res = erfcinv(a.val)
    # For the derivative, see http://mathworld.wolfram.com/InverseErfc.html
    return result(res, -sqrt(T(pi)) * exp(abs2(res)) / 2, a)
end

function SpecialFunctions.erfcx(a::Measurement{T}) where {T<:AbstractFloat}
    aval = a.val
    res = erfcx(aval)
    return result(res, 2 * (aval * res - inv(sqrt(T(pi)))), a)
end

function SpecialFunctions.erfi(a::Measurement{T}) where {T<:AbstractFloat}
    aval = a.val
    return result(erfi(aval), 2*exp(abs2(aval))/sqrt(T(pi)), a)
end

function SpecialFunctions.dawson(a::Measurement{T}) where {T<:AbstractFloat}
    aval = a.val
    res = dawson(aval)
    return result(res, one(T) - 2 * aval * res, a)
end

# Gamma

function SpecialFunctions.gamma(a::Measurement)
    aval = a.val
    Γ = gamma(aval)
    return result(Γ, Γ*digamma(aval), a)
end

function SpecialFunctions.logabsgamma(a::Measurement)
    aval = a.val
    logabs, s = logabsgamma(a.val)
    return (result(logabs, digamma(aval), a), result(s, 0, a))
end

function SpecialFunctions.digamma(a::Measurement)
    aval = a.val
    return result(digamma(aval), trigamma(aval), a)
end

function SpecialFunctions.invdigamma(a::Measurement)
    aval = a.val
    res = invdigamma(aval)
    return result(res, inv(trigamma(res)), a)
end

function SpecialFunctions.trigamma(a::Measurement)
    aval = a.val
    return result(trigamma(aval), polygamma(2, aval), a)
end

function SpecialFunctions.polygamma(n::Integer, a::Measurement)
    aval = a.val
    return result(polygamma(n, aval), polygamma(n + 1, aval), a)
end

# Beta function: beta, lbeta

function SpecialFunctions.beta(a::Measurement, b::Measurement)
    aval = a.val
    bval = b.val
    res = beta(aval, bval)
    return result(res,
                  (res*(digamma(aval) - digamma(aval + bval)),
                   res*(digamma(bval) - digamma(aval + bval))),
                  (a, b))
end

function SpecialFunctions.beta(a::Measurement, b::Real)
    aval = a.val
    res = beta(aval, b)
    return result(res, res*(digamma(aval) - digamma(aval + b)), a)
end

SpecialFunctions.beta(a::Real, b::Measurement) = beta(b, a)

function SpecialFunctions.logabsbeta(a::Measurement, b::Measurement)
    aval = a.val
    bval = b.val
    logabs, s = logabsbeta(a.val, b.val)
    return (result(logabs,
                   (digamma(aval) - digamma(aval + bval),
                    digamma(bval) - digamma(aval + bval)),
                   (a, b)),
            result(s, (0, 0), (a, b)))
end

function SpecialFunctions.lbeta(a::Measurement, b::Real)
    aval = a.val
    return result(lbeta(aval, b), digamma(aval) - digamma(aval + b), a)
end

SpecialFunctions.lbeta(a::Real, b::Measurement) = lbeta(b, a)

# Airy functions

for f in (:airyai, :airybi)
    der = Symbol(string(f) * "prime")
    @eval begin
        function SpecialFunctions.$f(a::Measurement)
            x = a.val
            return result($f(x), $der(x), a)
        end
        function SpecialFunctions.$der(a::Measurement)
            x = a.val
            # Use Airy equation: y'' - xy = 0 => y'' = xy
            return result($der(x), x * $f(x), a)
        end
    end
end

# Bessel functions: DLMF 10.6.2 (averaging the two derivative formulas).

function SpecialFunctions.besselj0(a::Measurement)
    x = a.val
    return result(besselj0(x), -besselj1(x), a)
end

function SpecialFunctions.besselj1(a::Measurement)
    x = a.val
    return result(besselj1(x), (besselj0(x) - besselj(2, x)) / 2, a)
end

# XXX: I don't know a closed form expression for the derivative with respect to
# first argument of J_n.  Arguably, there will be more cases where the
# measurement is the second argument, than the first one.  In any case, you can
# use "@uncertain" macro when both arguments are of Measurement type.
function SpecialFunctions.besselj(nu::Real, a::Measurement)
    x = a.val
    return result(besselj(nu, x), (besselj(nu - 1, x) - besselj(nu + 1, x)) / 2, a)
end

function SpecialFunctions.bessely0(a::Measurement)
    x = a.val
    return result(bessely0(x), -bessely1(x), a)
end

function SpecialFunctions.bessely1(a::Measurement)
    x = a.val
    return result(bessely1(x), (bessely0(x) - bessely(2, x)) / 2, a)
end

# XXX: I don't know a closed form expression for the derivative with respect to
# first argument of y_n, see comments about "besselj".
function SpecialFunctions.bessely(nu::Real, a::Measurement)
    x = a.val
    return result(bessely(nu, x), (bessely(nu - 1, x) - bessely(nu + 1, x)) / 2, a)
end

function SpecialFunctions.besselh(nu::Real, k::Integer, a::Measurement)
    x = a.val
    return result(besselh(nu, k, x),
                  (besselh(nu - 1, k, x) - besselh(nu + 1, k, x)) / 2,
                  a)
end

# Modified Bessel functions: DLMF 10.29.2.
function SpecialFunctions.besseli(nu::Real, a::Measurement)
    x = a.val
    return result(besseli(nu, x), (besseli(nu - 1, x) + besseli(nu + 1, x)) / 2, a)
end

function SpecialFunctions.besselix(nu::Real, a::Measurement)
    x = a.val
    val = besselix(nu, x)
    # sign(0) = 0 gives the mean of the two one-sided derivatives of the scale.
    return result(val,
                  (besselix(nu - 1, x) + besselix(nu + 1, x)) / 2 - sign(x) * val,
                  a)
end

function SpecialFunctions.besselk(nu::Real, a::Measurement)
    x = a.val
    return result(besselk(nu, x), -(besselk(nu - 1, x) + besselk(nu + 1, x)) / 2, a)
end

function SpecialFunctions.besselkx(nu::Real, a::Measurement)
    x = a.val
    # SpecialFunctions returns typeof(x) at zero, and the promoted type elsewhere.
    T = promote_type(typeof(float(nu)), typeof(x))
    val = T(besselkx(nu, x))
    return result(val,
                  val - (besselkx(nu - 1, x) + besselkx(nu + 1, x)) / 2,
                  a)
end

# Scaled Bessel functions of real arguments: DLMF 10.6.2.
# The scale exp(-abs(imag(x))) is one on the real axis.
for f in (:besseljx, :besselyx)
    @eval function SpecialFunctions.$f(nu::Real, a::Measurement)
        x = a.val
        return result($f(nu, x), ($f(nu - 1, x) - $f(nu + 1, x)) / 2, a)
    end
end

# Scaled Hankel functions: DLMF 10.6.2 and the scale exp(∓im*x).
function SpecialFunctions.besselhx(nu::Real, k::Integer, a::Measurement)
    x = a.val
    val = besselhx(nu, k, x)
    der = (besselhx(nu - 1, k, x) - besselhx(nu + 1, k, x)) / 2
    return result(val, der + (k == 1 ? -im : im) * val, a)
end

# Resolve the overlap with SpecialFunctions' AbstractFloat Hankel methods.
for f in (:besselh, :besselhx)
    @eval SpecialFunctions.$f(nu::AbstractFloat, k::Integer, a::Measurement) =
        invoke($f, Tuple{Real, Integer, Measurement}, nu, k, a)
end

# Convert the two complex partial derivatives to the real Jacobian for result.
function besselresult(val, dx, dy, a::Complex{<:Measurement})
    # Preserve the nominal precision when SpecialFunctions promotes the argument.
    a = convert(Complex{Measurement{typeof(real(val))}}, a)
    return result(val, (real(dx), real(dy), imag(dx), imag(dy)), a)
end

# Complex Bessel and Hankel functions: DLMF 10.6.2 and Cauchy-Riemann.
for f in (:besselj, :bessely)
    @eval function SpecialFunctions.$f(nu::Real, a::Complex{<:Measurement})
        x = Measurements.value(a)
        val = $f(nu, x)
        der = ($f(nu - 1, x) - $f(nu + 1, x)) / 2
        return besselresult(val, der, im * der, a)
    end
end

function SpecialFunctions.besselh(nu::Real, k::Integer, a::Complex{<:Measurement})
    x = Measurements.value(a)
    val = besselh(nu, k, x)
    der = (besselh(nu - 1, k, x) - besselh(nu + 1, k, x)) / 2
    return besselresult(val, der, im * der, a)
end

# Complex modified Bessel functions: DLMF 10.29.2 and Cauchy-Riemann.
function SpecialFunctions.besseli(nu::Real, a::Complex{<:Measurement})
    x = Measurements.value(a)
    val = besseli(nu, x)
    der = (besseli(nu - 1, x) + besseli(nu + 1, x)) / 2
    return besselresult(val, der, im * der, a)
end

function SpecialFunctions.besselk(nu::Real, a::Complex{<:Measurement})
    x = Measurements.value(a)
    val = besselk(nu, x)
    der = -(besselk(nu - 1, x) + besselk(nu + 1, x)) / 2
    return besselresult(val, der, im * der, a)
end

# Complex scaled Bessel functions: DLMF 10.6.2 and exp(-abs(imag(x))).
# On the axis, sign(0) = 0 gives the mean of the one-sided scale derivatives.
for f in (:besseljx, :besselyx)
    @eval function SpecialFunctions.$f(nu::Real, a::Complex{<:Measurement})
        x = Measurements.value(a)
        val = $f(nu, x)
        dx = ($f(nu - 1, x) - $f(nu + 1, x)) / 2
        dy = im * dx - sign(imag(x)) * val
        return besselresult(val, dx, dy, a)
    end
end

# Complex scaled modified Bessel functions: DLMF 10.29.2.
function SpecialFunctions.besselix(nu::Real, a::Complex{<:Measurement})
    x = Measurements.value(a)
    val = besselix(nu, x)
    der = (besselix(nu - 1, x) + besselix(nu + 1, x)) / 2
    # exp(-abs(real(x))) has the mean scale derivative sign(0) = 0 on the axis.
    return besselresult(val, der - sign(real(x)) * val, im * der, a)
end

function SpecialFunctions.besselkx(nu::Real, a::Complex{<:Measurement})
    x = Measurements.value(a)
    val = besselkx(nu, x)
    der = val - (besselkx(nu - 1, x) + besselkx(nu + 1, x)) / 2
    return besselresult(val, der, im * der, a)
end

# Complex scaled Hankel functions: DLMF 10.6.2 and exp(∓im*x).
function SpecialFunctions.besselhx(nu::Real, k::Integer, a::Complex{<:Measurement})
    x = Measurements.value(a)
    val = besselhx(nu, k, x)
    der = (besselhx(nu - 1, k, x) - besselhx(nu + 1, k, x)) / 2
    der += (k == 1 ? -im : im) * val
    return besselresult(val, der, im * der, a)
end

# Fixed orders and Hankel aliases use the same DLMF 10.6.2 derivatives.
for (f, g, nu) in ((:besselj0, :besselj, 0), (:besselj1, :besselj, 1),
                   (:bessely0, :bessely, 0), (:bessely1, :bessely, 1))
    @eval SpecialFunctions.$f(a::Complex{<:Measurement}) = $g($nu, a)
end

for (f, g, k) in ((:hankelh1, :besselh, 1), (:hankelh2, :besselh, 2),
                  (:hankelh1x, :besselhx, 1), (:hankelh2x, :besselhx, 2))
    @eval begin
        SpecialFunctions.$f(nu::Real, a::Measurement) = $g(nu, $k, a)
        SpecialFunctions.$f(nu::Real, a::Complex{<:Measurement}) = $g(nu, $k, a)
    end
end

# Deprecations
function Base.factorial(a::Measurement)
    Base.depwarn("""
                 factorial(($(a))::Measurement) is deprecated, instead use
                     SpecialFunctions.gamma($(a + one(a)))
                 """,
                 :factorial)
    SpecialFunctions.gamma(a + one(a))
end
end
