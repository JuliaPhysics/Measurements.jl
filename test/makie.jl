import Makie: convert_arguments. Point
@testset "PointBased" begin
    @test convert_arguments(PointBased(), [(1, 2)], [(Measurements.uncertainty(1.0, 0.5), Measurements.uncertainty(2.0, 0.1))]) == (Point{2,Float64}[[1.0, 2.0], [1.0, 2.0]],)
end