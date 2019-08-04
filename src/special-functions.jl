### math.jl
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
using .SpecialFunctions

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

# Factorial and gamma

function SpecialFunctions.factorial(a::Measurement)
    aval = a.val
    fact = SpecialFunctions.factorial(aval)
    return result(fact, fact*digamma(aval + one(aval)), a)
end

function SpecialFunctions.gamma(a::Measurement)
    aval = a.val
    Γ = gamma(aval)
    return result(Γ, Γ*digamma(aval), a)
end

function SpecialFunctions.lgamma(a::Measurement)
    aval = a.val
    return result(lgamma(aval), digamma(aval), a)
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

function SpecialFunctions.lbeta(a::Measurement, b::Measurement)
    aval = a.val
    bval = b.val
    return result(lbeta(aval, bval),
                  (digamma(aval) - digamma(aval + bval),
                   digamma(bval) - digamma(aval + bval)),
                  (a, b))
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

# Bessel functions

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

function SpecialFunctions.besseli(nu::Real, a::Measurement)
    x = a.val
    return result(besseli(nu, x), (besseli(nu - 1, x) + besseli(nu + 1, x)) / 2, a)
end

function SpecialFunctions.besselix(nu::Real, a::Measurement)
    x = a.val
    return result(besselix(nu, x),
                  (besseli(nu - 1, x) + besseli(nu + 1, x)) * exp(-abs(x)) / 2 -
                  besseli(nu, x)*sign(x)*exp(-abs(x)),
                  a)
end

function SpecialFunctions.besselk(nu::Real, a::Measurement)
    x = a.val
    return result(besselk(nu, x), -(besselk(nu - 1, x) + besselk(nu + 1, x)) / 2, a)
end

function SpecialFunctions.besselkx(nu::Real, a::Measurement)
    x = a.val
    return result(besselkx(nu, x),
                  -(besselk(nu - 1, x) + besselk(nu + 1, x)) * exp(x) / 2 +
                  besselk(nu, x)*exp(x),
                  a)
end
