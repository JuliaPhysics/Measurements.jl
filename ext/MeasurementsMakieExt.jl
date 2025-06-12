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
using Makie: Makie, PointBased, Errorbars, Band

# PointBased plots
Makie.convert_arguments(P::PointBased, x::AbstractVector{<:Measurement}, y::AbstractVector{<:Measurement}) =
    Makie.convert_arguments(P, value.(x), value.(y))
Makie.convert_arguments(P::PointBased, x::AbstractVector{<:Real}, y::AbstractVector{<:Measurement}) =
    Makie.convert_arguments(P, x, value.(y))
Makie.convert_arguments(P::PointBased, x::AbstractVector{<:Measurement}, y::AbstractVector{<:Real}) =
    Makie.convert_arguments(P, value.(x), y)

# errorbars
Makie.convert_arguments(P::Type{<:Errorbars}, x::AbstractVector{<:Measurement}, y::AbstractVector{<:Measurement}, e::AbstractVector{<:Measurement}) =
    Makie.convert_arguments(P, value.(x), value.(y), uncertainty.(e))
Makie.convert_arguments(P::Type{<:Errorbars}, x::AbstractVector{<:Measurement}, y::AbstractVector{<:Real}) =
    Makie.convert_arguments(P, value.(x), y, uncertainty.(x))
Makie.convert_arguments(P::Type{<:Errorbars}, x::AbstractVector{<:Real}, y::AbstractVector{<:Measurement}) =
    Makie.convert_arguments(P, x, value.(y), uncertainty.(y))

# band
Makie.convert_arguments(P::Type{<:Band}, x::AbstractVector{<:Measurement}, y::AbstractVector{<:Measurement}) =
    Makie.convert_arguments(P, value.(x), value.(y) - uncertainty.(y), value.(y) + uncertainty.(y))
Makie.convert_arguments(P::Type{<:Band}, x::AbstractVector{<:Real}, y::AbstractVector{<:Measurement}) =
    Makie.convert_arguments(P, x, value.(y) - uncertainty.(y), value.(y) + uncertainty.(y))

end #module
