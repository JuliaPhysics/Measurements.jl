imu = 6 ± 0.4

u = complex(5 ± 0.3, imu)
v = complex(imu, 8 ± 0.9)

@testset "Addition and subtraction" begin
    @test 2u - u - 3v + 2v + pi ≈ u - v + pi
end

@testset "Multiplication and power" begin
    @test v*v*u + u*u*v ≈ u^2*v + v^2*u
end

@testset "Division" begin
    @test v/v + u/u ≈ complex(2 ± 0) atol = 5e-18
end

@testset "Inverse" begin
    @test inv(v) + inv(u) ≈ (v + u)/(v*u)
end

@testset "Trig functions" begin
    for a in (u, v)
        @test cos(acos(a)) ≈ a
        @test cosh(acosh(a)) ≈ a
        @test sin(asin(a)) ≈ a
        @test sinh(asinh(a)) ≈ a
        @test tan(a) ≈ sin(a)/cos(a)
        @test tan(atan(a)) ≈ a
        @test tanh(a) ≈ sinh(a)/cosh(a)
        @test tanh(atanh(a)) ≈ a
    end
end

@testset "Exponential and logarithm" begin
    for a in (u, v)
        @test exp(a) ≈ e^a
        @test expm1(a) ≈ exp(a) - 1
        @test exp10(a) ≈ 10^a
        @test exp(log(a)) ≈ a
        @test log(e, a) ≈ log(a)
        @test log(10, a) ≈ log10(a)
        @test log1p(a) ≈ log(1 + a)
    end
end

@testset "Square root" begin
    for a in (u, v)
        @test sqrt(a) ≈ a^0.5
        @test sqrt(a)*sqrt(a) ≈ a
    end
end

@testset "Absolute value" begin
    for a in (u, v); @test abs(a) ≈ sqrt(abs2(a)); end
end

# TODO: Define a method for lgamma with complex argument.
# # Factorial and gamma
# for a in (u, v); test_approx_eq(gamma(a), factorial(a - 1)); end
# for a in (u, v); test_approx_eq(gamma(a + 1), factorial(a)); end
# for a in (u, v); test_approx_eq(lgamma(a), log(gamma(a))); end
