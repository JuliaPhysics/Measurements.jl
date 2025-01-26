import Makie: convert_arguments, Point, PointBased, Errorbars, Band, Vec

@testset "PointBased" begin
    @test convert_arguments(PointBased(), [1, 2], [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)]) == (Point{2,Float64}[[1.0, 1.0], [2.0, 2.0]],)
    @test convert_arguments(PointBased(), [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)], [1, 2]) == (Point{2,Float64}[[1.0, 1.0], [2.0, 2.0]],)
    @test convert_arguments(PointBased(), [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)],
                                          [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)]) == (Point{2,Float64}[[1.0, 1.0], [2.0, 2.0]],)
end

@testset "Errorbars" begin
    @test convert_arguments(Errorbars, [1, 2], [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)]) == (Vec{4, Float64}[[1.0, 1.0, 0.5, 0.5], [2.0, 2.0, 0.1, 0.1]],)
    @test convert_arguments(Errorbars, [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)], [1, 2]) == (Vec{4, Float64}[[1.0, 1.0, 0.5, 0.5], [2.0, 2.0, 0.1, 0.1]],)
    # TODO: Currently intentionally ambigious.
    # @test convert_arguments(Errorbars, [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)],
    #                                    [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)]) == (Vec{4, Float64}[[1.0, 1.0, 0.5, 0.5], [2.0, 2.0, 0.1, 0.1]],)
    @test convert_arguments(Errorbars, [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)],
                                       [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)],
                                       [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)]) == (Vec{4, Float64}[[1.0, 1.0, 0.5, 0.5], [2.0, 2.0, 0.1, 0.1]],)
end

@testset "Band" begin
    @test convert_arguments(Band, [1, 2], [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)]) == (Point{2, Float64}[[1.0, 0.5], [2.0, 1.9]], Point{2, Float64}[[1.0, 1.5], [2.0, 2.1]])
    @test convert_arguments(Band, [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)],
                                  [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)]) == (Point{2, Float64}[[1.0, 0.5], [2.0, 1.9]], Point{2, Float64}[[1.0, 1.5], [2.0, 2.1]])
end