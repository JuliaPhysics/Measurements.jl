import Makie: convert_arguments, Point, PointBased, Errorbars, Band
@testset "PointBased" begin
    @test convert_arguments(PointBased(), [1, 2], [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)]) == (Point{2,Float64}[[1.0, 1.0], [2.0, 2.0]],)
    @test convert_arguments(PointBased(), [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)], [1, 2]) == (Point{2,Float64}[[1.0, 1.0], [2.0, 2.0]],)
    @test convert_arguments(PointBased(), [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)],
                                          [Measurements.measurement(1.0, 0.5), Measurements.measurement(2.0, 0.1)]) == (Point{2,Float64}[[1.0, 1.0], [2.0, 2.0]],)
end

@testset "Errorbars" begin
end

@testset "Band" begin
end