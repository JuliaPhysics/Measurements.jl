import Makie: convert_arguments, Point, PointBased, Errorbars, Band, PlotSpec, PlotList

@testset "PointBased" begin
    @test convert_arguments(PointBased(), [1, 2], [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)]) == (Point{2,Float64}[[1.0, 1.0], [2.0, 2.0]],)
    @test convert_arguments(PointBased(), [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)], [1, 2]) == (Point{2,Float64}[[1.0, 1.0], [2.0, 2.0]],)
    @test convert_arguments(PointBased(), [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)],
                                          [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)]) == (Point{2,Float64}[[1.0, 1.0], [2.0, 2.0]],)
end

@testset "Errorbars" begin
    # The errors can't be given as `Measurement`s, the uncertainties of `x` and `y` are used instead
    @test_throws "use `errorbars(x, y)`" convert_arguments(Errorbars, [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)],
                                                                      [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)],
                                                                      [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)])

    xmeas = [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)]
    ymeas = [Measurements.measurement(3.0, 0.2), Measurements.measurement(4.0, 0.3)]

    # Only `x` has uncertainties: horizontal errorbars
    spec = convert_arguments(Errorbars, xmeas, [1, 2])
    @test spec isa PlotSpec
    @test spec.type === :MeasurementErrorbars
    @test spec.args == [[1.0, 2.0], [1, 2], [0.5, 0.1], Float64[]]

    # Both have uncertainties: errorbars in both directions
    spec = convert_arguments(Errorbars, xmeas, ymeas)
    @test spec.type === :MeasurementErrorbars
    @test spec.args == [[1.0, 2.0], [3.0, 4.0], [0.5, 0.1], [0.2, 0.3]]

    # Only `y` has uncertainties: vertical errorbars
    spec = convert_arguments(Errorbars, [1, 2], ymeas)
    @test spec.type === :MeasurementErrorbars
    @test spec.args == [[1, 2], [3.0, 4.0], Float64[], [0.2, 0.3]]
end

@testset "Errorbars plots" begin
    xmeas = [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)]
    ymeas = [Measurements.measurement(3.0, 0.2), Measurements.measurement(4.0, 0.3)]
    # The errorbars drawn for `x` and `y` with uncertainties
    bars(p) = only(p.plots).plots

    p = errorbars(xmeas, [1, 2]).plot
    @test p isa PlotList
    @test only(bars(p)).direction[] === :x
    # The bars extend along x only
    limits = Makie.data_limits(only(bars(p)))
    @test minimum(limits)[1:2] ≈ [0.5, 1.0]
    @test maximum(limits)[1:2] ≈ [2.1, 2.0]
    # Attributes are forwarded to the errorbars
    @test only(bars(errorbars(xmeas, [1, 2]; whiskerwidth = 5).plot)).whiskerwidth[] == 5

    p = errorbars!(Axis(Figure()[1, 1]), xmeas, ymeas)
    @test [q.direction[] for q in bars(p)] == [:x, :y]
    # Both directions take one color from the cycle
    @test bars(p)[1].color[] == bars(p)[2].color[]
    p = errorbars(xmeas, ymeas; color = :red, whiskerwidth = 5).plot
    @test [q.color[] for q in bars(p)] == [:red, :red]
    @test [q.whiskerwidth[] for q in bars(p)] == [5, 5]

    # The direction follows from the data
    @test_throws "`direction` cannot be set" errorbars(xmeas, [1, 2]; direction = :y)
    @test_throws "`direction` cannot be set" errorbars(xmeas, ymeas; direction = :x)

    # Only `y` has uncertainties: vertical errorbars
    @test only(bars(errorbars([1, 2], ymeas).plot)).direction[] === :y
    @test_throws "`direction` cannot be set" errorbars([1, 2], ymeas; direction = :x)
    @test_throws "`direction` cannot be set" errorbars([1, 2], ymeas; direction = :y)

    # Units are stripped before the conversion, which used to be ambiguous (#213). Plots
    # built from specs only support units since Makie v0.25.
    if pkgversion(Makie) >= v"0.25"
        @test [q.direction[] for q in bars(errorbars(xmeas .* u"m", ymeas .* u"s").plot)] == [:x, :y]
        @test only(bars(errorbars(xmeas .* u"m", [1, 2] .* u"s").plot)).direction[] === :x
        @test only(bars(errorbars([1, 2] .* u"m", ymeas .* u"s").plot)).direction[] === :y
        @test_throws "`direction` cannot be set" errorbars(xmeas .* u"m", [1, 2] .* u"s"; direction = :y)
        @test_throws "`direction` cannot be set" errorbars([1, 2] .* u"m", ymeas .* u"s"; direction = :x)
        @test band(xmeas .* u"m", [1, 2] .* u"s").plot isa Band
    end
end

@testset "Band" begin
    @test convert_arguments(Band, [1, 2], [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)]) == (Point{2, Float64}[[1.0, 0.5], [2.0, 1.9]], Point{2, Float64}[[1.0, 1.5], [2.0, 2.1]])
    @test convert_arguments(Band, [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)],
                                  [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)]) == (Point{2, Float64}[[1.0, 0.5], [2.0, 1.9]], Point{2, Float64}[[1.0, 1.5], [2.0, 2.1]])
    # Only `x` has uncertainties: horizontal band
    @test convert_arguments(Band, [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)], [1, 2]) == (Point{2, Float64}[[0.5, 1.0], [1.9, 2.0]], Point{2, Float64}[[1.5, 1.0], [2.1, 2.0]])
end
