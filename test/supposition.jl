using Supposition: Data, @composed, @check
using Measurements: value, uncertainty

# Generators

# Full-range floats for accessor tests (no algebraic operations, so subnormals are fine)
const raw_finite = Data.Floats{Float64}(; nans=false, infs=false)
const raw_pos = map(x -> abs(x) + floatmin(), raw_finite)

# Bounded away from subnormals so squaring uncertainties doesn't underflow.
const pos_float = Data.Floats{Float64}(; nans=false, infs=false, minimum=1e-150, maximum=1e150)

const measurement_gen = @composed function gen_measurement(v=raw_finite, e=pos_float)
    measurement(v, e)
end

const pos_measurement_gen = @composed function gen_pos_measurement(v=pos_float, e=pos_float)
    measurement(v, e)
end

# For self_division: relative uncertainty bounded so FP derivative cancellation
# doesn't blow up. Uses err ∈ [1e-150, val] to keep err/val ≤ 1.
const division_gen = @composed function gen_div(v=pos_float, e=pos_float)
    measurement(v, min(e, v))
end

@testset "Accessor round-trip" begin
    @check function value_roundtrip(v=raw_finite, e=raw_pos)
        m = measurement(v, e)
        value(m) == v && uncertainty(m) == e
    end
end

@testset "Correlation cancellation" begin
    @check function self_subtraction(x=measurement_gen)
        d = x - x
        iszero(value(d)) && iszero(uncertainty(d))
    end

    @check function self_division(x=division_gen)
        q = x / x
        value(q) == 1.0 && uncertainty(q) <= eps(1.0) * uncertainty(x) / value(x)
    end

    @check function pythagorean_identity(x=measurement_gen)
        s = sin(x)^2 + cos(x)^2
        isapprox(value(s), 1.0; rtol=1e-14) && uncertainty(s) < 1e-14
    end

    @check function exp_log_roundtrip(x=pos_measurement_gen)
        r = exp(log(x))
        isapprox(value(r), value(x); rtol=1e-12) && isapprox(uncertainty(r), uncertainty(x); rtol=1e-12)
    end
end

@testset "Algebraic laws" begin
    @check function add_commutativity(a=measurement_gen, b=measurement_gen)
        s1 = a + b
        s2 = b + a
        value(s1) == value(s2) && uncertainty(s1) == uncertainty(s2)
    end

    @check function mul_commutativity(a=measurement_gen, b=measurement_gen)
        p1 = a * b
        p2 = b * a
        value(p1) == value(p2) && uncertainty(p1) == uncertainty(p2)
    end

    @check function additive_identity(a=measurement_gen)
        s = a + (0.0 ± 0.0)
        value(s) == value(a) && uncertainty(s) == uncertainty(a)
    end

    @check function multiplicative_identity(a=measurement_gen)
        p = a * (1.0 ± 0.0)
        value(p) == value(a) && uncertainty(p) == uncertainty(a)
    end
end

@testset "Uncertainty non-negativity" begin
    @check function nonneg_unary(x=measurement_gen)
        uncertainty(sin(x)) >= 0 &&
            uncertainty(cos(x)) >= 0 &&
            uncertainty(exp(x)) >= 0 &&
            uncertainty(-x)     >= 0 &&
            uncertainty(abs(x)) >= 0 &&
            uncertainty(x^2)    >= 0
    end

    @check function nonneg_binary(a=measurement_gen, b=measurement_gen)
        uncertainty(a + b) >= 0 &&
            uncertainty(a - b) >= 0 &&
            uncertainty(a * b) >= 0
    end
end

@testset "Type stability" begin
    @check function arithmetic_preserves_type(a=measurement_gen, b=measurement_gen)
        (a + b) isa Measurement{Float64} &&
            (a - b) isa Measurement{Float64} &&
            (a * b) isa Measurement{Float64} &&
            sin(a)  isa Measurement{Float64}
    end
end

@testset "Parsing round-trip" begin
    @check function repr_parse_roundtrip(x=measurement_gen)
        io = IOBuffer()
        show(IOContext(io, :error_digits => 0), x)
        y = measurement(String(take!(io)))
        value(y) == value(x) && uncertainty(y) == uncertainty(x)
    end
end
