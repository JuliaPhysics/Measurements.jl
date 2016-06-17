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

# Weighted Average with Inverse-Variance Weighting
test_approx_eq(weightedmean((w, x, y)),
               Measurement(-0.12584269662921355, 0.028442727788398632))

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
                                  complex(Measurement(7.0)))
@test promote(complex(0, 1 ± 0), 2.1 ± 0.2) ==
    (complex(0, 1.0 ± 0), complex(2.1 ± 0.2))

##### Comparisons and Tests
@test z == x != y
@test x == x
@test -2 < w <= x < y < 5
@test 3 == x
@test y == 4 != w
@test Measurement(0.8, 0.01) == 4//5
@test Measurement(π) == π
@test e == Measurement(e)
@test 4//5 == Measurement(0.8, 0.03)
@test isnan(x) == false
@test isfinite(y) == true && isfinite(Measurement(Inf)) == false
@test isinf(Measurement(Inf)) == true && isinf(x) == false
@test (isinteger(x) == true && isinteger(w) == false)

##### Mathematical Operations
# Addition
test_approx_eq(+x, x)
test_approx_eq(x + y, Measurement(7, 0.22360679774997896))
test_approx_eq(x + y, y + x) # Commutativity
test_approx_eq(2 + x, Measurement(5, 0.1))
test_approx_eq(x + 5//2, Measurement(5.5, 0.1))
test_approx_eq(x + true, Measurement(4, 0.1))
test_approx_eq(x + 2, Measurement(5, 0.1))
# Test correlation
for a in (w, x, y); test_approx_eq(a + a + a, 3a); end

# Subtraction
test_approx_eq(-x, Measurement(-3, 0.1))
test_approx_eq(x - y, Measurement(-1, 0.22360679774997896))
test_approx_eq(2 - x, Measurement(-1, 0.1))
test_approx_eq(x - 2, Measurement(1, 0.1))
# Test correlation
for a in (w, x, y); test_approx_eq(a - a, Measurement(0)); end

# Multiplication
test_approx_eq(x*y, Measurement(12, 0.7211102550927979))
test_approx_eq(x*y, y*x) # Commutativity
test_approx_eq(2x, Measurement(6, 0.2))
test_approx_eq(x*3, Measurement(9, 0.3))
test_approx_eq(w*0, Measurement(0))
test_approx_eq(true*x, x)
test_approx_eq(y*false, Measurement(0))
for a in (w, x, y); test_approx_eq(a*(0 ± 1), Measurement(0, abs(a.val))); end
# Test correlation
for a in (x, y); test_approx_eq(a*a*a, a^3); end

# Division
test_approx_eq(x/y, Measurement(0.75, 0.04506939094329987))
test_approx_eq(x/10, Measurement(0.3, 0.01))
test_approx_eq(1/y, Measurement(0.25, 0.0125))
test_approx_eq(0/x, Measurement(0))
test_approx_eq(div(1.2*x, w), Measurement(-7))
test_approx_eq(div(x, 1.2), Measurement(2))
test_approx_eq(div(9.4, y), Measurement(2))
test_approx_eq(fld(1.2*x, w), Measurement(-8))
test_approx_eq(fld(x, 1.2), Measurement(2))
test_approx_eq(fld(9.4, y), Measurement(2))
test_approx_eq(cld(1.2*x, w), Measurement(-7))
test_approx_eq(cld(x, 1.2), Measurement(3))
test_approx_eq(cld(9.4, y), Measurement(3))
for a in (w, x, y); test_approx_eq((0 ± 1)/a, Measurement(0, 1/abs(a.val))); end
# Test correlation
for a in (w, x, y); test_approx_eq(a/a, Measurement(1)); end

# Inverse
for a in (w, x, y); test_approx_eq(inv(a), 1/a); end

# signbit
@test signbit(x) == false
@test signbit(w) == true

# Power
test_approx_eq(x^y, Measurement(81, 20.818061515800505))
for a in (w, x, y); test_approx_eq(a^(-1), inv(a)); end
test_approx_eq(x^2, Measurement(9, 0.6))
for a in (w, x, y); test_approx_eq(a^2, a^2.0); end
test_approx_eq(y^(1//2), Measurement(2, 0.05))
for a in (w, x, y); test_approx_eq(a^(4//2), a*a); end
test_approx_eq(x^(pi), Measurement(31.54428070019754, 3.3033093503504967))
test_approx_eq(2^x, Measurement(8, 0.5545177444479562))
for a in (w, x, y); test_approx_eq(2^a, 2.0^a); end
test_approx_eq(pi^x, Measurement(31.006276680299816, 3.5493811564854525))
for val in (w, x, y); test_approx_eq(e^val, exp(val)); end
for val in (w, x, y); test_approx_eq(exp2(val), 2^val); end
test_approx_eq(z^2.5, x^2.5)
test_approx_eq(z^3, x^3)

# rad2deg
test_approx_eq(rad2deg(x), Measurement(171.88733853924697, 5.729577951308232))

# Cosine
test_approx_eq(cos(x), Measurement(-0.9899924966004454, 0.014112000805986721))
test_approx_eq(cosd(x), Measurement(0.9986295347545738, 9.134347536190512e-5))
test_approx_eq(cosh(x), Measurement(10.067661995777765, 1.0017874927409902))

# Sine
test_approx_eq(sin(y), Measurement(-0.7568024953079282, 0.13072872417272238))
test_approx_eq(sind(y), Measurement(0.0697564737441253, 0.0034821554353128255))
test_approx_eq(sinh(y), Measurement(27.28991719712775, 5.461646567203298))

#Tangent
for val in (w, x, y); test_approx_eq(tan(val), sin(val)/cos(val)); end
for val in (w, x, y); test_approx_eq(tand(val), sind(val)/cosd(val)); end
for val in (w, x, y); test_approx_eq(tanh(val), sinh(val)/cosh(val)); end

# Inverse trig functions
test_approx_eq(acos(w), Measurement(2.0943951023931957, 0.034641016151377546))
test_approx_eq(acosd(w), Measurement(120, 1.9847840235184515))
test_approx_eq(acosh(x), Measurement(1.7627471740390859, 0.035355339059327376))
test_approx_eq(cos(acos(w)), w)
test_approx_eq(cosd(acosd(w)), w)
test_approx_eq(cosh(acosh(x)), x)
test_approx_eq(asin(w), Measurement(-0.5235987755982989, 0.034641016151377546))
test_approx_eq(asind(w), Measurement(-30, 1.9847840235184515))
test_approx_eq(asinh(x), Measurement(1.8184464592320668, 0.0316227766016838))
test_approx_eq(sin(asin(w)), w)
test_approx_eq(sind(asind(w)), w)
test_approx_eq(sinh(asinh(x)), x)
test_approx_eq(atan(w), Measurement(-0.4636476090008061, 0.024))
test_approx_eq(atand(w), Measurement(-26.56505117707799, 1.3750987083139758))
test_approx_eq(atanh(w), Measurement(-0.5493061443340548, 0.04))
for a in (w, x, y); test_approx_eq(tan(atan(a)), a); end
for a in (w, x, y); test_approx_eq(tand(atand(a)), a); end
test_approx_eq(tanh(atanh(w)), w)
test_approx_eq(atan2(x, y), Measurement(0.6435011087932844, 0.028844410203711916))
test_approx_eq(atan2(x, 5), Measurement(0.5404195002705842, 0.014705882352941178))
test_approx_eq(atan2(-3, y), Measurement(-0.6435011087932844, 0.024))

# Reciprocal trig functions
test_approx_eq(csc(y), Measurement(-1.3213487088109024, 0.228247438348944))
test_approx_eq(cscd(y), Measurement(14.335587026203676, 0.7156144742178738))
test_approx_eq(csch(y), Measurement(0.03664357032586561, 0.007333632734561779))
for a in (w, x, y); test_approx_eq(csc(a),  1/sin(a)); end
for a in (w, x, y); test_approx_eq(cscd(a), 1/sin(deg2rad(a))); end
for a in (w, x, y); test_approx_eq(csch(a), 1/sinh(a)); end
test_approx_eq(sec(w), Measurement(1.139493927324549, 0.018675251089778414))
test_approx_eq(secd(w), Measurement(1.000038078385737, 4.5695512845605615e-6))
test_approx_eq(sech(w), Measurement(0.886818883970074, 0.012294426649942352))
for a in (w, x, y); test_approx_eq(sec(a),  1/cos(a)); end
for a in (w, x, y); test_approx_eq(secd(a), 1/cos(deg2rad(a))); end
for a in (w, x, y); test_approx_eq(sech(a), 1/cosh(a)); end
test_approx_eq(cot(x), Measurement(-7.015252551434534, 5.021376836040872))
test_approx_eq(cotd(x), Measurement(19.08113668772821, 0.6372018679183983))
test_approx_eq(coth(x), Measurement(1.0049698233136892, 0.000996434577114765))
for a in (w, x, y); test_approx_eq(cot(a),  1/tan(a)); end
for a in (w, x, y); test_approx_eq(cotd(a), 1/tan(deg2rad(a))); end
for a in (w, x, y); test_approx_eq(coth(a), 1/tanh(a)); end

# Exponentials
test_approx_eq(exp(x), Measurement(20.085536923187668, 2.008553692318767))
for a in (w, x, y); test_approx_eq(expm1(a), exp(a) - 1); end
for a in (w, x, y); test_approx_eq(exp10(a), 10^a); end
for val in (w, x, y)
    a, b = frexp(val)
    test_approx_eq(a*2^b, val)
end
for a in (w, x, y); test_approx_eq(ldexp(a, 3), a*2^3); end

# Logarithm
test_approx_eq(log(x, y), Measurement(1.261859507142915, 0.059474298734200806))
test_approx_eq(log(y), Measurement(1.3862943611198906, 0.05))
test_approx_eq(log(y, 4), Measurement(1, 0.03606737602222409))
for a in (x, y); test_approx_eq(log(e, a), log(a)); end
for a in (x, y); test_approx_eq(log(10, a), log10(a)); end
for a in (x, y); test_approx_eq(log1p(a), log(1 + a)); end
test_approx_eq(log(pi, x), Measurement(0.9597131185693899, 0.029118950894341064))
for a in (w, x, y); test_approx_eq(log(exp(a)), a); end
for a in (x, y); test_approx_eq(exp(log(a)), a); end

# Hypotenus
test_approx_eq(hypot(x, y), Measurement(5, 0.17088007490635065))
test_approx_eq(hypot(x, y), hypot(y, x)) # Commutativity
test_approx_eq(hypot(x, 4), Measurement(5, 0.06))
test_approx_eq(hypot(3, y), Measurement(5, 0.16))

# Square root
test_approx_eq(sqrt(y), Measurement(2, 0.05))
for a in (x, y); test_approx_eq(sqrt(a), a^0.5); end
for a in (x, y); test_approx_eq(sqrt(a)*sqrt(a), a); end

# Cube root
test_approx_eq(cbrt(x), Measurement(1.4422495703074083, 0.01602499522563787))
for a in (x, y); test_approx_eq(cbrt(a), a^(1/3)); end
for a in (x, y); test_approx_eq(cbrt(a)*cbrt(a)^2, a); end

# Absolute value
test_approx_eq(abs(-x), x)
test_approx_eq(abs(Measurement(0, 2)), Measurement(0, 2))

# Zero
test_approx_eq(zero(x), Measurement(0))

# Sign
test_approx_eq(sign(x), Measurement(1))
test_approx_eq(sign(-y), Measurement(-1))
test_approx_eq(sign(Measurement(0, 5)), Measurement(0))
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
test_approx_eq(one(y), Measurement(1))

# Error function
test_approx_eq(erf(x), Measurement(0.9999779095030014, 1.3925305194674787e-5))
test_approx_eq(erfinv(erf(w)), w)
test_approx_eq(erfc(w), 1 - erf(w))
for a in (w, x, y); test_approx_eq(erfcinv(erfc(a)), a); end
for a in (w, x, y); test_approx_eq(erfcx(a), exp(a^2)*erfc(a)); end

# Factorial and gamma
test_approx_eq(factorial(x), Measurement(6, 0.7536706010590813))
for a in (w, x, y); test_approx_eq(gamma(a), factorial(a - 1)); end
for a in (w, x, y); test_approx_eq(gamma(a + 1), factorial(a)); end
for a in (x, y); test_approx_eq(lgamma(a), log(gamma(a))); end

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
test_approx_eq(mod2pi(pi*x), Measurement(pi, 0.1*pi))

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

# Dummy call to show
show(DevNull, x)

##### Some functions not defined in Measurements.jl that work out-of-the-box.
# Sum
test_approx_eq(sum((w, x, y)), w+x+y)

# Mean
test_approx_eq(mean((w, x, y)), (w + x + y)/3)

# min, max, extrema
@test min(w, x, y) === w
@test max(w, x, y) === y
@test extrema([w, x, y]) == (w, y)

# sort
@test sort([y, w, x]) == [w, x, y]

##### Test @uncertain macro
test_approx_eq_eps(@uncertain(tan(x)), tan(x), 2e-11)
test_approx_eq_eps(@uncertain((a -> a + a + a)(x)), 3x, 3e-12)
test_approx_eq(@uncertain(zeta(x)),
               Measurement(1.2020569031595951, 0.019812624290876782))
let
    # Test with a "ccall"
    f(x) = x*x
    ptr = cfunction(f, Cdouble, (Cdouble,))
    g(x) = ccall(ptr, Cdouble, (Cdouble,), x)*x
    test_approx_eq_eps(@uncertain(g(x)), x^3, 4e-11)
end

# Test getindex with Derivatives type
@test_throws KeyError getindex(x.der, 0)

include("complex.jl")
