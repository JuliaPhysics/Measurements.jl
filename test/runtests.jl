using Measurements, SpecialFunctions, QuadGK, Calculus, BaseType, Makie
using Test, LinearAlgebra, Statistics, Unitful, Printf, Aqua

Aqua.test_all(Measurements)

import Base: isapprox
import Measurements: value, uncertainty

# A few tests before overloading `isapprox`.
@testset "isapprox" begin
    @test (5 ± 1) ≈ (5 ± 2)
    @test (nextfloat(5.0) ± 1) ≈ 5 ± 1
    @test 5.1 ± 1 ≉ 5 ± 1
end

isapprox(x::Measurement, y::Measurement; rest...) =
    isapprox(x.val, y.val; nans = true, rest...) &&
    isapprox(x.err, y.err; nans = true, rest...)
isapprox(x::Complex{Measurement{<:AbstractFloat}},
         y::Complex{Measurement{<:AbstractFloat}}; rest...) =
             isapprox(real(x), real(y); nans = true, rest...) &&
             isapprox(imag(x), imag(y); nans = true, rest...)
# This is bit strict, but the idea is that in the tests we want `Measurement`s to be
# comparable only to other `Measurement`s.  For example, a `Measurement` would be always
# different from a `Float64`, because we'd have lost the uncertainty component.
isapprox(x::Measurement, y::Real; rest...) = false
isapprox(x::Real, y::Measurement; rest...) = false

w = -0.5 ± 0.03
x = 3 ± 0.1
y = 4 ± 0.2
z = complex(x)

@testset "Standard Score" begin
    @test @inferred(stdscore(w, x.val)) ≈ -350/3
    @test @inferred(stdscore(x, y)) ≈ -4.472135954999579
    @test @inferred(stdscore(w, y)) ≈ @inferred(stdscore(w - y, 0))
    @test @inferred(stdscore(y, 4.1)) ≈ @inferred(stdscore(y, 4.1 ± 0))
end

@testset "measurement" begin
    @test measurement(x) === x
    @test measurement.(1:2:5, 2:2:6) == [1±2, 3±4, 5±6]
    @test iszero(@inferred(measurement(1)).err)
    @test @inferred(measurement(pi)).tag === UInt64(0)
    @test length(@inferred(measurement(4//5)).der) == 0
    @test @inferred(measurement(ℯ, big(0))).tag === UInt64(0)
    @test length(@inferred(measurement(7//3, 0)).der) == 0
    @test length(@inferred(measurement(4.7f0, 0.3)).der) == 1
    @test typeof(@inferred(measurement(1, big(0)))) == Measurement{BigFloat}
    @test typeof(@inferred(Measurement{Float64}(big"3.14"))) == Measurement{Float64}
    @test typeof(@inferred(Measurement{BigFloat}(-5.43f2))) == Measurement{BigFloat}
    @test x != pi != y
end

@testset "constructors" begin
    @test Measurement{Float64}(1.0 + 0im) ≈ 1.0 ± 0.0
    @test Measurement{Float64}(1//2) ≈ 0.5 ± 0.0
    @test Measurement{Float64}((1:1e-2:2).step) ≈ 1e-2±0.0
    @test Measurement{Float64}('a') ≈ Float64('a') ± 0.0
    @test_throws ArgumentError Measurement{Float64}("aaa")
end

@testset "missing values" begin
    @test measurement(missing) === missing
    @test measurement(missing, .1) === missing
    @test measurement(missing, missing) === missing
    @test_throws MethodError measurement(1, missing)

    @test promote_type(Measurement{Float64}, Missing) == Union{Measurement{Float64},Missing}
    @test [w, x, missing, y] isa Vector{Union{Measurement{Float64},Missing}}

    for op in (+, -, *, /, ^)
        @test op(w, missing) === op(missing, w) === missing
    end

    @test Measurements.value(missing) === missing
    @test Measurements.uncertainty(missing) === missing
end

@testset "Weighted Average" begin
    @test @inferred(weightedmean((w, x, y))) ≈ measurement(-0.12584269662921355, 0.028442727788398632)
    @test_throws ArgumentError weightedmean(())
    @test_throws ArgumentError weightedmean((1, 2, 3))

     m  =  [w x y 
            w y x]
    @test @inferred(weightedmean(m, dims=1)) ≈ [weightedmean(m[:,1]) weightedmean(m[:,2]) weightedmean(m[:,2])]
    @test @inferred(weightedmean(m, dims=2)) ≈ [weightedmean(m[1,:]);weightedmean(m[2,:])]
end

@testset "Derivative" begin
    c = 1 ± 0
    @test @inferred(Measurements.derivative(3*x^2, (x.val, x.err, x.tag))) ≈ 18
    @test @inferred(Measurements.derivative(3*x^2, x)) ≈ 18
    @test Measurements.derivative.(2x + y - w, [x, y, w]) ≈ [2, 1, -1]
    @test Measurements.derivative.(x - x + y - y + w - w + c, [x, y, w, c]) ≈ [0, 0, 0, 0]
    @test length((x - x + y - y + w - w + c).der) == 0
end

@testset "Covariance matrix" begin
    x = measurement(1.0, 0.1)
    y = -2x + 10
    z = -3x
    @test @inferred(Measurements.cov([x, y, z])) ≈ [0.01 -0.02 -0.03; -0.02 0.04 0.06; -0.03 0.06 0.09]
    @test [@inferred(Measurements.cov(x,x)), @inferred(Measurements.cov(y,y)), @inferred(Measurements.cov(z,z))] ≈ diag(Measurements.cov([x, y, z])) ≈ [0.01, 0.04, 0.09]
    @test [@inferred(Measurements.cov(x,y)), @inferred(Measurements.cov(y,z)), @inferred(Measurements.cov(x,z))] ≈ [-0.02, 0.06, -0.03]

    u = measurement(1, 0.05)
    v = measurement(10, 0.1)
    w = u + 2v
    @test @inferred(Measurements.cov([u, v, w])) ≈ [0.0025 0.0 0.0025; 0.0 0.01 0.02; 0.0025 0.02 0.0425]
    @test [@inferred(Measurements.cov(u,u)), @inferred(Measurements.cov(v,v)), @inferred(Measurements.cov(w,w))] ≈ diag(Measurements.cov([u, v, w])) ≈ [0.0025, 0.01, 0.0425]
    @test [@inferred(Measurements.cov(u,v)), @inferred(Measurements.cov(v,w)), @inferred(Measurements.cov(u,w))] ≈ [0.0, 0.02, 0.0025]
end

@testset "Correlation matrix" begin
    x = measurement(1.0, 0.1)
    y = -2x + 10
    z = -3x
    @test @inferred(Measurements.cor([x, y, z])) ≈ [1.0 -1.0 -1.0; -1.0 1.0 1.0; -1.0 1.0 1.0]
    @test @inferred(Measurements.cor(x,x)) ≈ @inferred(Measurements.cor(y,y)) ≈ @inferred(Measurements.cor(z,z)) ≈ 1.0
    @test [@inferred(Measurements.cor(x,x)), @inferred(Measurements.cor(y,y)), @inferred(Measurements.cor(z,z))] ≈ diag(Measurements.cor([x, y, z]))
    @test [@inferred(Measurements.cor(x,y)), @inferred(Measurements.cor(y,z)), @inferred(Measurements.cor(x,z))] ≈ [-1.0, 1.0, -1.0]

    u = measurement(1, 0.05)
    v = measurement(10, 0.1)
    w = u + 2v
    @test @inferred(Measurements.cor([u, v, w])) ≈ [1.0 0.0 0.24253562503633297; 0.0 1.0 0.9701425001453319; 0.24253562503633297 0.9701425001453319 1.0] atol=1e-15
    @test @inferred(Measurements.cor(u,u)) ≈ @inferred(Measurements.cor(v,v)) ≈ @inferred(Measurements.cor(w,w)) ≈ 1.0
    @test [@inferred(Measurements.cor(u,u)), @inferred(Measurements.cor(v,v)), @inferred(Measurements.cor(w,w))] ≈ diag(Measurements.cor([u, v, w]))
    @test [@inferred(Measurements.cor(u,v)), @inferred(Measurements.cor(v,w)), @inferred(Measurements.cor(u,w))] ≈ [0.0, 0.9701425001453319, 0.24253562503633297]
end

@testset "Correlated values" begin
    @testset "Simple" begin
        u_in = measurement(1, 0.1)
        cov_matrix = @inferred Measurements.cov([u_in])

        u_out, = @inferred Measurements.correlated_values([1], cov_matrix)
        @test 2u_in ≈ 2u_out
    end

    @testset "Covariances" begin
        x_in = measurement(1, 0.1)
        y_in = measurement(2, 0.3)
        z_in = -3x_in + y_in

        xyz_in = [x_in, y_in, z_in]

        cov_matrix = Measurements.cov([x_in, y_in, z_in])

        @test Measurements.uncertainty.([x_in, y_in, z_in]) .^ 2 ≈ diag(cov_matrix)

        x_out, y_out, z_out = xyz_out = Measurements.correlated_values(Measurements.value.([x_in, y_in, z_in]), cov_matrix)

        @test xyz_out ≈ xyz_in
        @test z_out ≈ -3x_out + y_out
        @test 0 ± 0 ≈ -3x_out + y_out - z_out atol=1e-15
    end

    @testset "Functional relations" begin
        u_in = measurement(1, 0.05)
        v_in = measurement(10, 0.1)
        w_in = u_in + 2v_in

        cov_matrix = Measurements.cov([u_in, v_in, w_in])

        (u_out, v_out, w_out) = Measurements.correlated_values(Measurements.value.([u_in, v_in, w_in]), cov_matrix)

        @test u_in ≈ u_out
        @test v_in ≈ v_out
        @test w_in ≈ w_out
        @test w_out ≈ u_out + 2v_out
        @test 0 ± 0 ≈ u_out + 2v_out - w_out atol=2e-8

        corr_matrix = Measurements.cor([u_out, v_out, w_out])
        @test corr_matrix[1,1] ≈ 1
        @test corr_matrix[2,3] ≈ 2Measurements.uncertainty(v_out)/Measurements.uncertainty(w_out)
    end

    @testset "Numerical robustnes" begin
        cov_matrix = [1e-70 0.9e-70 -3e-34; 0.9e-70 1e-70 -3e-34; -3e-34 -3e-34 1e10]
        variables = Measurements.correlated_values([0, 0, 0], cov_matrix)

        @test cov_matrix[1,1] ≈ Measurements.uncertainty(variables[1])^2
        @test cov_matrix[2,2] ≈ Measurements.uncertainty(variables[2])^2
        @test cov_matrix[3,3] ≈ Measurements.uncertainty(variables[3])^2
    end

    @testset "0 variance" begin
        x_in = measurement(1, 0)
        y_in = measurement(2, 0)
        z_in = measurement(3, 5)
        cov_matrix = Measurements.cov([x_in, y_in, z_in])
        nom_values = Measurements.value.([x_in, y_in, z_in])
        variables = Measurements.correlated_values(nom_values, cov_matrix)

        for (variable, nom_value, variance) in zip(
            variables, nom_values, diag(cov_matrix))

            @test Measurements.value(variable) ≈ nom_value
            @test Measurements.uncertainty(variable)^2 ≈ variance
        end

        @test cov_matrix ≈ Measurements.cov(variables)
        @test [x_in, y_in, z_in] ≈ variables
    end
end

@testset "Contributions to uncertainty" begin
    @test sort(collect(values(@inferred(Measurements.uncertainty_components(w * x * y))))) ≈
        [0.2, 0.3, 0.36]
end

@testset "Conversion and Promotion" begin
    @test convert(Measurement{Float64}, pi) == pi ± 0
    @test convert(Measurement{Float64}, 1//2) == 0.5 ± 0
    @test convert(Measurement{Float64}, 3) == 3.0 ± 0.0
    @test convert(Measurement{Float64}, 3 ± 1) == 3.0 ± 1.0
    for a in (w, x, y)
        @test convert(typeof(a), a) === a
        @test convert(Measurement, a) === a
        @test float(a) === a
    end
    @test convert(Measurement, pi) == pi ± 0
    @test convert(Measurement, 1//2) == 0.5 ± 0
    @test convert(Measurement, 3) == 3 ± 0
    @test convert(Int, measurement(3, 0)) === 3
    @test_throws AssertionError convert(Int, measurement(3, 1))
    @test float(3 ± 1) == 3.0 ± 1.0
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

    @test convert(Measurement{Float64}, 1+0im) ≈ 1.0±0.0
    @test_throws InexactError convert(Measurement{Float64}, 1+1im)
    @test convert(Measurement{Float64}, Base.TwicePrecision(1.0, 0.0)) ≈ 1.0±0.0
    @test convert(Measurement{Float64}, 'a') ≈ Float64('a') ± 0.0
end

@testset "Comparisons and Tests" begin
    # isapprox is overloaded only for tests.  Make sure it works as expected.
    @test 5 ± 1 ≉ 5 ± 2
    @test (nextfloat(5.0) ± nextfloat(1.0)) ≈ 5 ± 1
    @test 5.1 ± 1 ≉ 5 ± 1
    @test z == x ≠ y
    @test x == x
    @test -2 < w <= x < y < 5
    @test big(1) < big(x) < big(4) <= big(y) <= big(5)
    @test -5//3 < w <= -1//2 <= x < 11//3 < y <= 24//6
    @test 3 == 3 ± 0 ≠ x == 3 ± 0.1
    @test 4 ± 0.2 == y ≠ 4 == 4 ± 0
    @test measurement(big"0.75", 0.01) == 3//4 ± 1//100
    @test measurement(big(π)) ≠ π
    @test ℯ ≠ measurement(Float32(ℯ))
    @test 3//4 == measurement(Float32(0.75), Float32(0)) ≠ 4//3
    @test isnan(x) == false
    @test isfinite(y) == true && isfinite(measurement(Inf)) == false
    @test isinf(measurement(Inf)) == true && isinf(x) == false
    @test isinteger(-3 ± 0)
    @test !isinteger(3 ± 1)
    @test !isinteger(pi ± 0)
    @test iszero(0 ± 0)
    @test iszero(zero(Measurement))
    @test !iszero(0 ± 1)
    @test !iszero(1 ± 0)
    @test isone(1 ± 0)
    @test isone(one(Measurement))
    @test !isone(1 ± 1)
    @test !isone(0 ± 0)
    @test 1//2 ± 0.0 == 1//2
    @test 1//2 == 1//2 ± 0.0
    # Make sure `iszero` is consistent with `==(0)`.  These are two different
    # methods, but if implemented inconsistently we'd run into troubles.
    @test iszero(0 ± 0) == (0 ± 0 == 0)
    @test iszero(0 ± 0.5) == (0 ± 0.5 == 0) == (0 == 0 ± 0.5) ==
        (0 ± 0.5 == 0//1) == (0//1 == 0 ± 0.5)
end

@testset "Hashing and dictionaries" begin
    @testset "a = $a" for a in (x, y, w, z)
        @test hash(a) == hash(a)
        @test hash(2 * a) == hash(a + a)
        @test hash(a - a) == hash(zero(a))
        @test hash(a / a) == hash(oneunit(a))
        d = Dict(a => 42)
        @test d[a] == 42
        # `hash` must be consistent with `==`.  Skip following tests for
        # Complex{Measurement}.
        if !(a isa Complex)
            other = value(a) ± uncertainty(a)
            @test hash(a) == hash(other)
            @test d[other] == 42
            d[other] = 14
            @test d[a] == 14
        end
    end
end

##### Mathematical Operations
@testset "Addition" begin
    @test @inferred(x + y) ≈ measurement(7, 0.22360679774997896)
    @test @inferred(2 + x) ≈ measurement(5, 0.1)
    @test @inferred(x + 5//2) ≈ measurement(5.5, 0.1)
    @test @inferred(x + true) ≈ measurement(4, 0.1)
    @test @inferred(x + 2) ≈ measurement(5, 0.1)
    @test @inferred(x + big(1)) == (x.val + big(1)) ± big(x.err)
    for a in (w, x, y)
        @test @inferred(+a) === a
        @test @inferred(a + zero(a)) ≈ a ≈ @inferred(measurement(0) + a) # Neutral element
        @test @inferred(a + a + a) ≈ 3a # Correlation
        for b in (w, x, y)
            @test @inferred(a + b) ≈ @inferred(b + a) # Commutativity
        end
    end
    # Test a weird operation just to be sure it doesn't throw an error.
    @test @inferred((x ± y) + (w ± x)) ≈ @inferred((x + w) ± hypot(y, x))
end

@testset "Subtraction" begin
    @test @inferred(-x) ≈ measurement(-3, 0.1)
    @test @inferred(x - y) ≈ measurement(-1, 0.22360679774997896)
    @test @inferred(2 - x) ≈ measurement(-1, 0.1)
    @test @inferred(x - 2) ≈ measurement(1, 0.1)
    # Test correlation
    for a in (w, x, y); @test @inferred(a - a) ≈ zero(a) ≈ measurement(0); end
end

@testset "Multiplication" begin
    @test @inferred(x * y) ≈ measurement(12, 0.7211102550927979)
    @test @inferred(2x) ≈ measurement(6, 0.2)
    @test @inferred(x * 3) ≈ measurement(9, 0.3)
    for a in (w, x, y)
        @test @inferred(a*(0 ± 1)) ≈ measurement(0, abs(a.val))
        @test @inferred(a * one(a)) ≈ a ≈ @inferred(measurement(1) * a) # Neutral element
        @test @inferred(a * a * a) ≈ a^3 # Correlation
        for b in (w, x, y)
            @test @inferred(a * b) ≈ @inferred(b * a) # Commutativity
        end
        @test @inferred(true * a) ≈ a
        @test @inferred(a * false) ≈ measurement(0)
        @test @inferred(a * 0) ≈ measurement(0)
    end
    for f in (muladd, fma)
        @test @inferred(f(w, x, y)) ≈ w*x + y
        @test @inferred(f(w, x, 1)) ≈ w*x + oneunit(y)
        @test @inferred(f(w, 2, y)) ≈ w*2 + y
        @test @inferred(f(w, 2, 1)) ≈ w*2 + oneunit(x)
        @test @inferred(f(3, x, y)) ≈ 3*x + y
        @test @inferred(f(3, x, 1)) ≈ 3*x + oneunit(w)
        @test @inferred(f(3, 2, y)) ≈ 3*2 + y
    end
end

@testset "Division" begin
    @test @inferred(x / y) ≈ measurement(0.75, 0.04506939094329987)
    @test @inferred(x / 10) ≈ measurement(0.3, 0.01)
    @test @inferred(1 / y) ≈ measurement(0.25, 0.0125)
    @test @inferred(div(1.2*x, w)) ≈ measurement(-7)
    @test @inferred(div(x, 1.2)) ≈ measurement(2)
    @test @inferred(div(9.4, y)) ≈ measurement(2)
    @test @inferred(fld(1.2*x, w)) ≈ measurement(-8)
    @test @inferred(fld(x, 1.2)) ≈ measurement(2)
    @test @inferred(fld(9.4, y)) ≈ measurement(2)
    @test @inferred(cld(1.2*x, w)) ≈ measurement(-7)
    @test @inferred(cld(x, 1.2)) ≈ measurement(3)
    @test @inferred(cld(9.4, y)) ≈ measurement(3)
    for a in (w, x, y)
        @test @inferred(0 / a) ≈ measurement(0)
        @test @inferred((0 ± 1) / a) ≈ measurement(0, 1/abs(a.val))
        # Test correlation
        @test @inferred(a / a) ≈ oneunit(a) ≈ measurement(1)
        # Test derivatives of "div", "fld", and "cld".  They're defined to be exactly 0.
        # Should you discover this is not correct, update the test accordingly.
        for f in (div, fld, cld), b in (w, x, y)
            @test Measurements.derivative.(f(a, b), [a, b]) == [0.0, 0.0]
        end
    end
end

@testset "Inverse" begin
    for a in (w, x, y); @test @inferred(inv(a)) ≈ 1/a; end
end

@testset "signbit" begin
    @test signbit(x) == false
    @test signbit(w) == true
end

@testset "Power" begin
    # Test numerical values
    @test @inferred(x^y) ≈ measurement(81, 20.818061515800505)
    @test @inferred(x^2) ≈ measurement(9, 0.6)
    @test @inferred(y^(1//2)) ≈ measurement(2, 0.05)
    @test @inferred(x^(pi)) ≈ measurement(31.54428070019754, 3.3033093503504967)
    @test @inferred(2^x) ≈ measurement(8, 0.5545177444479562)
    @test @inferred(pi^x) ≈ measurement(31.006276680299816, 3.5493811564854525)
    @test z ^ 2.5 ≈ @inferred(x ^ 2.5)
    @test z ^ 3 ≈ @inferred(x ^ 3)
    for a in (w, x, y)
        @test @inferred(x ^ a) ≈ @inferred(exp(a * log(x)))
        @test @inferred(abs(a) ^ w) ≈ @inferred(exp(w * log(abs(a))))
        @test @inferred(abs(a) ^ a) ≉ @inferred(exp(a * log(abs(a.val) ± a.err))) # correlation
        @test @inferred(a ^ (-1)) ≈ @inferred(inv(a))
        @test @inferred(a ^ 2) ≈ @inferred(a ^ 2.0)
        @test @inferred(a ^ (4//2)) ≈ @inferred(a * a) # correlation
        @test @inferred(2 ^ a) ≈ @inferred(2.0 ^ a)
        @test @inferred(ℯ ^ a) ≈ @inferred(exp(a))
        @test @inferred(exp2(a)) ≈ @inferred(2 ^ a)
    end
    # Make sure "p ± 0" behaves like "p", in particular with regard to the
    # uncertainty.
    for p in (-3, 0, 3); @test @inferred((0 ± 0.1)^(p ± 0)) ≈ (0 ± 0.1)^p; end
end

@testset "Deg and rad" begin
    @test @inferred(deg2rad(y)) ≈ 0.06981317007977318 ± 0.003490658503988659
    @test @inferred(rad2deg(x)) ≈ measurement(171.88733853924697, 5.729577951308232)
    for a in (w, x, y); @inferred(rad2deg(deg2rad(a))) ≈ a; end
end

@testset "Trig functions" begin
    @test @inferred(cos(x)) ≈ measurement(-0.9899924966004454, 0.014112000805986721)
    @test @inferred(cosd(x)) ≈ measurement(0.9986295347545738, 9.134347536190512e-5)
    @test @inferred(cosh(x)) ≈ measurement(10.067661995777765, 1.0017874927409902)
    @test @inferred(sin(y)) ≈ measurement(-0.7568024953079282, 0.13072872417272238)
    @test @inferred(sind(y)) ≈ measurement(0.0697564737441253, 0.0034821554353128255)
    @test @inferred(sinh(y)) ≈ measurement(27.28991719712775, 5.461646567203298)
    for a in (w, x, y)
        @test @inferred(cos(a) ^ 2 + sin(a) ^ 2) ≈ oneunit(a)
        @test @inferred(tan(a))  ≈ sin(a)  / cos(a)
        @test @inferred(tand(a)) ≈ sind(a) / cosd(a)
        @test @inferred(tanh(a)) ≈ sinh(a) / cosh(a)
        @test @inferred(sinpi(a))≈ sin(pi * a) atol = 1e-15
        @test @inferred(cospi(a))≈ cos(pi * a) atol = 1e-15
        @test @inferred(sinc(a)) ≈ (sin(pi * a) / (pi * a)) atol = eps(Float64)
        @test @inferred(cosc(a)) ≈ ((cos(pi * a) - sin(pi * a) / (pi * a)) / a) atol = 1e-15
        # Check we got the sign of derivatives in `sincos` right.
        s, c = @inferred(sincos(a))
        @test s ≈ sin(a)
        @test c ≈ cos(a)
        @test s + c ≈ sin(a) + cos(a)
        @test s - c ≈ sin(a) - cos(a)
        @test s ^ 2 + c ^ 2 ≈ oneunit(a)
        s, c = @inferred(sincospi(a))
        @test s ≈ sinpi(a)
        @test c ≈ cospi(a)
        @test s + c ≈ sinpi(a) + cospi(a)
        @test s - c ≈ sinpi(a) - cospi(a)
        @test s ^ 2 + c ^ 2 ≈ oneunit(a)
    end
    for c in (-1 ± 1, 0 ± 1, 1 ± 1)
        @test sinc(c) ≈ @uncertain(sinc(c)) rtol = 1e-7
        @test cosc(c) ≈ @uncertain(cosc(c)) rtol = 1e-7
        @test Measurements.value(sinc(c) ^ 2 + cosc(c) ^ 2) == 1
    end
end

@testset "Inverse trig functions" begin
    @test @inferred(acos(w)) ≈ measurement(2.0943951023931957, 0.034641016151377546)
    @test @inferred(acosd(w)) ≈ measurement(120, 1.9847840235184515)
    @test @inferred(acosh(x)) ≈ measurement(1.7627471740390859, 0.035355339059327376)
    @test @inferred(cos(acos(w))) ≈ w
    @test @inferred(cosd(acosd(w))) ≈ w
    @test @inferred(cosh(acosh(x))) ≈ x
    @test @inferred(asin(w)) ≈ measurement(-0.5235987755982989, 0.034641016151377546)
    @test @inferred(asind(w)) ≈ measurement(-30, 1.9847840235184515)
    @test @inferred(asinh(x)) ≈ measurement(1.8184464592320668, 0.0316227766016838)
    @test @inferred(sin(asin(w))) ≈ w
    @test @inferred(sind(asind(w))) ≈ w
    @test @inferred(sinh(asinh(x))) ≈ x
    @test @inferred(atan(w)) ≈ measurement(-0.4636476090008061, 0.024)
    @test @inferred(atand(w)) ≈ measurement(-26.56505117707799, 1.3750987083139758)
    @test @inferred(atanh(w)) ≈ measurement(-0.5493061443340548, 0.04)
    for a in (w, x, y); @test @inferred(tan(atan(a))) ≈ a; end
    for a in (w, x, y); @test @inferred(tand(atand(a))) ≈ a; end
    for a in (x, y)
        @test @inferred(sec(asec(a))) ≈ a
        @test @inferred(csc(acsc(a))) ≈ a
        @test @inferred(cot(acot(a))) ≈ a
        @test @inferred(coth(acoth(a))) ≈ a
    end
    @test @inferred(tanh(atanh(w))) ≈ w
    @test @inferred(sech(asech(-w))) ≈ -w
    @test @inferred(csch(acsch(w))) ≈ w
    @test @inferred(atan(x, y)) ≈ measurement(0.6435011087932844, 0.028844410203711916)
    @test @inferred(atan(x, 5)) ≈ measurement(0.5404195002705842, 0.014705882352941178)
    @test @inferred(atan(-3, y)) ≈ measurement(-0.6435011087932844, 0.024)
end

@testset "Reciprocal trig functions" begin
    @test @inferred(csc(y)) ≈ measurement(-1.3213487088109024, 0.228247438348944)
    @test @inferred(cscd(y)) ≈ measurement(14.335587026203676, 0.7156144742178738)
    @test @inferred(csch(y)) ≈ measurement(0.03664357032586561, 0.007333632734561779)
    @test @inferred(sec(w)) ≈ measurement(1.139493927324549, 0.018675251089778414)
    @test @inferred(secd(w)) ≈ measurement(1.000038078385737, 4.5695512845605615e-6)
    @test @inferred(sech(w)) ≈ measurement(0.886818883970074, 0.012294426649942352)
    @test @inferred(cot(x)) ≈ measurement(-7.015252551434534, 5.021376836040872)
    @test @inferred(cotd(x)) ≈ measurement(19.08113668772821, 0.6372018679183983)
    @test @inferred(coth(x)) ≈ measurement(1.0049698233136892, 0.000996434577114765)
    for a in (w, x, y)
        @test @inferred(csc(a)) ≈ 1/sin(a)
        @test @inferred(cscd(a)) ≈ 1/sin(deg2rad(a))
        @test @inferred(csch(a)) ≈ 1/sinh(a)
        @test @inferred(sec(a)) ≈  1/cos(a)
        @test @inferred(secd(a)) ≈ 1/cos(deg2rad(a))
        @test @inferred(sech(a)) ≈ 1/cosh(a)
        @test @inferred(cot(a)) ≈ 1/tan(a)
        @test @inferred(cotd(a)) ≈ 1/tan(deg2rad(a))
        @test @inferred(coth(a)) ≈ 1/tanh(a)
    end
end

@testset "Exponentials" begin
    @test @inferred(exp(x)) ≈ measurement(20.085536923187668, 2.008553692318767)
    for a in (w, 3//5*w, x/10, x, y/50, y)
        @test @inferred(expm1(a)) ≈ exp(a) - oneunit(a)
        @test @inferred(exp10(a)) ≈ 10^a
        @test @inferred(ldexp(frexp(a)...)) ≈ a
        @test @inferred(log2(exp2(a))) ≈ a
        @test @inferred(log10(exp10(a))) ≈ a
        @test @inferred(log1p(expm1(a))) ≈ a
    end
end

@testset "Logarithm" begin
    @test @inferred(log(x, y)) ≈ measurement(1.261859507142915, 0.059474298734200806)
    @test @inferred(log(y)) ≈ measurement(1.3862943611198906, 0.05)
    @test @inferred(log(y, 4)) ≈ measurement(1, 0.03606737602222409)
    @test @inferred(log(pi, x)) ≈ measurement(0.9597131185693899, 0.029118950894341064)
    @test @inferred(log(big(3), x)) == big(1) ± (x.err / (log(big(3)) * x.val))
    for a in (abs(w), x, y)
        @test @inferred(log(ℯ, a)) ≈ log(a)
        @test @inferred(log(2, a)) ≈ log2(a)
        @test @inferred(log(10, a)) ≈ log10(a)
        @test @inferred(log1p(a)) ≈ log(1 + a)
        @test @inferred(log(exp(-a))) ≈ -a
        @test @inferred(exp(log(a))) ≈ a
    end
end

@testset "Hypotenuse" begin
    for a in (w, x, y)
        @test @inferred(hypot(a, 3)) ≈ @inferred(sqrt(abs2(a) + 9))
        @test @inferred(hypot(4, a)) ≈ @inferred(sqrt(16 + a * a))
        for b in (w, x, y)
            @test @inferred(hypot(a, b)) ≈ @inferred(sqrt(abs2(a) + b * b)) ≈
                @inferred(hypot(b, a)) # Commutativity
        end
    end
end

@testset "Square root" begin
    @test @inferred(sqrt(y)) ≈ measurement(2, 0.05)
    for a in (abs(w), x, y)
        @test @inferred(sqrt(a)) ≈ a ^ 0.5
        @test @inferred(sqrt(a) * sqrt(a)) ≈ a
        # Derivative of sqrt diverges in 0, but if the measurement is exact (like "a-a" is)
        # also the resulting quantity must have 0 uncertainty.
        @test @inferred(sqrt(a - a)) ≈ zero(a)
    end
end

@testset "Cube root" begin
    @test @inferred(cbrt(x)) ≈ measurement(1.4422495703074083, 0.01602499522563787)
    for a in (x, y)
        @test @inferred(cbrt(a)) ≈ a^(1/3)
        @test @inferred(cbrt(a)*cbrt(a)^2) ≈ a
    end
end

@testset "Absolute value" begin
    @test @inferred(abs(-x)) ≈ x
    @test @inferred(abs(measurement(0, 2))) ≈ measurement(0, 2)
    for a in (w, x, y); @test @inferred(abs2(a)) ≈ a*a; end
end

@testset "Sign" begin
    @test @inferred(sign(x)) ≈ measurement(1)
    @test @inferred(sign(-y)) ≈ measurement(-1)
    @test @inferred(sign(measurement(0, 5))) ≈ measurement(0)
    @test @inferred(copysign(x, -5)) == -x
    @test @inferred(copysign(x, w)) == -x
    @test @inferred(copysign(5, w)) == -5
    @test @inferred(copysign(1//2, w)) == -1//2
    @test @inferred(copysign(w, w)) == w
    @test @inferred(copysign(Float32(5), w)) === -Float32(5)
    @test @inferred(copysign(Float64(5), w)) === -Float64(5)
    @test copysign(pi, w) == -pi # This isn't inferrable in Julia
    @test @inferred(flipsign(x, -5)) == -x
    @test @inferred(flipsign(w, w)) == -w
    @test @inferred(flipsign(-5, w)) == 5
    @test @inferred(flipsign(Float32(-5), w)) === Float32(5)
    @test @inferred(flipsign(Float64(-5), w)) === Float64(5)
    @test flipsign(pi, w) == -pi # This isn't inferrable in Julia
end

@testset "One and zero" begin
    @test @inferred(one(y)) === 1.0
    @test @inferred(oneunit(y)) ≈ measurement(1)
    @test @inferred(zero(x)) ≈ measurement(0)
end

@testset "Error function" begin
    @test @inferred(erf(x)) ≈ measurement(0.9999779095030014, 1.3925305194674787e-5)
    @test @inferred(erfinv(erf(w))) ≈ w
    @test @inferred(erfc(w)) ≈ 1 - erf(w)
    @test @inferred(erfi(x)) ≈ 1629.9946226015657 ± 914.3351093102547
    for a in (w, x, y)
        @test @inferred(erfcinv(erfc(a))) ≈ a
        @test @inferred(erfcx(a)) ≈ exp(a^2)*erfc(a)
        @test @inferred(dawson(a)) ≈ 0.5*exp(-a^2)*erfi(a)*sqrt(pi)
    end
end

@testset "Cis" begin
    for a in (w, x, y); @test @inferred(cis(a) - exp(im * a)) ≈ 0; end
end

@testset "Factorial and gamma" begin
    @test_logs (:warn, r"factorial.*is deprecated") @test @inferred(factorial(x)) ≈ measurement(6, 0.7536706010590813)
    @test @inferred(digamma(y)) ≈ 1.256117668431802 ± 0.056764591147422994
    @test @inferred(polygamma(3, w)) ≈ 193.40909103400242 ± 0.10422749480000776
    for a in (w, x, y)
        @test_logs (:warn, r"factorial.*is deprecated") @test @inferred(gamma(a)) ≈ factorial(a - oneunit(a))
        @test @inferred(gamma(a + oneunit(a))) ≈ @test_logs (:warn, r"factorial.*is deprecated") factorial(a)
        @test @inferred(logabsgamma(abs(a)))[1] ≈ log(gamma(abs(a)))
        @test @inferred(digamma(a)) ≈ polygamma(0, a)
        @test @inferred(digamma(invdigamma(a))) ≈ a + zero(a)
        @test @inferred(trigamma(a)) ≈ polygamma(1, a)
    end
end

@testset "Beta" begin
    for a in (w, x, y)
        @test @inferred(beta(a, x)) ≈ @inferred(gamma(a)) * @inferred(gamma(x)) / @inferred(gamma(a + x))
        @test @inferred(beta(a, pi)) ≈ @inferred(gamma(a)) * @inferred(gamma(pi)) / @inferred(gamma(a + pi))
        @test @inferred(beta(ℯ, a)) ≈ @inferred(gamma(ℯ)) * @inferred(gamma(a)) / @inferred(gamma(ℯ + a))
        # TOOD: `logabsbeta` doesn't infer correctly in Julia v1.0.  Restore the
        # check when we drop support for that version.
        @test (logabsbeta(abs(a), x))[1] ≈ @inferred(log(@inferred(beta(abs(a), x))))
        @test (logabsbeta(abs(a), pi))[1] ≈ @inferred(log(@inferred(beta(abs(a), pi))))
        @test (logabsbeta(ℯ, abs(a)))[1] ≈ @inferred(log(@inferred(beta(ℯ, abs(a)))))
    end
end

@testset "Airy" begin
    @test @inferred(airyai(x)) ≈ 0.006591139357460721 ± 0.0011912976705951322
    @test @inferred(airyaiprime(x)) ≈ -0.01191297670595132 ± 0.0019773418072382165
    @test @inferred(airybi(x)) ≈ 14.037328963730136 ± 2.2922214966382017
    @test @inferred(airybiprime(x)) ≈ 22.922214966382015 ± 4.211198689119041
end

@testset "Bessel" begin
    for a in (x, y); @test 2 * @inferred(besselj1(a)) / a ≈ @inferred(besselj0(a)) + @inferred(besselj(2, a)); end
    for a in (x, y); @test @inferred(besselj(-1/2, a)) ≈ @inferred(sqrt(2/(pi*a))) * @inferred(cos(a)); end
    for a in (x, y); @test @inferred(besselj(1/2, a)) ≈ @inferred(sqrt(2/(pi*a))) * @inferred(sin(a)); end
    @test @inferred(bessely0(x)) ≈ 0.3768500100127904 ± 0.03246744247917999
    for a in (x, y); @test @inferred(bessely1(a)) ≈ -@inferred(bessely(-1, a)); end
    for a in (x, y); @test @inferred(bessely(5/2, a)) ≈
        (@inferred(besselj(5/2, a)) * @inferred(cos(2.5pi)) - @inferred(besselj(-5/2, a))) / @inferred(sin(2.5pi)); end
    for a in (x, y), k in (1, 2), nu in -1:1
        sgn = k == 1 ? +1 : -1
        @test @inferred(besselh(nu, k, a)) ≈
            complex(@inferred(besselj(nu, a)), sgn * @inferred(bessely(nu, a)))
    end
    @test @inferred(besseli(5//2, y)) ≈ 4.757626874823528 ± 1.0398232869843944
    for a in (x, y); @test @inferred(besselix(3, a)) ≈ @inferred(besseli(3, a)) * @inferred(exp(-abs(a))); end
    @test @inferred(besselk(7//3, x)) ≈ 0.07521953258226349 ± 0.010340691203742959
    for a in (x, y); @test @inferred(besselkx(3//4, a)) ≈ @inferred(besselk(3//4, a)) * @inferred(exp(a)); end
end

@testset "Modulo" begin
    frac, int = @inferred(modf(x + w))
    @test frac ≈ x + w - int
    @test int ≈ @inferred(floor((x + w).val)) ± 0
    for a in (w, x/2, y)
        @test @inferred(mod(a, -2.1)) ≈ @inferred(a + fld(a, -2.1) * 2.1)
        @test @inferred(mod(-5.8, a)) ≈ @inferred(-5.8 - fld(-5.8, a) * a)
        @test @inferred(rem(a, -3.7)) ≈ @inferred(a + div(a, -3.7) * 3.7)
        @test @inferred(rem(-4.9, a)) ≈ @inferred(-4.9 - div(-4.9, a) * a)
        @test @inferred(rem(a, 4.27, RoundNearest)) ≈
            a - 4.27 * round(a / 4.27, RoundNearest)
        @test @inferred(rem(-5.1, a, RoundNearest)) ≈
            -5.1 - a * round(-5.1 / a, RoundNearest)
        @test @inferred(rem(a, -1.2, RoundToZero)) ≈ rem(a, -1.2)
        @test @inferred(rem(3.45, a, RoundToZero)) ≈ rem(3.45, a)
        @test @inferred(rem(a, 6.7, RoundDown)) ≈ mod(a, 6.7)
        @test @inferred(rem(-8.9, a, RoundDown)) ≈ mod(-8.9, a)
        @test @inferred(rem(a, -3.14, RoundUp)) ≈ mod(a, 3.14)
        @test @inferred(rem(2.718, a, RoundUp)) ≈ mod(2.718, -a)
        for b in (10w, x, y)
            @test @inferred(mod(a, b)) ≈ a - fld(a, b)*b
            @test @inferred(rem(a, b)) ≈ a - div(a, b)*b
            @test @inferred(rem(a, b, RoundNearest)) ≈ a - b * round(a / b, RoundNearest)
        end
    end
    @test @inferred(mod2pi(pi*x)) ≈ measurement(pi, 0.1*pi)
    for r in (RoundNearest, RoundToZero, RoundUp, RoundDown), a in (3x, 5y, 10w)
        @test @inferred(rem2pi(a, r)) ≈ rem(a, 2pi, r)
        @test rem2pi(a, r) ≈ a - 2pi * round(a / (2pi), r)
    end

    @test round(3.141234±0.1, RoundNearestTiesAway) ≈ 3.0±0.0
    @test round(3.141234±0.1, RoundNearestTiesUp) ≈ 3.0±0.0
end

@testset "Machine precision" begin
    # In many of the tests of this set we want to use a very strict tolerance.
    @test eps(Measurement{Float64}) ≈ eps(Float64)
    @test eps(x) ≈ eps(x.val)
    @test nextfloat(x) ≈ nextfloat(x.val) ± x.err rtol=2e-16
    @test nextfloat(x, 3) ≈ nextfloat(x.val, 3) ± x.err rtol=2e-16
    @test prevfloat(w) ≈ prevfloat(w.val) ± w.err rtol=2e-16
    @test prevfloat(y, 3) ≈ prevfloat(y.val, 3) ± y.err rtol=2e-16
    for a in (w, x, y)
        @test prevfloat(a) ≈ a - eps(a) rtol=2e-16
        @test nextfloat(a) ≈ a + eps(a) rtol=2e-16
    end
    @test floatmin(Measurement{Float64}) ≈ floatmin(Float64) ± zero(Float64)
    @test floatmax(Measurement{Float64}) ≈ floatmax(Float64) ± zero(Float64)
    @test maxintfloat(Measurement{Float64}) ≈ maxintfloat(Float64)
end

@testset "Rounding" begin
    @test @inferred(round(w)) ≈ measurement(round(w.val), round(w.err))
    @test @inferred(round(w, digits=1)) ≈ measurement(round(w.val, digits=1),
                                                      round(w.err, digits=1))
    @test @inferred(round(Int, w)) ≈ round(Int, w.val)
    @test @inferred(floor(w)) ≈ measurement(floor(w.val))
    @test @inferred(floor(Int, w)) ≈ floor(Int, w.val)
    @test @inferred(ceil(w)) ≈ measurement(ceil(w.val))
    @test @inferred(ceil(Int, w)) ≈ ceil(Int, w.val)
    @test @inferred(trunc(w)) ≈ measurement(trunc(w.val))
    @test @inferred(trunc(Int, w)) ≈ trunc(Int, w.val)
    @test @inferred(round(w, RoundFromZero)) ≈ measurement(round(w.val, RoundFromZero),
                                                           round(w.err, RoundFromZero))
end

@testset "widening" begin
    @test @inferred(widen(Measurement{Float32})) == Measurement{Float64}
    @test @inferred(widemul(x, y)) ≈ big(x)*big(y)
end

@testset "Type representation" begin
    pp = pi ± (ℯ / 100)
    ww = -0.5345 ± 0.03123
    zz = ww * (1 + im)
    # test pretty printing at the REPL
    @test repr(pp) == "3.142 ± 0.027"
    @test_throws ErrorException repr(pp, context=:error_digits=>-4)
    @test repr(pp, context=:error_digits=>0) ==
        "3.141592653589793 ± 0.02718281828459045"
    @test repr(pp, context=:error_digits=>7) ==
        "3.14159265 ± 0.02718282"
    @test repr(ww, context=:compact=>true) == "-0.534±0.031"
    @test repr(ww) == "-0.534 ± 0.031"
    @test repr(ww, context=:error_digits=>0) == "-0.5345 ± 0.03123"
    @test repr(ww, context=IOContext(stdout, :error_digits=>1, :compact=>true)) == "-0.53±0.03"
    @test repr(ww, context=:error_digits=>3) == "-0.5345 ± 0.0312"
    @test repr(ww, context=IOContext(stdout, :error_digits=>4, :compact=>true)) == "-0.5345±0.03123"
    @testset "Inf, NaN and zero" begin
        @test repr(-12.34567±0) == "-12.34567 ± 0.0"
        @test repr(-12.34567±NaN) == "-12.34567 ± NaN"
        @test repr(-12.34567±0) == "-12.34567 ± 0.0"
        @test repr(-12.34567±Inf) == "-12.34567 ± Inf"
        @test repr(Inf±0.0123) == "Inf ± 0.012"
        @test repr((-NaN)±0.0123) == "NaN ± 0.012"
        @test repr(1e-6±0) == "1.0e-6 ± 0.0"
    end
    @testset "Value smaller than error" begin
        @test repr(1.234±1000) == "1.2 ± 1000.0"
        @test repr(1.234e-4±1) == "0.00012 ± 1.0"
        @test repr(1.234e-4±1e-2) == "0.00012 ± 0.01"
        @test repr(1.234e-4±2e-4) == "0.00012 ± 0.0002"
    end
    @testset "Array" begin
        @test occursin(r"2×2 (Array|Matrix){Measurement{Float64}(,2|)}:\n  -0.5±0.03    30.0±1.0 *\n 400.0±20.0  -500.0±30.0",
                       repr("text/plain", [w 10x; 100y 1000w]))
    end
    @testset "Complex numbers" begin
        @test repr("text/plain", zz, context=:compact=>true) == "(-0.534±0.031)-(0.534±0.031)im"
        @test repr("text/plain", zz) == "(-0.534 ± 0.031) - (0.534 ± 0.031)im"
        @test repr("text/plain", complex(x, w)) == "(3.0 ± 0.1) - (0.5 ± 0.03)im"
        @test repr("text/plain", complex(w, y)) == "(-0.5 ± 0.03) + (4.0 ± 0.2)im"
    end
    @testset "TeX and LaTeX" begin
        @test repr("text/latex", x) == "\$3.0 \\pm 0.1\$"
        @test repr("text/x-tex", y) == repr("text/x-latex", y) == "4.0 \\pm 0.2"
    end
    @testset "Alignment" begin
        @test Base.alignment(devnull, x) == (5,4)
    end
    @testset "Round-trip" begin
        # Make sure the printed representation of a Measurement object is correctly parsed as
        # the same number (note that the tag will be different, but that's not important here).
        for a in (w, x, y); @test eval(Meta.parse(repr(a))) == a; end
    end
    @testset "@printf" begin
        for T in (Float16, Float32, Float64, BigFloat)
            m1 = measurement(one(T))
            io = IOBuffer()
            @test_nowarn @printf(io, "Testing @printf: %.2e\n", m1)
            @test String(take!(io)) == "Testing @printf: 1.00e+00\n"
            @test @sprintf("Testing @sprintf: %.2e\n", m1) == "Testing @sprintf: 1.00e+00\n"
        end
    end
end

@testset "sum" begin
    @test @inferred(sum((x, w, x, y, -w))) ≈ 2x + y
    @test @inferred(sum([x, w, x, y, -w])) ≈ 2x + y
end

@testset "prod" begin
    @test @inferred(prod((w, x, y, -w))) ≈ -w^2 * x * y
    @test @inferred(prod([w, x, y, -w])) ≈ -w^2 * x * y
    @test @inferred(prod((w, x, y, -w, 0))) ≈ 0 ± 0
    @test @inferred(prod([w, x, y, -w, 0])) ≈ 0 ± 0
end

@testset "Miscellanea" begin
    @test @inferred(mean((x, w, x, y, -w))) ≈ (2x + y)/5
    @test @inferred(mean([x, w, x, y, -w])) ≈ (2x + y)/5
    @test @inferred(min(w, x, y)) === w
    @test @inferred(max(w, x, y)) === y
    @test @inferred(extrema([w, x, y])) == (w, y)
    @test @inferred(sort([y, w, x])) == [w, x, y]
end

@testset "Linear algebra" begin
    A = [(14 ± 0.1) (23 ± 0.2); (-12 ± 0.3) (29 ± 0.4)]
    c = [(7 ± 0.5), (-13 ± 0.6)]
    b = @inferred(A \ c)
    @test @inferred(A * b) ≈ c
    @test @inferred(b ⋅ c) ≈ 7.020527859237536 ± 0.5707235338984873
    @test det(A) ≈ 682 ± 9.650906693155829
    @test @inferred(A * inv(A)) ≈ I
    # This matrix `A` has the property that the Inf-norm of `A * inv(A) - I` has
    # zero value but non-zero uncertainty in Julia v1.9, which would make the
    # check `A * inv(A) ≈ I` fail.
    A = [(14 ± 0.1) (23 ± 0.2); (-12 ± 0.3) (24 ± 0.4)]
    @test @inferred(norm(A * inv(A) - I)) ≈ zero(Measurement{Float64}) atol=3e-16
    @test @inferred(A * inv(A)) ≈ I

    Z = [(0 ± 1) (0 ± 2); (0 ± 3) (0 ± 4)]
    @test norm(Z, 0) == 4 ± 0 # Note: all elements of `Z` are `!iszero`
    @test norm(Z, 1) == 0 ± sqrt(sum(abs2, uncertainty.(Z)))
    @test norm(Z, 2) == zero(Measurement{Float64})
    @test norm(Z, 5) == zero(Measurement{Float64})
    @test norm(Z, Inf) == zero(Measurement{Float64})
end

@testset "NaNs" begin
    # NaN as nominal value
    @test @inferred(2*(NaN ± 3)) ≈ NaN ± 6
    # NaN as uncertainty
    @test @inferred(2*(3 ± NaN)) ≈ 6 ± NaN
    # Both
    @test @inferred(2*(NaN ± NaN)) ≈ NaN ± NaN
    # Make sure isapprox is working well here
    @test 2*(3 ± NaN) ≉ 6 ± 0
    @test 2*(NaN ± NaN) ≉ NaN ± 0
end

@testset "@uncertain" begin
    @test @uncertain(tan(x)) ≈ tan(x)
    @testset "non-Measurement arguments" begin
        @test @uncertain(sin(-7.8)) == measurement(sin(-7.8))
        @test @uncertain(log(5.4, 3.6)) == measurement(log(5.4, 3.6))
        @test @uncertain(atan(x, 1.2)) ≈ atan(x, 1.2)
        @test @uncertain(hypot(-2.9, y)) ≈ hypot(-2.9, y)
    end
    @testset "correlation" begin
        @test @uncertain((a -> a + a + a)(x)) ≈ 3x
        @test @uncertain(+(x, -x, y, log(y), -w, w^2)) ≈ + y + log(y) - w * (1 - w)
    end
    @testset "zeta function" begin
        @test @uncertain(zeta(x)) ≈
            measurement(1.2020569031595951, 0.019812624290876782)
        # Test a couple of identities of the zeta function:
        # http://functions.wolfram.com/ZetaFunctionsandPolylogarithms/Zeta/17/01/01/
        @test @uncertain(zeta(w)) ≈
            gamma(1 - w) * 2 ^ w * pi ^ (w - 1) * sinpi(w / 2) * @uncertain(zeta(1 - w))
        @test @uncertain(zeta(w)) ≈
            pi ^ (w - 1/2) * gamma((1 - w) / 2) / gamma(w / 2) * @uncertain(zeta(1 - w))
        # Test a few derivatives of the zeta functions which are known:
        # http://mathworld.wolfram.com/RiemannZetaFunction.html
        @test @uncertain(zeta(0 ± 1)).der.value ≈ -log(2pi) / 2
        @test @uncertain(zeta(0.5 ± 1)).der.value ≈ -3.92264613
        @test @uncertain(zeta(2 ± 1)).der.value ≈ -0.93754825431
    end
    @testset "2-arg functions: $f" for f in (log, hypot, atan)
        @test @uncertain(f(x, y)) ≈ f(x, y)
    end
    @static if Base.BinaryPlatforms.arch(Base.BinaryPlatforms.HostPlatform()) ∉ ("aarch64", "armv6l", "armv7l", "powerpc64le")
        # Don't run this test if the platform doesn't allow it, see
        # https://github.com/JuliaLang/julia/blob/58ffe7e3ed3a93a9d816097548e785284f57fbd4/src/codegen.cpp#L5531-L5536
        @testset "ccall" begin
            f(x) = x * x
            ptr = @cfunction($f, Cdouble, (Cdouble,))
            g(x) = ccall(Base.unsafe_convert(Ptr{Cvoid}, ptr), Cdouble, (Cdouble,), x)*x
            @test GC.@preserve(ptr, @uncertain(g(x))) ≈ x^3
        end
    end
end

@testset "value and uncertainty" begin
    @test Measurements.value.([w, x, y]) == [-0.5, 3.0, 4.0]
    @test Measurements.value.([complex(w, x)]) == [complex(-0.5, 3.0)]
    @test Measurements.uncertainty.([w, x, y]) == [0.03, 0.1, 0.2]
    @test Measurements.uncertainty.([complex(w, x)]) == [complex(0.03, 0.1)]
    @test @inferred(Measurements.uncertainty(5)) === 0
    @test @inferred(Measurements.uncertainty(7.4)) === 0.0
    @test @inferred(Measurements.uncertainty(-3.6 + 7.4im)) === complex(0.0)
    @test @inferred(Measurements.value(5)) === 5
    @test @inferred(Measurements.value(7.4)) === 7.4
    @test @inferred(Measurements.value(-3.6 + 7.4im)) === complex(-3.6 + 7.4im)
end

@testset "Derivatives type" begin
    @test_throws KeyError getindex(x.der, (0, 0, -1))
    @test length((w + w + 2x + y).der) == 3
end

@testset "BigFloat's" begin
    @test big(Measurement) == Measurement{BigFloat}
    @test typeof(big(x)) == big(typeof(x))
    for a in (w, x, y); @test @inferred(@inferred(big(x) ^ 2) - @inferred(x * x)) ≈ zero(x); end
    @test Measurements.derivative(@inferred(@inferred(big(x) / 3) + x), x) ≈ inv(big(3)) + 1
    @test Measurements.derivative(big(x) + y, y) ≈ 1
    @test typeof(big(z)) == big(typeof(z))
    a = big"3.00000001" ± big"1e-17"
    b = big"4.00000001" ± big"1e-17"
    c = big"5.00000001" ± big"1e-15"
    d = big"4.0000000100000001" ± big"1e-17"
    for X in (a, b, c, d)
        @test @inferred(@inferred(sin(X*X + X*X)) / @inferred(cos(X*X + X*X))) ≈ @inferred(tan(2X^2))
    end
    @test @inferred(a * b) ≈
        big"12.0000000700000001" ±
        big"5.000000014000000000399999998880000003119999991353600023834879934652928178154734e-17"
    @test @inferred(a / x + w / b) ≈
        big"8.750000036458333325520833352864583284505208455403645528157552846272784550984708e-01" ±
        big"3.416666677095189699499391052146002403356891669706809079678073000173723744722607e-02"
    # The following test is present also in the examples in the manual.
    @test stdscore(a * d, big"12.00000007") > 7.9
end

@testset "QuadGK" begin
    @test QuadGK.quadgk(cos, x, y)[1] ≈ sin(y) - sin(x)
    @test QuadGK.quadgk(sin, -y, y)[1] ≈ cos(-y) - cos(y) atol = 2 * eps(Float64)
    @test QuadGK.quadgk(exp, 0.4, x)[1] ≈ exp(x) - exp(0.4)
    @test QuadGK.quadgk(sin, w, 2.7)[1] ≈ cos(w) - cos(2.7)
    @test QuadGK.quadgk(t -> cos(x - t), 0, 2pi; atol=eps(Float64))[1] ≈ measurement(0) atol = 5e-16
    @test QuadGK.quadgk(t -> exp(t / w), 0, 1)[1] ≈ w * (exp(1 / w) - one(x))
    for a in (w, x, y)
        @test QuadGK.quadgk(t -> 1 / abs2(t / a), 1, Inf)[1] ≈ a ^ 2
        @test QuadGK.quadgk(t -> exp(-abs2(t * a)), -Inf, Inf)[1] ≈ sqrt(pi) / abs(a)
    end
    @test QuadGK.quadgk(t -> cos(t - w), -w, 0)[1] + QuadGK.quadgk(t -> cos(t - w), 0, w)[1] ≈ sin(2w)
    @test QuadGK.quadgk(t -> exp(t / x), w, y)[1] ≈ x * (exp(y / x) - exp(w / x))
    @test QuadGK.quadgk(t -> sin(t - w), 0, y)[1] ≈ cos(w) - cos(y - w)
    @test QuadGK.quadgk(t -> log(y - t), w, -pi)[1] ≈
        (y - w)*log(y - w) - (y + pi)*log(y + pi) + w + pi
    # Compare some of the above integrals with results with "@uncertain" macro.
    @test QuadGK.quadgk(cos, x, y)[1] ≈
        @uncertain(((x,y) -> QuadGK.quadgk(cos, x, y)[1])(x, y))
    @test QuadGK.quadgk(sin, -y, y; atol=eps(Float64))[1] ≈
        @uncertain((x -> QuadGK.quadgk(sin, -x, x; atol=eps(Float64))[1])(y)) atol = 5e-13
    @test QuadGK.quadgk(exp, 0.4, x)[1] ≈
        @uncertain((x -> QuadGK.quadgk(exp, 0.4, x)[1])(x))
end

@testset "Calculus" begin
    for a in (w, x, y)
        @test Calculus.derivative(exp, a + w) ≈ exp(a + w)
        @test Calculus.derivative(t -> sin(t * x), a) ≈  x * cos(a * x)
        @test Calculus.derivative(t -> y * cos(t), a) ≈ -y * sin(a)
    end
end

@testset "String parsing" begin
    @test @inferred(measurement("  -123.4(56)  ")) ≈         -123.4 ± 5.6
    @test @inferred(measurement("  +1234(56)e-1  ")) ≈        123.4 ± 5.6
    @test @inferred(measurement(" ( +1.234 ± 0.056 )e2 ")) ≈  123.4 ± 5.6
    @test @inferred(measurement(" -12.34e1  +-  0.56e1 ")) ≈ -123.4 ± 5.6
    @test @inferred(measurement(" 1234e-1  +/-  5.6e0 ")) ≈   123.4 ± 5.6
    @test @inferred(measurement("  -1234e-1  ")) ≈ measurement(-1234e-1)
    @test @inferred(parse(Measurement{BigFloat}, "5.1 ± 3.3")) == big"5.1" ± big"3.3"
    @test @inferred(parse(Measurement{Float32}, "-7.6 ± 0.4")) == Float32(-7.6) ± Float32(0.4)
    @test @inferred(parse(Measurement{Float32}, "(3±0.1)e2")) == (Float32(3) ± Float32(0.1)) * Float32(100.0)
    @test @inferred(parse(Measurement{BigFloat}, "(3±0.1)e2")) == (big"3" ± big"0.1") * big"100.0"
    @test @inferred(parse(Measurement{Float16}, "+9.5 ± 2.8")) == Float16(+9.5) ± Float16(2.8)
    for a in (w, x, y); @test @inferred(parse(Measurement{Float64}, repr(a))) == a; end
    @test @inferred(measurement("11659208.0(6.3)e-10")) ≈ @inferred(measurement("11659208.0(6.3)e-10"))
    @test @inferred(measurement("12345.67(0.12)")) ≈ measurement(12345.67, 0.12)
    @test @inferred(measurement("12345.67(1.2)")) ≈ measurement(12345.67, 1.2)
    @test @inferred(measurement("12345.67(12.0)")) ≈ measurement(12345.67, 12)
    @test_throws ArgumentError measurement("abc")
    @test_throws ArgumentError measurement("(2±1")
    @test_throws ArgumentError measurement("2±1)e2")
    @test_throws ArgumentError measurement("(2)")
    @test_throws ArgumentError measurement("(2)e-2")
end

@testset "Fixed bugs" begin
    @test 1 * (big(3) ± 0) ≈ 3 ± 0
    @test Measurement{Float64}(2//1) === Measurement{Float64}(2.0)
end

@testset "Unitful" begin
    @test @inferred(1.0u"s" ± 0.1 * u"s") == measurement(1.0, 0.1) * u"s"
    @test @inferred(1.3 * u"km" ± 2.01 * u"μm") == measurement(1300, 2.01e-6) * u"m"
    @test_throws MethodError 1.0u"s" ± 0.1u"m"

    x = 1u"m" ± .2u"m"
    @test value(x) == 1u"m"
    @test uncertainty(x) == .2u"m"

    # `value` and `uncertainty` should work on any AbstractQuantity
    x = 2.71u"m/s"
    @test value(x) == x
    @test uncertainty(x) == zero(x)

    # Issue https://github.com/JuliaPhysics/Measurements.jl/issues/75
    f(x) = x^2
    F(x) = x^3 / 3
    a = (5 ± 0.1)u"m"
    b = (10 ± 1)u"m"
    @test (QuadGK.quadgk(f, a, b)[1]).val ≈ (F(b) - F(a)).val
end

@testset "Complex measurements" begin
    include("complex.jl")
end

@testset "Plot recipes" begin
    include("plots.jl")
end

@testset "Makie recipes" begin
    include("makie.jl")
end

@testset "Ranges" begin
    m = 2 ± 1
    @test m .+ (1:6) isa StepRangeLen
    @test m .* (1:2:6) isa StepRangeLen
    @test (1:.1:6) .- m isa StepRangeLen
    @test m ./ (1:6.0) isa Vector{<:Measurement}

    # JuliaLang/julia#30944
    @test range(0±0, step=1±.1, length=10) isa StepRangeLen
end

@testset "Base type" begin
    for T in (Float16, Float32, Float64)
        x = Measurement{T}(1.0)
        @test base_numeric_type(x) == T
        @test base_numeric_type(typeof(x)) == T

        # Should still work for nested types:
        nested_x = x * u"m"
        @test base_numeric_type(x) == T
        @test base_numeric_type(typeof(x)) == T
    end
end
