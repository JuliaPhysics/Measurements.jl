### plot-recipes.jl
#
# Copyright (C) 2017 Mosè Giordano.
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
# This file defines the recipes to plot Measurements vectors with Plots.jl package in 2D.
#
### Code:

using RecipesBase
using MakieCore

### Plots.jl

RecipesBase.@recipe function f(y::AbstractArray{<:Measurement})
    yerror := uncertainty.(y)
    value.(y)
end

RecipesBase.@recipe function f(func::Function, x::AbstractArray{<:Measurement})
    y = func.(x)
    xerror := uncertainty.(x)
    yerror := uncertainty.(y)
    value.(x), value.(y)
end

RecipesBase.@recipe function f(x::AbstractArray{<:Measurement}, y::AbstractArray{<:Measurement})
    xerror := uncertainty.(x)
    yerror := uncertainty.(y)
    value.(x), value.(y)
end

RecipesBase.@recipe function f(x::AbstractArray{<:Measurement}, y::AbstractArray)
    xerror := uncertainty.(x)
    value.(x), y
end

RecipesBase.@recipe function f(x::AbstractArray, y::AbstractArray{<:Measurement})
    yerror := uncertainty.(y)
    x, value.(y)
end

### Makie.jl

# PointBased plots
MakieCore.convert_arguments(P::MakieCore.PointBased, x::AbstractVector{<:Measurement}, y::AbstractVector{<:Measurement}) =
    MakieCore.convert_arguments(P, value.(x), value.(y))
MakieCore.convert_arguments(P::MakieCore.PointBased, x::AbstractVector{<:Real}, y::AbstractVector{<:Measurement}) =
    MakieCore.convert_arguments(P, x, value.(y))
MakieCore.convert_arguments(P::MakieCore.PointBased, x::AbstractVector{<:Measurement}, y::AbstractVector{<:Real}) =
    MakieCore.convert_arguments(P, value.(x), y)

#=
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
=#
