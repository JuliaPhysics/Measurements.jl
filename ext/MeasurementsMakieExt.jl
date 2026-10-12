### plot-recipes.jl
#
# Maintainer: Mosè Giordano <mose AT gnu DOT org>
# Keywords: uncertainty, error propagation, physics, plots
#
# This file is a part of Measurements.jl.
#
# License is MIT "Expat".
#
### Commentary:
#
# This file defines the recipes to plot Measurements vectors with Makie.jl package in 2D.
#
### Code:
module MeasurementsMakieExt

using Measurements: Measurement, value, uncertainty
using Makie: Makie, PointBased, Errorbars, Band, Point2

const S = Makie.SpecApi
# Makie v0.23 and older keep this in MakieCore
const documented_attributes = isdefined(Makie, :documented_attributes) ?
    Makie.documented_attributes : Makie.MakieCore.documented_attributes

# PointBased plots
Makie.convert_arguments(P::PointBased, x::AbstractVector{<:Measurement}, y::AbstractVector{<:Measurement}) =
    Makie.convert_arguments(P, value.(x), value.(y))
Makie.convert_arguments(P::PointBased, x::AbstractVector{<:Real}, y::AbstractVector{<:Measurement}) =
    Makie.convert_arguments(P, x, value.(y))
Makie.convert_arguments(P::PointBased, x::AbstractVector{<:Measurement}, y::AbstractVector{<:Real}) =
    Makie.convert_arguments(P, value.(x), y)

# errorbars
Makie.convert_arguments(::Type{<:Errorbars}, ::AbstractVector{<:Measurement}, ::AbstractVector{<:Measurement}, ::AbstractVector{<:Measurement}) =
    throw(ArgumentError("errorbars of `Measurement`s are drawn from the uncertainties of `x` and `y`, so use `errorbars(x, y)`. To pass the errors explicitly, use plain numbers, e.g. `errorbars(Measurements.value.(x), Measurements.value.(y), Measurements.uncertainty.(y); direction = :y)`"))
Makie.convert_arguments(::Type{<:Errorbars}, x::AbstractVector{<:Measurement}, y::AbstractVector{<:Real}) =
    S.MeasurementErrorbars(value.(x), y, uncertainty.(x), Float64[])
Makie.convert_arguments(::Type{<:Errorbars}, x::AbstractVector{<:Measurement}, y::AbstractVector{<:Measurement}) =
    S.MeasurementErrorbars(value.(x), value.(y), uncertainty.(x), uncertainty.(y))
Makie.convert_arguments(::Type{<:Errorbars}, x::AbstractVector{<:Real}, y::AbstractVector{<:Measurement}) =
    S.MeasurementErrorbars(x, value.(y), Float64[], uncertainty.(y))

Makie.@recipe MeasurementErrorbars (x, y, xerr, yerr) begin
    documented_attributes(Errorbars)...
    "Not supported, the direction follows from which arguments carry uncertainties."
    direction = nothing
end

function Makie.plot!(p::MeasurementErrorbars)
    isnothing(p.direction[]) ||
        throw(ArgumentError("errorbars are drawn along whichever of `x` and `y` carry uncertainties, so `direction` cannot be set. To choose the direction, pass the errors explicitly, e.g. `errorbars(Measurements.value.(x), Measurements.value.(y), Measurements.uncertainty.(y); direction = :y)`"))
    attributes = Makie.shared_attributes(p, Errorbars)
    # Makie v0.23 and older prefer these attributes over keyword arguments
    delete!(attributes, :direction)
    isempty(p[3][]) || Makie.errorbars!(p, attributes, p[1], p[2], p[3]; direction = :x)
    isempty(p[4][]) || Makie.errorbars!(p, attributes, p[1], p[2], p[4]; direction = :y)
    return p
end

# band
Makie.convert_arguments(P::Type{<:Band}, x::AbstractVector{<:Measurement}, y::AbstractVector{<:Measurement}) =
    Makie.convert_arguments(P, value.(x), value.(y) - uncertainty.(y), value.(y) + uncertainty.(y))
Makie.convert_arguments(P::Type{<:Band}, x::AbstractVector{<:Real}, y::AbstractVector{<:Measurement}) =
    Makie.convert_arguments(P, x, value.(y) - uncertainty.(y), value.(y) + uncertainty.(y))
Makie.convert_arguments(::Type{<:Band}, x::AbstractVector{<:Measurement}, y::AbstractVector{<:Real}) =
    (Point2.(value.(x) - uncertainty.(x), y), Point2.(value.(x) + uncertainty.(x), y))

end #module
