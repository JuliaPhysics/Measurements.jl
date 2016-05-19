using Measurements
using Base.Test

test_approx_eq(a::Measurement, b::Measurement) =
    (@test_approx_eq(a.val, b.val) ; @test_approx_eq(a.err, b.err))

let
    local w, x, y, z
    w = -0.5 ± 0.03
    x = 3 ± 0.1
    y = 4 ± 0.2
    z = complex(3.0) ± 0.1
    ##### Comparisons
    @test z == x != y
    @test x == x
    @test w < x < y
    @test 3 == x
    @test y == 4 != w
    ##### Mathematical Operations
    # Addition
    test_approx_eq(+x, x)
    test_approx_eq(x + y, Measurement(7, 0.22360679774997896))
    test_approx_eq(x + y, y + x) # Commutativity
    test_approx_eq(2 + x, Measurement(5, 0.1))
    test_approx_eq(x + 2, Measurement(5, 0.1))
    # Subtraction
    test_approx_eq(-x, Measurement(-3, 0.1))
    test_approx_eq(x - y, Measurement(-1, 0.22360679774997896))
    test_approx_eq(2 - x, Measurement(-1, 0.1))
    test_approx_eq(x - 2, Measurement(1, 0.1))
    # Multiplication
    test_approx_eq(x*y, Measurement(12, 0.7211102550927979))
    test_approx_eq(x*y, y*x) # Commutativity
    test_approx_eq(2x, Measurement(6, 0.2))
    test_approx_eq(x*3, Measurement(9, 0.3))
    test_approx_eq(true*x, x)
    test_approx_eq(y*false, Constant(0))
    # Division
    test_approx_eq(x/y, Measurement(0.75, 0.04506939094329987))
    test_approx_eq(x/10, Measurement(0.3, 0.01))
    test_approx_eq(1/y, Measurement(0.25, 0.0125))
    # Inverse
    test_approx_eq(inv(y), 1/y)
    # signbit
    @test signbit(x) == false
    @test signbit(w) == true
    # Power
    test_approx_eq(x^y, Measurement(81, 20.818061515800505))
    test_approx_eq(x^(-1), inv(x))
    test_approx_eq(x^2, Measurement(9, 0.6))
    test_approx_eq(y^2, y^2.0)
    test_approx_eq(y^(1//2), Measurement(2, 0.05))
    test_approx_eq(2^x, Measurement(8, 0.5545177444479562))
    test_approx_eq(2^y, 2.0^y)
    test_approx_eq(pi^x, Measurement(31.006276680299816, 3.5493811564854525))
    test_approx_eq(e^y, exp(y))
    test_approx_eq(2^x, exp2(x))
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
    test_approx_eq(tan(x), Measurement(-0.1425465430742778, 0.10203195169424271))
    test_approx_eq(tand(x), Measurement(0.05240777928304121, 0.0017501229302595022))
    test_approx_eq(tanh(x), Measurement(0.9950547536867305, 0.0009866037165440192))
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
    test_approx_eq(tan(atan(w)), w)
    test_approx_eq(tand(atand(w)), w)
    test_approx_eq(tanh(atanh(w)), w)
    test_approx_eq(atan2(x, y), Measurement(0.6435011087932844, 0.028844410203711916))
    test_approx_eq(atan2(x, 5), Measurement(0.5404195002705842, 0.014705882352941178))
    test_approx_eq(atan2(-3, y), Measurement(-0.6435011087932844, 0.024))
    # Reciprocal trig functions
    test_approx_eq(csc(y), Measurement(-1.3213487088109024, 0.228247438348944))
    test_approx_eq(cscd(y), Measurement(-75.70770427992548, 13.077614902066948))
    test_approx_eq(csch(y), Measurement(0.03664357032586561, 0.007333632734561779))
    test_approx_eq(csc(x),  1/sin(x))
    test_approx_eq(cscd(y), rad2deg(1/sin(y)))
    test_approx_eq(csch(w), 1/sinh(w))
    test_approx_eq(sec(w), Measurement(1.139493927324549, 0.018675251089778414))
    test_approx_eq(secd(w), Measurement(65.28819281648362, 1.0700130687913942))
    test_approx_eq(sech(w), Measurement(0.886818883970074, 0.012294426649942352))
    test_approx_eq(sec(x),  1/cos(x))
    test_approx_eq(secd(y), rad2deg(1/cos(y)))
    test_approx_eq(sech(w), 1/cosh(w))
    test_approx_eq(cot(x), Measurement(-7.015252551434534, 5.021376836040872))
    test_approx_eq(cotd(x), Measurement(-401.9443634155813, 287.7037000498967))
    test_approx_eq(coth(x), Measurement(1.0049698233136892, 0.000996434577114765))
    test_approx_eq(cot(x),  1/tan(x))
    test_approx_eq(cotd(y), rad2deg(1/tan(y)))
    test_approx_eq(coth(w), 1/tanh(w))
    # Exponentials
    test_approx_eq(exp(x), Measurement(20.085536923187668, 2.008553692318767))
    test_approx_eq(expm1(y), exp(y) - 1)
    # Logarithm
    test_approx_eq(log(x, y), Measurement(1.261859507142915, 0.059474298734200806))
    test_approx_eq(log(y), Measurement(1.3862943611198906, 0.05))
    test_approx_eq(log(y, 4), Measurement(1, 0.03606737602222409))
    test_approx_eq(log(e, y), log(y))
    test_approx_eq(log(10, x), log10(x))
    test_approx_eq(log1p(x), log(1 + x))
    test_approx_eq(log(pi, x), Measurement(0.9597131185693899, 0.029118950894341064))
    test_approx_eq(log(exp(x)), x)
    test_approx_eq(exp(log(y)), y)
    # Hypotenus
    test_approx_eq(hypot(x, y), Measurement(5, 0.17088007490635065))
    test_approx_eq(hypot(x, y), hypot(y, x)) # Commutativity
    test_approx_eq(hypot(x, 4), Measurement(5, 0.06))
    test_approx_eq(hypot(3, y), Measurement(5, 0.16))
    # Square root
    test_approx_eq(sqrt(y), Measurement(2, 0.05))
    test_approx_eq(sqrt(x), x^0.5)
    test_approx_eq(sqrt(y)^2, y)
    # Cube root
    test_approx_eq(cbrt(x), Measurement(1.4422495703074083, 0.01602499522563787))
    test_approx_eq(cbrt(y), y^(1/3))
    test_approx_eq(cbrt(x)^3, x)
    # Absolute value
    test_approx_eq(abs(-y), y)
    test_approx_eq(abs(Measurement(0, 2)), Measurement(0, 2))
    # Zero
    test_approx_eq(zero(x), Measurement(0))
    # Sign
    test_approx_eq(sign(x), Measurement(1))
    test_approx_eq(sign(-y), Measurement(-1))
    test_approx_eq(sign(Measurement(0, 5)), Measurement(0))
    # One
    test_approx_eq(one(y), Measurement(1))
    # Error function
    test_approx_eq(erf(x), Measurement(0.9999779095030014, 1.3925305194674787e-5))
    test_approx_eq(erfc(w), 1 - erf(w))
    # Factorial and gamma
    test_approx_eq(factorial(x), Measurement(6, 0.7536706010590813))
    test_approx_eq(gamma(y), factorial(y - 1))
    test_approx_eq(gamma(w + 1), factorial(w))
    test_approx_eq(lgamma(x), log(gamma(x)))
    # Sum
    test_approx_eq(sum((w, x, y)), w+x+y)
    # Dummy call to show
    show(DevNull, x)
end
