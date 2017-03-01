using Measurements
using Base.Test

import Base: isapprox

isapprox(x::Measurement, y::Measurement; rest...) =
    isapprox(x.val, y.val; nans = true, rest...) &&
    isapprox(x.err, y.err; nans = true, rest...)
isapprox{T<:AbstractFloat,S<:AbstractFloat}(x::Complex{Measurement{T}},
                                            y::Complex{Measurement{S}};
                                            rest...) =
                                                isapprox(real(x), real(y); nans = true, rest...) &&
                                                isapprox(imag(x), imag(y); nans = true, rest...)

w = -0.5 ± 0.03
x = 3 ± 0.1
y = 4 ± 0.2
z = complex(x)

@testset "Standard Score" begin
    @test stdscore(w, x.val) ≈ -350/3
    @test stdscore(x, y) ≈ -4.472135954999579
    @test stdscore(w, y) ≈ stdscore(w - y, 0)
    @test stdscore(y, 4.1) ≈ stdscore(y, 4.1 ± 0)
end

@testset "measurement" begin
    @test measurement.(1:2:5, 2:2:6) == [1±2, 3±4, 5±6]
end

@testset "Weighted Average" begin
    @test weightedmean((w, x, y)) ≈ measurement(-0.12584269662921355, 0.028442727788398632)
end

@testset "Derivative" begin
    @test Measurements.derivative(3*x^2, (x.val, x.err, x.tag)) ≈ 18
    @test Measurements.derivative(3*x^2, x) ≈ 18
    @test Measurements.derivative.(2x + y - w, [x, y, w]) ≈ [2, 1, -1]
end

@testset "Contributions to uncertainty" begin
    @test sort(collect(values(Measurements.uncertainty_components(w * x * y)))) ≈
        [0.2, 0.3, 0.36]
end

@testset "Conversion and Promotion" begin
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
    @test promote_type(Measurement{Float32}, Float64) ==
        Measurement{Float64}
    @test promote_type(Measurement{BigFloat}, Measurement{Float64}) ==
        Measurement{BigFloat}
end

@testset "Comparisons and Tests" begin
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
end

##### Mathematical Operations
@testset "Addition" begin
    @test x + y ≈ measurement(7, 0.22360679774997896)
    @test 2 + x ≈ measurement(5, 0.1)
    @test x + 5//2 ≈ measurement(5.5, 0.1)
    @test x + true ≈ measurement(4, 0.1)
    @test x + 2 ≈ measurement(5, 0.1)
    for a in (w, x, y)
        @test +a ≈ a
        @test a + zero(a) ≈ a ≈ measurement(0) + a # Neutral element
        @test a + a + a ≈ 3a # Correlation
        for b in (w, x, y)
            @test a + b ≈ b + a # Commutativity
        end
    end
end

@testset "Subtraction" begin
    @test -x ≈ measurement(-3, 0.1)
    @test x - y ≈ measurement(-1, 0.22360679774997896)
    @test 2 - x ≈ measurement(-1, 0.1)
    @test x - 2 ≈ measurement(1, 0.1)
    # Test correlation
    for a in (w, x, y); @test a - a ≈ zero(a) ≈ measurement(0); end
end

@testset "Multiplication" begin
    @test x*y ≈ measurement(12, 0.7211102550927979)
    @test 2x ≈ measurement(6, 0.2)
    @test x*3 ≈ measurement(9, 0.3)
    for a in (w, x, y)
        @test a*(0 ± 1) ≈ measurement(0, abs(a.val))
        @test a * one(a) ≈ a ≈ measurement(1) * a # Neutral element
        @test a*a*a ≈ a^3 # Correlation
        for b in (w, x, y)
            @test a * b ≈ b * a # Commutativity
        end
        @test true * a ≈ a
        @test a * false ≈ measurement(0)
        @test a * 0 ≈ measurement(0)
    end
    for f in (muladd, fma)
        @test f(w, x, y) ≈ w*x + y
        @test f(w, x, 1) ≈ w*x + 1
        @test f(w, 2, y) ≈ w*2 + y
        @test f(w, 2, 1) ≈ w*2 + 1
        @test f(3, x, y) ≈ 3*x + y
        @test f(3, x, 1) ≈ 3*x + 1
        @test f(3, 2, y) ≈ 3*2 + y
    end
end

@testset "Division" begin
    @test x/y ≈ measurement(0.75, 0.04506939094329987)
    @test x/10 ≈ measurement(0.3, 0.01)
    @test 1/y ≈ measurement(0.25, 0.0125)
    @test div(1.2*x, w) ≈ measurement(-7)
    @test div(x, 1.2) ≈ measurement(2)
    @test div(9.4, y) ≈ measurement(2)
    @test fld(1.2*x, w) ≈ measurement(-8)
    @test fld(x, 1.2) ≈ measurement(2)
    @test fld(9.4, y) ≈ measurement(2)
    @test cld(1.2*x, w) ≈ measurement(-7)
    @test cld(x, 1.2) ≈ measurement(3)
    @test cld(9.4, y) ≈ measurement(3)
    for a in (w, x, y)
        @test 0/a ≈ measurement(0)
        @test (0 ± 1)/a ≈ measurement(0, 1/abs(a.val))
        # Test correlation
        @test a/a ≈ one(a) ≈ measurement(1)
        # Test derivatives of "div", "fld", and "cld".  They're defined to be exactly 0.
        # Should you discover this is not correct, update the test accordingly.
        for f in (div, fld, cld), b in (w, x, y)
            @test Measurements.derivative.(f(a, b), [a, b]) == [0.0, 0.0]
        end
    end
end

@testset "Inverse" begin
    for a in (w, x, y); @test inv(a) ≈ 1/a; end
end

@testset "signbit" begin
    @test signbit(x) == false
    @test signbit(w) == true
end

@testset "Power" begin
    @test x^y ≈ measurement(81, 20.818061515800505)
    @test x^2 ≈ measurement(9, 0.6)
    @test y^(1//2) ≈ measurement(2, 0.05)
    @test x^(pi) ≈ measurement(31.54428070019754, 3.3033093503504967)
    @test 2^x ≈ measurement(8, 0.5545177444479562)
    @test pi^x ≈ measurement(31.006276680299816, 3.5493811564854525)
    @test z^2.5 ≈ x^2.5
    @test z^3 ≈ x^3
    for a in (w, x, y)
        @test a^(-1) ≈ inv(a)
        @test a^2 ≈ a^2.0
        @test a^(4//2) ≈ a*a
        @test 2^a ≈ 2.0^a
        @test e^a ≈ exp(a)
        @test exp2(a) ≈ 2^a
    end
    # Make sure "p ± 0" behaves like "p", in particular with regard to the
    # uncertainty.
    for p in (-3, 0, 3); @test (0 ± 0.1)^(p ± 0) ≈ (0 ± 0.1)^p; end
end

@testset "Deg and rad" begin
    @test deg2rad(y) ≈ 0.06981317007977318 ± 0.003490658503988659
    @test rad2deg(x) ≈ measurement(171.88733853924697, 5.729577951308232)
end

@testset "Cosine" begin
@test cos(x) ≈ measurement(-0.9899924966004454, 0.014112000805986721)
@test cosd(x) ≈ measurement(0.9986295347545738, 9.134347536190512e-5)
@test cosh(x) ≈ measurement(10.067661995777765, 1.0017874927409902)
end

@testset "Sine" begin
    @test sin(y) ≈ measurement(-0.7568024953079282, 0.13072872417272238)
    @test sind(y) ≈ measurement(0.0697564737441253, 0.0034821554353128255)
    @test sinh(y) ≈ measurement(27.28991719712775, 5.461646567203298)
end

@testset "Tangent" begin
    for val in (w, x, y)
        @test tan(val) ≈ sin(val)/cos(val)
        @test tand(val) ≈ sind(val)/cosd(val)
        @test tanh(val) ≈ sinh(val)/cosh(val)
    end
end

@testset "Inverse trig functions" begin
    @test acos(w) ≈ measurement(2.0943951023931957, 0.034641016151377546)
    @test acosd(w) ≈ measurement(120, 1.9847840235184515)
    @test acosh(x) ≈ measurement(1.7627471740390859, 0.035355339059327376)
    @test cos(acos(w)) ≈ w
    @test cosd(acosd(w)) ≈ w
    @test cosh(acosh(x)) ≈ x
    @test asin(w) ≈ measurement(-0.5235987755982989, 0.034641016151377546)
    @test asind(w) ≈ measurement(-30, 1.9847840235184515)
    @test asinh(x) ≈ measurement(1.8184464592320668, 0.0316227766016838)
    @test sin(asin(w)) ≈ w
    @test sind(asind(w)) ≈ w
    @test sinh(asinh(x)) ≈ x
    @test atan(w) ≈ measurement(-0.4636476090008061, 0.024)
    @test atand(w) ≈ measurement(-26.56505117707799, 1.3750987083139758)
    @test atanh(w) ≈ measurement(-0.5493061443340548, 0.04)
    for a in (w, x, y); @test tan(atan(a)) ≈ a; end
    for a in (w, x, y); @test tand(atand(a)) ≈ a; end
    @test tanh(atanh(w)) ≈ w
    @test atan2(x, y) ≈ measurement(0.6435011087932844, 0.028844410203711916)
    @test atan2(x, 5) ≈ measurement(0.5404195002705842, 0.014705882352941178)
    @test atan2(-3, y) ≈ measurement(-0.6435011087932844, 0.024)
end

@testset "Reciprocal trig functions" begin
    @test csc(y) ≈ measurement(-1.3213487088109024, 0.228247438348944)
    @test cscd(y) ≈ measurement(14.335587026203676, 0.7156144742178738)
    @test csch(y) ≈ measurement(0.03664357032586561, 0.007333632734561779)
    @test sec(w) ≈ measurement(1.139493927324549, 0.018675251089778414)
    @test secd(w) ≈ measurement(1.000038078385737, 4.5695512845605615e-6)
    @test sech(w) ≈ measurement(0.886818883970074, 0.012294426649942352)
    @test cot(x) ≈ measurement(-7.015252551434534, 5.021376836040872)
    @test cotd(x) ≈ measurement(19.08113668772821, 0.6372018679183983)
    @test coth(x) ≈ measurement(1.0049698233136892, 0.000996434577114765)
    for a in (w, x, y)
        @test csc(a) ≈ 1/sin(a)
        @test cscd(a) ≈ 1/sin(deg2rad(a))
        @test csch(a) ≈ 1/sinh(a)
        @test sec(a) ≈  1/cos(a)
        @test secd(a) ≈ 1/cos(deg2rad(a))
        @test sech(a) ≈ 1/cosh(a)
        @test cot(a) ≈ 1/tan(a)
        @test cotd(a) ≈ 1/tan(deg2rad(a))
        @test coth(a) ≈ 1/tanh(a)
    end
end

@testset "Exponentials" begin
    @test exp(x) ≈ measurement(20.085536923187668, 2.008553692318767)
    for a in (w, 3//5*w, x/10, x, y/50, y)
        @test expm1(a) ≈ exp(a) - 1
        @test exp10(a) ≈ 10^a
        @test ldexp(frexp(a)...) ≈ a
    end
end

@testset "Logarithm" begin
    @test log(x, y) ≈ measurement(1.261859507142915, 0.059474298734200806)
    @test log(y) ≈ measurement(1.3862943611198906, 0.05)
    @test log(y, 4) ≈ measurement(1, 0.03606737602222409)
    @test log(pi, x) ≈ measurement(0.9597131185693899, 0.029118950894341064)
    for a in (w, x, y)
        @test log(e, abs(a)) ≈ log(abs(a))
        @test log(2, abs(a)) ≈ log2(abs(a))
        @test log(10, abs(a)) ≈ log10(abs(a))
        @test log1p(abs(a)) ≈ log(1 + abs(a))
        @test log(exp(a)) ≈ a
        @test exp(log(abs(a))) ≈ abs(a)
    end
end

@testset "Hypotenuse" begin
    @test hypot(x, y) ≈ measurement(5, 0.17088007490635065)
    @test hypot(x, y) ≈ hypot(y, x) # Commutativity
    @test hypot(x, 4) ≈ measurement(5, 0.06)
    @test hypot(3, y) ≈ measurement(5, 0.16)
end

@testset "Square root" begin
    @test sqrt(y) ≈ measurement(2, 0.05)
    for a in (w, x, y)
        @test sqrt(abs(a)) ≈ abs(a)^0.5
        @test sqrt(abs(a))*sqrt(abs(a)) ≈ abs(a)
        # Derivative of sqrt diverges in 0, but if the measurement is exact (like "a-a" is)
        # also the resulting quantity must have 0 uncertainty.
        @test sqrt(a - a) ≈ zero(a)
    end
end

@testset "Cube root" begin
    @test cbrt(x) ≈ measurement(1.4422495703074083, 0.01602499522563787)
    for a in (x, y)
        @test cbrt(a) ≈ a^(1/3)
        @test cbrt(a)*cbrt(a)^2 ≈ a
    end
end

@testset "Absolute value" begin
    @test abs(-x) ≈ x
    @test abs(measurement(0, 2)) ≈ measurement(0, 2)
    for a in (w, x, y); @test abs2(a) ≈ a*a; end
end

@testset "Sign" begin
    @test sign(x) ≈ measurement(1)
    @test sign(-y) ≈ measurement(-1)
    @test sign(measurement(0, 5)) ≈ measurement(0)
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
end

@testset "One and zero" begin
    @test one(y) ≈ measurement(1)
    @test zero(x) ≈ measurement(0)
end

@testset "Error function" begin
    @test erf(x) ≈ measurement(0.9999779095030014, 1.3925305194674787e-5)
    @test erfinv(erf(w)) ≈ w
    @test erfc(w) ≈ 1 - erf(w)
    @test erfi(x) ≈ 1629.9946226015657 ± 914.3351093102547
    for a in (w, x, y)
        @test erfcinv(erfc(a)) ≈ a
        @test erfcx(a) ≈ exp(a^2)*erfc(a)
        @test dawson(a) ≈ 0.5*exp(-a^2)*erfi(a)*sqrt(pi)
    end
end

@testset "Factorial and gamma" begin
    @test factorial(x) ≈ measurement(6, 0.7536706010590813)
    @test digamma(y) ≈ 1.256117668431802 ± 0.056764591147422994
    @test polygamma(3, w) ≈ 193.40909103400242 ± 0.10422749480000776
    for a in (w, x, y)
        @test gamma(a) ≈ factorial(a - 1)
        @test gamma(a + 1) ≈ factorial(a)
        @test lgamma(abs(a)) ≈ log(gamma(abs(a)))
        @test digamma(a) ≈ polygamma(0, a)
        @test digamma(invdigamma(a)) ≈ a
        @test trigamma(a) ≈ polygamma(1, a)
    end
end

@testset "Beta" begin
    for a in (w, x, y)
        @test beta(a, x) ≈ gamma(a)*gamma(x)/gamma(a + x)
        @test beta(a, pi) ≈ gamma(a)*gamma(pi)/gamma(a + pi)
        @test beta(e, a) ≈ gamma(e)*gamma(a)/gamma(e + a)
        @test lbeta(abs(a), x) ≈ log(beta(abs(a), x))
        @test lbeta(abs(a), pi) ≈ log(beta(abs(a), pi))
        @test lbeta(e, abs(a)) ≈ log(beta(e, abs(a)))
    end
end

@testset "Airy" begin
    @test airyai(x) ≈ 0.006591139357460721 ± 0.0011912976705951322
    @test airyaiprime(x) ≈ -0.01191297670595132 ± 0.0019773418072382165
    @test airybi(x) ≈ 14.037328963730136 ± 2.2922214966382017
    @test airybiprime(x) ≈ 22.922214966382015 ± 4.211198689119041
end

@testset "Bessel" begin
    for a in (x, y); @test 2*besselj1(a)/a ≈ besselj0(a) + besselj(2, a); end
    for a in (x, y); @test besselj(-1/2, a) ≈ sqrt(2/(pi*a))*cos(a); end
    for a in (x, y); @test besselj(1/2, a) ≈ sqrt(2/(pi*a))*sin(a); end
    @test bessely0(x) ≈ 0.3768500100127904 ± 0.03246744247917999
    for a in (x, y); @test bessely1(a) ≈ -bessely(-1, a); end
    for a in (x, y); @test bessely(5/2, a) ≈
        (besselj(5/2, a)*cos(2.5pi) - besselj(-5/2, a))/sin(2.5pi); end
    for a in (x, y), k in (1, 2), nu in -1:1
        sgn = k == 1 ? +1 : -1
        @test besselh(nu, k, a) ≈
            besselj(nu, a) + sgn*im*bessely(nu, a)
    end
    @test besseli(5//2, y) ≈ 4.757626874823528 ± 1.0398232869843944
    for a in (x, y); @test besselix(3, a) ≈ besseli(3, a)*exp(-abs(a)); end
    @test besselk(7//3, x) ≈ 0.07521953258226349 ± 0.010340691203742959
    for a in (x, y); @test besselkx(3//4, a) ≈ besselk(3//4, a)*exp(a); end
end

@testset "Modulo" begin
    frac, int = modf(x + w)
    @test frac ≈ x + w - int
    @test int ≈ floor((x + w).val)
    for a in (x, y) # Test property of "mod" function
        b = 10.0*w
        @test mod(a, b) ≈ a - fld(a, b)*b
    end
    @test mod(y, -3) ≈ y + fld(y, -3)*3
    @test mod(-5.8, x) ≈ 0.2 ± 0.2
    for a in (x, y) # Test property of "rem" function
        b = 10.0*w
        @test rem(a, b) ≈ a - div(a, b)*b
    end
    @test rem(y, -3) ≈ y + div(y, -3)*3
    @test rem(-5.8, x) ≈ -2.8 ± 0.1
    @test mod2pi(pi*x) ≈ measurement(pi, 0.1*pi)
end

@testset "Machine precisionx" begin
    @test eps(Measurement{Float64}) ≈ eps(Float64)
    @test eps(x) ≈ eps(x.val)
    @test nextfloat(x) ≈ nextfloat(x.val)
    @test nextfloat(x, 3) ≈ nextfloat(x.val, 3)
    @test maxintfloat(Measurement{Float64}) ≈ maxintfloat(Float64)
end

@testset "Rounding" begin
    @test round(w) ≈ measurement(round(w.val), round(w.err))
    @test round(w, 1) ≈ measurement(round(w.val, 1), round(w.err, 1))
    @test round(Int, w) ≈ round(Int, w.val)
    @test floor(w) ≈ measurement(floor(w.val))
    @test floor(Int, w) ≈ floor(Int, w.val)
    @test ceil(w) ≈ measurement(ceil(w.val))
    @test ceil(Int, w) ≈ ceil(Int, w.val)
    @test trunc(w) ≈ measurement(trunc(w.val))
    @test trunc(Int, w) ≈ trunc(Int, w.val)
end

@testset "widening" begin
    @test widen(Measurement{Float32}) == Measurement{Float64}
    @test widemul(x, y) ≈ big(x)*big(y)
end

@testset "Type representation" begin
    @test reprmime("text/plain", [w, 10x, 100y]) ==
        "3-element Array{Measurements.Measurement{Float64},1}:\n  -0.5±0.03\n  30.0±1.0 \n 400.0±20.0"
    @test reprmime("text/plain", complex(x, w)) == "(3.0 ± 0.1) - (0.5 ± 0.03)im"
    @test reprmime("text/plain", complex(w, y)) == "(-0.5 ± 0.03) + (4.0 ± 0.2)im"
    @test reprmime("text/x-tex", y) == reprmime("text/x-latex", y) == "4.0 \\pm 0.2"
    @test Base.alignment(DevNull, x) == (5,4)
end

@testset "sum" begin
    @test sum((x, w, x, y, -w)) ≈ 2x + y
    @test sum([x, w, x, y, -w]) ≈ 2x + y
end

@testset "prod" begin
    @test prod((w, x, y, -w)) ≈ -w^2 * x * y
    @test prod([w, x, y, -w]) ≈ -w^2 * x * y
    @test prod((w, x, y, -w, 0)) ≈ 0 ± 0
    @test prod([w, x, y, -w, 0]) ≈ 0 ± 0
end

@testset "Miscellanea" begin
    @test mean((x, w, x, y, -w)) ≈ (2x + y)/5
    @test mean([x, w, x, y, -w]) ≈ (2x + y)/5
    @test min(w, x, y) === w
    @test max(w, x, y) === y
    @test extrema([w, x, y]) == (w, y)
    @test sort([y, w, x]) == [w, x, y]
end

@testset "Linear algebra" begin
    A = [(14 ± 0.1) (23 ± 0.2); (-12 ± 0.3) (24 ± 0.4)]
    c = [(7 ± 0.5), (-13 ± 0.6)]
    b = A \ c
    @test A * b ≈ c
    @test b ⋅ c ≈ 7.423202614379084 ± 0.5981875954418516
    @test det(A) ≈ 612 ± 9.51262319236918
    @test A * inv(A) ≈ eye(A)
end

@testset "NaNs" begin
    # NaN as nominal value
    @test isequal(2*(NaN ± 3), NaN ± 6)
    # NaN as uncertainty
    @test isequal(Measurements.value(2*(3 ± NaN)), 6) &&
        isequal(Measurements.uncertainty(2*(3 ± NaN)), NaN)
    # Both
    @test isequal(Measurements.value(2*(NaN ± NaN)), NaN) &&
        isequal(Measurements.uncertainty(2*(NaN ± NaN)), NaN)
end

@testset "@uncertain" begin
    @test @uncertain(tan(x)) ≈ tan(x)
    @test @uncertain((a -> a + a + a)(x)) ≈ 3x
    @test @uncertain(zeta(x)) ≈ measurement(1.2020569031595951, 0.019812624290876782)
    for f in (log, hypot, atan2); @test @uncertain(f(x, y)) ≈ f(x, y); end
    @test @uncertain(((a,b,c,d,e,f) -> a+b+c+d+e+f)(x, 2x, y, log(y), -w, w^2)) ≈
        3x + y + log(y) - w + w^2
    # Test with a "ccall"
    f(x) = x*x
    ptr = cfunction(f, Cdouble, (Cdouble,))
    g(x) = ccall(ptr, Cdouble, (Cdouble,), x)*x
    @test @uncertain(g(x)) ≈ x^3
end

@testset "value and uncertainty" begin
    @test Measurements.value.([w, x, y]) == [-0.5, 3.0, 4.0]
    @test Measurements.value.([complex(w, x)]) == [complex(-0.5, 3.0)]
    @test Measurements.uncertainty.([w, x, y]) == [0.03, 0.1, 0.2]
    @test Measurements.uncertainty.([complex(w, x)]) == [complex(0.03, 0.1)]
end

@testset "Derivatives type" begin
    @test_throws KeyError getindex(x.der, 0)
    @test length((w + w + 2x + y).der) == 3
end

@testset "BigFloat's" begin
    a = big"3.00000001" ± big"1e-17"
    b = big"4.00000001" ± big"1e-17"
    c = big"5.00000001" ± big"1e-15"
    for X in (a, b, c); @test sin(X*X + X*X)/cos(X*X + X*X) ≈ tan(2X^2); end
    @test a*b ≈
        big"12.0000000700000001" ±
        big"5.000000014000000000399999998880000003119999991353600023834879934652928178154734e-17"
    @test a/x + w/b ≈
        big"8.750000036458332770409319189914605364095140370607375793457032012939451217651416e-01" ±
        big"3.416666677095189699499391052146002403356891669706809079678073000173723744722607e-02"
end

@testset "QuadGK" begin
    @test QuadGK.quadgk(cos, x, y)[1] ≈ sin(y) - sin(x)
    @test QuadGK.quadgk(sin, -y, y)[1] ≈ cos(-y) - cos(y) atol = eps(Float64)
    @test QuadGK.quadgk(exp, 0.4, x)[1] ≈ exp(x) - exp(0.4)
    @test QuadGK.quadgk(sin, w, 2.7)[1] ≈ cos(w) - cos(2.7)
    @test QuadGK.quadgk(t -> cos(x - t), 0, 2pi)[1] ≈ measurement(0) atol = 7e-16
    @test QuadGK.quadgk(t -> exp(t / w), 0, 1)[1] ≈ w * (exp(1 / w) - 1)
    for a in (w, x, y)
        @test 2a / sqrt(pi) * QuadGK.quadgk(t -> exp(-abs2(t * a)), 0, 1)[1] ≈
            erf(a)
    end
    @test QuadGK.quadgk(t -> cos(t - w), -w, w)[1] ≈ sin(2w)
    @test QuadGK.quadgk(t -> exp(t / x), w, y)[1] ≈ x * (exp(y / x) - exp(w / x))
    @test QuadGK.quadgk(t -> sin(t - w), 0, y)[1] ≈ cos(w) - cos(y - w)
    @test QuadGK.quadgk(t -> log(y - t), w, -pi)[1] ≈
        (y - w)*log(y - w) - (y + pi)*log(y + pi) + w + pi
    # Compare some of the above integrals with results with "@uncertain" macro.
    @test QuadGK.quadgk(cos, x, y)[1] ≈
        @uncertain(((x,y) -> QuadGK.quadgk(cos, x, y)[1])(x, y))
    @test QuadGK.quadgk(sin, -y, y)[1] ≈
        @uncertain((x -> QuadGK.quadgk(sin, -x, x)[1])(y)) atol = 1e-10
    @test QuadGK.quadgk(exp, 0.4, x)[1] ≈
        @uncertain((x -> QuadGK.quadgk(exp, 0.4, x)[1])(x))
end

@testset "String parsing" begin
    @test measurement("  -123.4(56)  ") ≈         -123.4 ± 5.6
    @test measurement("  +1234(56)e-1  ") ≈        123.4 ± 5.6
    @test measurement(" ( +1.234 ± 0.056 )e2 ") ≈  123.4 ± 5.6
    @test measurement(" -12.34e1  +-  0.56e1 ") ≈ -123.4 ± 5.6
    @test measurement(" 1234e-1  +/-  5.6e0 ") ≈   123.4 ± 5.6
    @test measurement("  -1234e-1  ") ≈ measurement(-1234e-1)
    @test_throws ErrorException measurement("abc")
    @test_throws ErrorException measurement("(2±1")
    @test_throws ErrorException measurement("2±1)e2")
    @test_throws ErrorException measurement("(2)")
    @test_throws ErrorException measurement("(2)e-2")
end

@testset "Fixed bugs" begin
    @test 1 * (big(3) ± 0) ≈ 3 ± 0
end

@testset "Complex measurements" begin
    include("complex.jl")
end
