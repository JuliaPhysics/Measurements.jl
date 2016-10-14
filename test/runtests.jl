using Measurements
using Base.Test

test_approx_eq(a::Measurement, b::Measurement) =
    (@test_approx_eq(a.val, b.val) ; @test_approx_eq(a.err, b.err))
test_approx_eq{T1<:AbstractFloat,T2<:AbstractFloat}(a::Complex{Measurement{T1}}, b::Complex{Measurement{T2}}) =
    (@test_approx_eq(real(a), real(b)) ; @test_approx_eq(imag(a), imag(b)))
test_approx_eq{T1<:AbstractFloat,T2<:AbstractFloat}(a::Complex{Measurement{T1}}, b::Measurement{T2}) =
    test_approx_eq(a, complex(b))
test_approx_eq{T1<:AbstractFloat,T2<:AbstractFloat}(a::Measurement{T1}, b::Complex{Measurement{T2}}) =
    test_approx_eq(complex(a), b)
test_approx_eq_eps(a::Measurement, b::Measurement, tol::Real) =
    (@test_approx_eq_eps(a.val, b.val, tol) ; @test_approx_eq_eps(a.err, b.err, tol))
test_approx_eq_eps{T1<:AbstractFloat,T2<:AbstractFloat}(a::Complex{Measurement{T1}}, b::Complex{Measurement{T2}}, tol::Real) =
    (@test_approx_eq_eps(real(a), real(b), tol) ; @test_approx_eq_eps(imag(a), imag(b), tol))

w = -0.5 ± 0.03
x = 3 ± 0.1
y = 4 ± 0.2
z = complex(x)

# Standard Score
test_approx_eq(stdscore(x, y), -10 ± 2)
@test_approx_eq stdscore(w, x.val) -350/3

# Vectorial version of Measurement
@test measurement(1:2:5, 2:2:6) == [1±2, 3±4, 5±6]

# Weighted Average with Inverse-Variance Weighting
test_approx_eq(weightedmean((w, x, y)),
               measurement(-0.12584269662921355, 0.028442727788398632))

# Derivative
@test_approx_eq(Measurements.derivative(3*x^2, (x.val, x.err, x.tag)), 18)
@test_approx_eq(Measurements.derivative(3*x^2, x), 18)
@test_approx_eq(Measurements.gradient(2x + y - w, [x, y, w]), [2, 1, -1])

# Conversion and Promotion
@test convert(Measurement{Float64}, pi) == pi ± 0
@test convert(Measurement{Float64}, 1//2) == 0.5 ± 0
@test convert(Measurement{Float64}, 3) == 3.0 ± 0.0
@test convert(Measurement{Float64}, 3 ± 1) == 3.0 ± 1.0
@test convert(Measurement, x) === x
@test convert(Measurement, pi) == pi ± 0
@test convert(Measurement, 1//2) == 0.5 ± 0
@test convert(Measurement, 3) == 3 ± 0
@test convert(Signed, x) == 3
@test float(3 ± 1) == 3.0 ± 1.0
@test float(x) === x
@test promote(Measurement{Float32}(3 ± 0.5), Measurement{Float64}(4 ± 0)) ==
    (Measurement{Float64}(3 ± 0.5), Measurement{Float64}(4 ± 0))
@test promote(x, complex(7)) == (complex(3.0 ± 0.1),
                                  complex(measurement(7.0)))
@test promote(complex(0, 1 ± 0), 2.1 ± 0.2) ==
    (complex(0, 1.0 ± 0), complex(2.1 ± 0.2))

##### Comparisons and Tests
@test z == x != y
@test x == x
@test -2 < w <= x < y < 5
@test 3 == x
@test y == 4 != w
@test measurement(0.8, 0.01) == 4//5
@test measurement(π) == π
@test e == measurement(e)
@test 4//5 == measurement(0.8, 0.03)
@test isnan(x) == false
@test isfinite(y) == true && isfinite(measurement(Inf)) == false
@test isinf(measurement(Inf)) == true && isinf(x) == false
@test (isinteger(x) == true && isinteger(w) == false)

##### Mathematical Operations
# Addition
test_approx_eq(+x, x)
test_approx_eq(x + y, measurement(7, 0.22360679774997896))
test_approx_eq(x + y, y + x) # Commutativity
test_approx_eq(2 + x, measurement(5, 0.1))
test_approx_eq(x + 5//2, measurement(5.5, 0.1))
test_approx_eq(x + true, measurement(4, 0.1))
test_approx_eq(x + 2, measurement(5, 0.1))
# Test correlation
for a in (w, x, y); test_approx_eq(a + a + a, 3a); end

# Subtraction
test_approx_eq(-x, measurement(-3, 0.1))
test_approx_eq(x - y, measurement(-1, 0.22360679774997896))
test_approx_eq(2 - x, measurement(-1, 0.1))
test_approx_eq(x - 2, measurement(1, 0.1))
# Test correlation
for a in (w, x, y); test_approx_eq(a - a, measurement(0)); end

# Multiplication
test_approx_eq(x*y, measurement(12, 0.7211102550927979))
test_approx_eq(x*y, y*x) # Commutativity
test_approx_eq(2x, measurement(6, 0.2))
test_approx_eq(x*3, measurement(9, 0.3))
test_approx_eq(w*0, measurement(0))
test_approx_eq(true*x, x)
test_approx_eq(y*false, measurement(0))
for a in (w, x, y); test_approx_eq(a*(0 ± 1), measurement(0, abs(a.val))); end
# Test correlation
for a in (x, y); test_approx_eq(a*a*a, a^3); end
for f in (muladd, fma)
    test_approx_eq(f(w, x, y), w*x + y)
    test_approx_eq(f(w, x, 1), w*x + 1)
    test_approx_eq(f(w, 2, y), w*2 + y)
    test_approx_eq(f(w, 2, 1), w*2 + 1)
    test_approx_eq(f(3, x, y), 3*x + y)
    test_approx_eq(f(3, x, 1), 3*x + 1)
    test_approx_eq(f(3, 2, y), 3*2 + y)
end

# Division
test_approx_eq(x/y, measurement(0.75, 0.04506939094329987))
test_approx_eq(x/10, measurement(0.3, 0.01))
test_approx_eq(1/y, measurement(0.25, 0.0125))
test_approx_eq(0/x, measurement(0))
test_approx_eq(div(1.2*x, w), measurement(-7))
test_approx_eq(div(x, 1.2), measurement(2))
test_approx_eq(div(9.4, y), measurement(2))
test_approx_eq(fld(1.2*x, w), measurement(-8))
test_approx_eq(fld(x, 1.2), measurement(2))
test_approx_eq(fld(9.4, y), measurement(2))
test_approx_eq(cld(1.2*x, w), measurement(-7))
test_approx_eq(cld(x, 1.2), measurement(3))
test_approx_eq(cld(9.4, y), measurement(3))
for a in (w, x, y); test_approx_eq((0 ± 1)/a, measurement(0, 1/abs(a.val))); end
# Test correlation
for a in (w, x, y); test_approx_eq(a/a, measurement(1)); end
# Test derivatives of "div", "fld", and "cld".  They're defined to be exactly 0.
# Should you discover this is not correct, update the test accordingly.
for f in (div, fld, cld), a in (w, x, y), b in (w, x, y)
    Measurements.gradient(f(a, b), [a, b]) == [0.0, 0.0]
end

# Inverse
for a in (w, x, y); test_approx_eq(inv(a), 1/a); end

# signbit
@test signbit(x) == false
@test signbit(w) == true

# Power
test_approx_eq(x^y, measurement(81, 20.818061515800505))
for a in (w, x, y); test_approx_eq(a^(-1), inv(a)); end
test_approx_eq(x^2, measurement(9, 0.6))
for a in (w, x, y); test_approx_eq(a^2, a^2.0); end
test_approx_eq(y^(1//2), measurement(2, 0.05))
for a in (w, x, y); test_approx_eq(a^(4//2), a*a); end
test_approx_eq(x^(pi), measurement(31.54428070019754, 3.3033093503504967))
test_approx_eq(2^x, measurement(8, 0.5545177444479562))
for a in (w, x, y); test_approx_eq(2^a, 2.0^a); end
test_approx_eq(pi^x, measurement(31.006276680299816, 3.5493811564854525))
for val in (w, x, y); test_approx_eq(e^val, exp(val)); end
for val in (w, x, y); test_approx_eq(exp2(val), 2^val); end
test_approx_eq(z^2.5, x^2.5)
test_approx_eq(z^3, x^3)
# Make sure "p ± 0" behaves like "p", in particular with regard to the
# uncertainty.
for p in (-3, 0, 3); test_approx_eq((0 ± 0.1)^(p ± 0), (0 ± 0.1)^p); end

# rad2deg
test_approx_eq(rad2deg(x), measurement(171.88733853924697, 5.729577951308232))

# Cosine
test_approx_eq(cos(x), measurement(-0.9899924966004454, 0.014112000805986721))
test_approx_eq(cosd(x), measurement(0.9986295347545738, 9.134347536190512e-5))
test_approx_eq(cosh(x), measurement(10.067661995777765, 1.0017874927409902))

# Sine
test_approx_eq(sin(y), measurement(-0.7568024953079282, 0.13072872417272238))
test_approx_eq(sind(y), measurement(0.0697564737441253, 0.0034821554353128255))
test_approx_eq(sinh(y), measurement(27.28991719712775, 5.461646567203298))

#Tangent
for val in (w, x, y); test_approx_eq(tan(val), sin(val)/cos(val)); end
for val in (w, x, y); test_approx_eq(tand(val), sind(val)/cosd(val)); end
for val in (w, x, y); test_approx_eq(tanh(val), sinh(val)/cosh(val)); end

# Inverse trig functions
test_approx_eq(acos(w), measurement(2.0943951023931957, 0.034641016151377546))
test_approx_eq(acosd(w), measurement(120, 1.9847840235184515))
test_approx_eq(acosh(x), measurement(1.7627471740390859, 0.035355339059327376))
test_approx_eq(cos(acos(w)), w)
test_approx_eq(cosd(acosd(w)), w)
test_approx_eq(cosh(acosh(x)), x)
test_approx_eq(asin(w), measurement(-0.5235987755982989, 0.034641016151377546))
test_approx_eq(asind(w), measurement(-30, 1.9847840235184515))
test_approx_eq(asinh(x), measurement(1.8184464592320668, 0.0316227766016838))
test_approx_eq(sin(asin(w)), w)
test_approx_eq(sind(asind(w)), w)
test_approx_eq(sinh(asinh(x)), x)
test_approx_eq(atan(w), measurement(-0.4636476090008061, 0.024))
test_approx_eq(atand(w), measurement(-26.56505117707799, 1.3750987083139758))
test_approx_eq(atanh(w), measurement(-0.5493061443340548, 0.04))
for a in (w, x, y); test_approx_eq(tan(atan(a)), a); end
for a in (w, x, y); test_approx_eq(tand(atand(a)), a); end
test_approx_eq(tanh(atanh(w)), w)
test_approx_eq(atan2(x, y), measurement(0.6435011087932844, 0.028844410203711916))
test_approx_eq(atan2(x, 5), measurement(0.5404195002705842, 0.014705882352941178))
test_approx_eq(atan2(-3, y), measurement(-0.6435011087932844, 0.024))

# Reciprocal trig functions
test_approx_eq(csc(y), measurement(-1.3213487088109024, 0.228247438348944))
test_approx_eq(cscd(y), measurement(14.335587026203676, 0.7156144742178738))
test_approx_eq(csch(y), measurement(0.03664357032586561, 0.007333632734561779))
for a in (w, x, y); test_approx_eq(csc(a),  1/sin(a)); end
for a in (w, x, y); test_approx_eq(cscd(a), 1/sin(deg2rad(a))); end
for a in (w, x, y); test_approx_eq(csch(a), 1/sinh(a)); end
test_approx_eq(sec(w), measurement(1.139493927324549, 0.018675251089778414))
test_approx_eq(secd(w), measurement(1.000038078385737, 4.5695512845605615e-6))
test_approx_eq(sech(w), measurement(0.886818883970074, 0.012294426649942352))
for a in (w, x, y); test_approx_eq(sec(a),  1/cos(a)); end
for a in (w, x, y); test_approx_eq(secd(a), 1/cos(deg2rad(a))); end
for a in (w, x, y); test_approx_eq(sech(a), 1/cosh(a)); end
test_approx_eq(cot(x), measurement(-7.015252551434534, 5.021376836040872))
test_approx_eq(cotd(x), measurement(19.08113668772821, 0.6372018679183983))
test_approx_eq(coth(x), measurement(1.0049698233136892, 0.000996434577114765))
for a in (w, x, y); test_approx_eq(cot(a),  1/tan(a)); end
for a in (w, x, y); test_approx_eq(cotd(a), 1/tan(deg2rad(a))); end
for a in (w, x, y); test_approx_eq(coth(a), 1/tanh(a)); end

# Exponentials
test_approx_eq(exp(x), measurement(20.085536923187668, 2.008553692318767))
for a in (w, x, y); test_approx_eq(expm1(a), exp(a) - 1); end
for a in (w, x, y); test_approx_eq(exp10(a), 10^a); end
for a in (w, 3//5*w, x/10, x, y/50, y); test_approx_eq(ldexp(frexp(a)...), a); end

# Logarithm
test_approx_eq(log(x, y), measurement(1.261859507142915, 0.059474298734200806))
test_approx_eq(log(y), measurement(1.3862943611198906, 0.05))
test_approx_eq(log(y, 4), measurement(1, 0.03606737602222409))
for a in (x, y); test_approx_eq(log(e, a), log(a)); end
for a in (x, y); test_approx_eq(log(2, a), log2(a)); end
for a in (x, y); test_approx_eq(log(10, a), log10(a)); end
for a in (x, y); test_approx_eq(log1p(a), log(1 + a)); end
test_approx_eq(log(pi, x), measurement(0.9597131185693899, 0.029118950894341064))
for a in (w, x, y); test_approx_eq(log(exp(a)), a); end
for a in (x, y); test_approx_eq(exp(log(a)), a); end

# Hypotenus
test_approx_eq(hypot(x, y), measurement(5, 0.17088007490635065))
test_approx_eq(hypot(x, y), hypot(y, x)) # Commutativity
test_approx_eq(hypot(x, 4), measurement(5, 0.06))
test_approx_eq(hypot(3, y), measurement(5, 0.16))

# Square root
test_approx_eq(sqrt(y), measurement(2, 0.05))
for a in (x, y); test_approx_eq(sqrt(a), a^0.5); end
for a in (x, y); test_approx_eq(sqrt(a)*sqrt(a), a); end
# Derivative of sqrt diverges in 0, but if the measurement is exact (like "a-a"
# is) also the resulting quantity must have 0 uncertainty.
for a in (w, x, y); test_approx_eq(sqrt(a - a), measurement(0)); end

# Cube root
test_approx_eq(cbrt(x), measurement(1.4422495703074083, 0.01602499522563787))
for a in (x, y); test_approx_eq(cbrt(a), a^(1/3)); end
for a in (x, y); test_approx_eq(cbrt(a)*cbrt(a)^2, a); end

# Absolute value
test_approx_eq(abs(-x), x)
test_approx_eq(abs(measurement(0, 2)), measurement(0, 2))
for a in (w, x, y); test_approx_eq(abs2(a), a*a); end

# Zero
test_approx_eq(zero(x), measurement(0))

# Sign
test_approx_eq(sign(x), measurement(1))
test_approx_eq(sign(-y), measurement(-1))
test_approx_eq(sign(measurement(0, 5)), measurement(0))
@test copysign(x, -5) == -x
@test copysign(x, w) == -x
@test copysign(5, w) == -5
@test copysign(1//2, w) == -1//2
@test copysign(w, w) == w
@test copysign(Float32(5), w) == -5
@test copysign(Float64(5), w) == -5
@test copysign(pi, w) == -pi
@test flipsign(x, -5) == -x
@test flipsign(w, w) == -w
@test flipsign(-5, w) == 5
@test flipsign(Float32(-5), w) == 5
@test flipsign(Float64(-5), w) == 5
@test flipsign(pi, w) == -pi

# One
test_approx_eq(one(y), measurement(1))

# Error function
test_approx_eq(erf(x), measurement(0.9999779095030014, 1.3925305194674787e-5))
test_approx_eq(erfinv(erf(w)), w)
test_approx_eq(erfc(w), 1 - erf(w))
for a in (w, x, y); test_approx_eq(erfcinv(erfc(a)), a); end
for a in (w, x, y); test_approx_eq(erfcx(a), exp(a^2)*erfc(a)); end
test_approx_eq(erfi(x), 1629.9946226015657 ± 914.3351093102547)
for a in (w, x, y); test_approx_eq(dawson(a), 0.5*exp(-a^2)*erfi(a)*sqrt(pi)); end

# Factorial and gamma
test_approx_eq(factorial(x), measurement(6, 0.7536706010590813))
for a in (w, x, y); test_approx_eq(gamma(a), factorial(a - 1)); end
for a in (w, x, y); test_approx_eq(gamma(a + 1), factorial(a)); end
for a in (x, y); test_approx_eq(lgamma(a), log(gamma(a))); end
test_approx_eq(digamma(y), 1.256117668431802 ± 0.056764591147422994)
for a in (w, x, y); test_approx_eq(digamma(a), polygamma(0, a)); end
for a in (w, x, y); test_approx_eq(digamma(invdigamma(a)), a); end
test_approx_eq(polygamma(3, w), 193.40909103400242 ± 0.10422749480000776)
for a in (w, x, y); test_approx_eq(trigamma(a), polygamma(1, a)); end

# Beta function
for a in (w, x, y); test_approx_eq(beta(a, x), gamma(a)*gamma(x)/gamma(a + x)); end
for a in (w, x, y); test_approx_eq(beta(a, pi), gamma(a)*gamma(pi)/gamma(a + pi)); end
for a in (w, x, y); test_approx_eq(beta(e, a), gamma(e)*gamma(a)/gamma(e + a)); end
for a in (x, y); test_approx_eq(lbeta(a, x), log(beta(a, x))); end
for a in (x, y); test_approx_eq(lbeta(a, pi), log(beta(a, pi))); end
for a in (x, y); test_approx_eq(lbeta(e, a), log(beta(e, a))); end

# Airy functions
test_approx_eq(airy(0, x), 0.006591139357460721 ± 0.0011912976705951322)
test_approx_eq(airy(1, x), -0.01191297670595132 ± 0.0019773418072382165)
test_approx_eq(airy(2, x), 14.037328963730136 ± 2.2922214966382017)
test_approx_eq(airy(3, x), 22.922214966382015 ± 4.211198689119041)
for a in (w, x, y); test_approx_eq(airy(a), airy(0, a)); end
for a in (w, x, y); test_approx_eq(airyai(a), airy(0, a)); end
for a in (w, x, y); test_approx_eq(airyprime(a), airy(1, a)); end
for a in (w, x, y); test_approx_eq(airyaiprime(a), airy(1, a)); end
for a in (w, x, y); test_approx_eq(airybi(a), airy(2, a)); end
for a in (w, x, y); test_approx_eq(airybiprime(a), airy(3, a)); end

# Bessel functions
for a in (x, y); test_approx_eq(2*besselj1(a)/a, besselj0(a) + besselj(2, a)); end
for a in (x, y); test_approx_eq(besselj(-1/2, a), sqrt(2/(pi*a))*cos(a)); end
for a in (x, y); test_approx_eq(besselj(1/2, a), sqrt(2/(pi*a))*sin(a)); end
test_approx_eq(bessely0(x), 0.3768500100127904 ± 0.03246744247917999)
for a in (x, y); test_approx_eq(bessely1(a), -bessely(-1, a)); end
for a in (x, y); test_approx_eq(bessely(5/2, a),
                                (besselj(5/2, a)*cos(2.5pi) -
                                 besselj(-5/2, a))/sin(2.5pi)); end
for a in (x, y), k in (1, 2), nu in -1:1
    sgn = k == 1 ? +1 : -1
    test_approx_eq(besselh(nu, k, a),
                   besselj(nu, a) + sgn*im*bessely(nu, a))
end
test_approx_eq(besseli(5//2, y), 4.757626874823528 ± 1.0398232869843944)
for a in (x, y); test_approx_eq(besselix(3, a), besseli(3, a)*exp(-abs(a))); end
test_approx_eq(besselk(7//3, x), 0.07521953258226349 ± 0.010340691203742959)
for a in (x, y); test_approx_eq(besselkx(3//4, a), besselk(3//4, a)*exp(a)); end

# Modulo
let
    frac, int = modf(x + w)
    test_approx_eq(frac, x + w - int)
    @test_approx_eq int floor((x + w).val)
end

for a in (x, y) # Test property of "mod" function
    b = 10.0*w
    test_approx_eq(mod(a, b), a - fld(a, b)*b)
end
test_approx_eq(mod(y, -3), y + fld(y, -3)*3)
test_approx_eq(mod(-5.8, x), 0.2 ± 0.2)

for a in (x, y) # Test property of "rem" function
    b = 10.0*w
    test_approx_eq(rem(a, b), a - div(a, b)*b)
end
test_approx_eq(rem(y, -3), y + div(y, -3)*3)
test_approx_eq(rem(-5.8, x), -2.8 ± 0.1)
test_approx_eq(mod2pi(pi*x), measurement(pi, 0.1*pi))

# Machine precisionx
@test_approx_eq eps(Measurement{Float64}) eps(Float64)
@test_approx_eq eps(x) eps(x.val)
@test_approx_eq nextfloat(x) nextfloat(x.val)
@test_approx_eq maxintfloat(Measurement{Float64}) maxintfloat(Float64)

# Rounding
@test_approx_eq round(w) round(w.val)
@test_approx_eq round(Int, w) round(Int, w.val)
@test_approx_eq floor(w) floor(w.val)
@test_approx_eq floor(Int, w) floor(Int, w.val)
@test_approx_eq ceil(w) ceil(w.val)
@test_approx_eq ceil(Int, w) ceil(Int, w.val)
@test_approx_eq trunc(w) trunc(w.val)
@test_approx_eq trunc(Int, w) trunc(Int, w.val)

# Widening
@test widen(Measurement{Float32}) == Measurement{Float64}

# To big float and widemul
test_approx_eq(widemul(x, y), big(x)*big(y))

# Dummy calls to show
show(DevNull, x)
show(DevNull, complex(x, w))
show(DevNull, complex(x, y))

# Sum
test_approx_eq(sum((x, w, x, y, -w)), 2x + y)
test_approx_eq(sum([x, w, x, y, -w]), 2x + y)

# Prod
test_approx_eq(prod((w, x, y, -w)), -w^2 * x * y)
test_approx_eq(prod([w, x, y, -w]), -w^2 * x * y)
test_approx_eq(prod((w, x, y, -w, 0)), 0 ± 0)
test_approx_eq(prod([w, x, y, -w, 0]), 0 ± 0)

##### Some functions not defined in Measurements.jl that work out-of-the-box.
# Mean
test_approx_eq(mean((x, w, x, y, -w)), (2x + y)/5)
test_approx_eq(mean([x, w, x, y, -w]), (2x + y)/5)

# min, max, extrema
@test min(w, x, y) === w
@test max(w, x, y) === y
@test extrema([w, x, y]) == (w, y)

# sort
@test sort([y, w, x]) == [w, x, y]

##### Calculations with NaNs
# NaN as nominal value
@test isequal(2*(NaN ± 3), NaN ± 6)
# NaN as uncertainty
@test isequal(value(2*(3 ± NaN)), 6) && isequal(uncertainty(2*(3 ± NaN)), NaN)
# Both
@test isequal(value(2*(NaN ± NaN)), NaN) && isequal(uncertainty(2*(NaN ± NaN)), NaN)

##### Test @uncertain macro
test_approx_eq_eps(@uncertain(tan(x)), tan(x), 2e-11)
test_approx_eq_eps(@uncertain((a -> a + a + a)(x)), 3x, 3e-12)
test_approx_eq(@uncertain(zeta(x)),
               measurement(1.2020569031595951, 0.019812624290876782))
for f in (log, hypot, atan2); test_approx_eq_eps(@uncertain(f(x, y)), f(x, y), 2e-12); end
test_approx_eq_eps(@uncertain(((a,b,c,d,e,f) -> a+b+c+d+e+f)(x, 2x, y, log(y), -w, w^2)),
                   3x + y + log(y) - w + w^2, 7e-12)

let
    # Test with a "ccall"
    f(x) = x*x
    ptr = cfunction(f, Cdouble, (Cdouble,))
    g(x) = ccall(ptr, Cdouble, (Cdouble,), x)*x
    test_approx_eq_eps(@uncertain(g(x)), x^3, 4e-11)
end

# Test getindex with Derivatives type
@test_throws KeyError getindex(x.der, 0)

##### value, uncertainty
@test value([w, x, y]) == [-0.5, 3.0, 4.0]
@test value([complex(w, x)]) == [complex(-0.5, 3.0)]
@test uncertainty([w, x, y]) == [0.03, 0.1, 0.2]
@test uncertainty([complex(w, x)]) == [complex(0.03, 0.1)]

##### Test `length' method
@test length((w + w + 2x + y).der) == 3

##### Big Floats
a = big"3.00000001" ± big"1e-17"
b = big"4.00000001" ± big"1e-17"
c = big"5.00000001" ± big"1e-15"
for X in (a, b, c); test_approx_eq(sin(X*X + X*X)/cos(X*X + X*X), tan(2X^2)); end
test_approx_eq(a*b,
               big"12.0000000700000001" ±
               big"5.000000014000000000399999998880000003119999991353600023834879934652928178154734e-17")
test_approx_eq(a/x + w/b,
               big"8.750000036458332770409319189914605364095140370607375793457032012939451217651416e-01" ±
               big"3.416666677095189699499391052146002403356891669706809079678073000173723744722607e-02")

##### Parsing of strings
test_approx_eq(measurement("-123.4(56)"),         -123.4 ± 5.6)
test_approx_eq(measurement("+1234(56)e-1"),        123.4 ± 5.6)
test_approx_eq(measurement("(+1.234 ± 0.056)e2"),  123.4 ± 5.6)
test_approx_eq(measurement("-12.34e1 +- 0.56e1"), -123.4 ± 5.6)
test_approx_eq(measurement("1234e-1 +/- 5.6e0"),   123.4 ± 5.6)
test_approx_eq(measurement("-1234e-1"), measurement(-1234e-1))
@test_throws ErrorException measurement("abc")
@test_throws ErrorException measurement("(2±1")
@test_throws ErrorException measurement("2±1)e2")
@test_throws ErrorException measurement("(2)")
@test_throws ErrorException measurement("(2)e-2")

include("complex.jl")
