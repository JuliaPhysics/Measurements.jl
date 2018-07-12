imu = -6 ± 0.4

u = complex(5 ± 0.3, imu)
v = complex(imu, 8 ± 0.9)

@testset "Addition and subtraction" begin
    @test @inferred(2u - u - 3v + 2v + pi) ≈ @inferred(u - v + pi)
    @test @inferred(u + v) == @inferred(v + u)
    for a in (u, v, z)
        @test @inferred(a + 0) == @inferred(0 + a) == a
        @test @inferred(a - 0) == @inferred(-(0 - a)) == a
        @test @inferred(a + float(im)) == @inferred(float(im) + a)
    end
end

@testset "Multiplication and power" begin
    @test @inferred(v*v*u + u*u*v) ≈ @inferred(u^2*v + v^2*u)
    @test @inferred(u * v) == @inferred(v * u)
    for a in (u, v, z)
        @test @inferred(a * 1) == @inferred(1 * a) == a
        @test @inferred(a ^ 1) == a
        @test @inferred(a ^ 0) == one(a)
        @test @inferred(a * im) == @inferred(im * a)
    end
end

@testset "Division" begin
    @test @inferred(v/v + u/u) ≈ complex(2 ± 0) atol = 5e-18
    for a in (u, v, z)
        @test @inferred(a / 1) == a
        @test @inferred(a / im) == @inferred(-im * a)
    end
end

@testset "Inverse" begin
    @test @inferred(inv(v) + inv(u)) ≈ @inferred((v + u)/(v*u))
end

@testset "Trig functions" begin
    for a in (u, v)
        @test @inferred(cos(acos(a)))   ≈ a
        @test @inferred(cosh(acosh(a))) ≈ a
        @test @inferred(sin(asin(a)))   ≈ a
        @test @inferred(sinh(asinh(a))) ≈ a
        @test @inferred(tan(a))         ≈ @inferred(sin(a)/cos(a))
        @test @inferred(tan(atan(a)))   ≈ a
        @test @inferred(tanh(a))        ≈ @inferred(sinh(a)/cosh(a))
        @test @inferred(tanh(atanh(a))) ≈ a
        @test @inferred(sinpi(a))       ≈ sin(pi * a)
        @test @inferred(cospi(a))       ≈ cos(pi * a)
        @test @inferred(sinc(a))        ≈ (sin(pi * a) / (pi * a))
        @test @inferred(cosc(a))        ≈ ((cos(pi * a) - sin(pi * a) / (pi * a)) / a)
    end
end

@testset "Exponential and logarithm" begin
    @test @inferred(u ^ v) ≈ @inferred(exp(v * log(u)))
    for a in (u, v, z)
        @test @inferred(exp(a))          ≈ ℯ^a
        @test @inferred(expm1(a))        ≈ exp(a) - 1
        @test @inferred(exp10(a))        ≈ 10^a
        @test @inferred(exp2(a))         ≈ 2^a
        @test @inferred(exp(log(a)))     ≈ a
        @test @inferred(log(ℯ, a))       ≈ log(a)
        @test @inferred(log(10, a))      ≈ log10(a)
        @test @inferred(log(2, a))       ≈ log2(a)
        @test @inferred(log1p(a))        ≈ log(1 + a)
        @test @inferred(exp2(log2(a)))   ≈ a
        @test @inferred(exp10(log10(a))) ≈ a
        @test @inferred(expm1(log1p(a))) ≈ a
    end
end

@testset "Square root" begin
    for a in (u, v, z)
        @test @inferred(sqrt(a))         ≈ @inferred(a^0.5)
        @test @inferred(sqrt(a)*sqrt(a)) ≈ a
        @test @inferred(sqrt(big(a)))    ≈ sqrt(a)
    end
end

@testset "Absolute value" begin
    for a in (u, v, z); @test @inferred(abs(a)) ≈ @inferred(sqrt(abs2(a))); end
end

@testset "Representation" begin
    # Make sure the printed representation of a Measurement object is correctly parsed as
    # the same object (well, the tag will be different, but that's not important here).
    for a in (u, v, z); @test eval(Meta.parse(repr(a))) == a; end
end

@testset "Other" begin
    ⊕(a::Complex{<:Measurement}, b::Integer) =
        Measurements.result(Measurements.value(a) + b, (1, 0, 0, 1), a)
    ⊗(a::Complex{<:Measurement}, b::Integer) =
        Measurements.result(Measurements.value(a) * b, (b, 0, 0, b), a)
    for a in (u, v, z)
        @test a ⊕ 5 == a + 5
        @test a ⊗ 5 == a * 5
    end
end

# TODO: Define a method for lgamma with complex argument.
# # Factorial and gamma
# for a in (u, v); test_approx_eq(gamma(a), factorial(a - 1)); end
# for a in (u, v); test_approx_eq(gamma(a + 1), factorial(a)); end
# for a in (u, v); test_approx_eq(lgamma(a), log(gamma(a))); end
