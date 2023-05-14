using Symbolics

isapprox(x::Symbolics.Num, y::Symbolics.Num; rest...) = isequal(x, y)

@testset "measurement" begin
    @variables x, x_err

    @test typeof(@inferred(measurement(x))) == Measurement{Num}
    @test typeof(@inferred(measurement(x, 0))) == Measurement{Num}
    @test typeof(@inferred(measurement(x, 1))) == Measurement{Num}
    @test typeof(@inferred(measurement(x, 0.0))) == Measurement{Num}
    @test typeof(@inferred(measurement(x, 1.0))) == Measurement{Num}
    @test typeof(@inferred(measurement(x, big(0)))) == Measurement{Num}
    @test typeof(@inferred(measurement(x, big(1)))) == Measurement{Num}
    @test typeof(@inferred(measurement(x, x_err))) == Measurement{Num}
    @test typeof(@inferred(measurement(0, x_err))) == Measurement{Num}
    @test typeof(@inferred(measurement(0.0, x_err))) == Measurement{Num}
    @test typeof(@inferred(measurement(big(0), x_err))) == Measurement{Num}

    @test iszero(@inferred(measurement(x)).err)
    @test @inferred(measurement(x)).tag === UInt64(0)
    @test length(@inferred(measurement(x)).der) == 0
    @test !(@inferred(measurement(x, x_err)).tag === UInt64(0))
    @test length(@inferred(measurement(x, 0)).der) == 0
    @test length(@inferred(measurement(x, x_err)).der) == 1
end

@testset "Type representation" begin
    @variables x_val, x_err

    x = measurement(x_val, x_err)

    # test pretty printing at the REPL
    @test_throws ErrorException repr(x, context=:error_digits=>-4)
    @test repr(x) == "x_val ± x_err"
    @test repr(x, context=:compact=>true) == "x_val±x_err"
    for error_digits in (0, 7)
        @test repr(x, context=:error_digits=>error_digits) == "x_val ± x_err"
        @test repr(x, context=IOContext(stdout, :error_digits=>error_digits, :compact=>true)) == "x_val±x_err"
    end

    @test repr("text/plain", x) == "x_val ± x_err"
    @test repr("text/plain", x, context=:compact=>true) == "x_val±x_err"
    for error_digits in (0, 7)
        @test repr("text/plain", x, context=:error_digits=>error_digits) == "x_val ± x_err"
        @test repr("text/plain", x, context=IOContext(stdout, :error_digits=>error_digits, :compact=>true)) == "x_val±x_err"
    end

    @test repr("text/latex", x) == "\$x_val \\pm x_err\$"
    @test repr("text/latex", x, context=:compact=>true) == "\$x_val\\pmx_err\$"
    for error_digits in (0, 7)
        @test repr("text/latex", x, context=:error_digits=>error_digits) == "\$x_val \\pm x_err\$"
        @test repr("text/latex", x, context=IOContext(stdout, :error_digits=>error_digits, :compact=>true)) == "\$x_val\\pmx_err\$"
    end

    for mime in ("text/x-tex", "text/x-latex")
        @test repr(mime, x) == "x_val \\pm x_err"
        @test repr(mime, x, context=:compact=>true) == "x_val\\pmx_err"
        for error_digits in (0, 7)
          @test repr(mime, x, context=:error_digits=>error_digits) == "x_val \\pm x_err"
          @test repr(mime, x, context=IOContext(stdout, :error_digits=>error_digits, :compact=>true)) == "x_val\\pmx_err"
        end
    end
end

##### Mathematical Operations
@testset "Sin" begin
    @variables x_val, x_err

    x = measurement(x_val, x_err)

    @test @inferred(sin(x)) ≈ measurement(sin(x_val), abs(x_err*cos(x_val)))
end
@testset "Addition" begin
    @variables x_val, x_err, y_val, y_err

    x = measurement(x_val, x_err)
    y = measurement(y_val, y_err)

    # abs2(v) === abs(x)^2, but maybe faster.
    @test @inferred(x + y) ≈ measurement(x_val + y_val, sqrt(abs2(x_err) + abs2(y_err)))
end
@testset "Addition w/ correlated arguments" begin
    @variables x_val, x_err, y_val, y_err

    x = measurement(x_val, x_err)
    y = measurement(y_val, y_err)

    @variables base_val, base_err
    base = measurement(base_val, base_err)
    x += base
    y += base

    # abs2(v) === abs(x)^2, but maybe faster.
    @test @inferred(x + y) ≈ measurement(x_val + y_val + 2*base_val, sqrt(abs2(x_err) + abs2(y_err) + abs2(2*base_err)))
end
