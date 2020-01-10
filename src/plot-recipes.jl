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

@recipe function f(y::AbstractArray{<:Measurement})
    yerror := uncertainty.(y)
    value.(y)
end

@recipe function f(func::Function, x::AbstractArray{<:Measurement})
    y = func.(x)
    xerror := uncertainty.(x)
    yerror := uncertainty.(y)
    value.(x), value.(y)
end

@recipe function f(x::AbstractArray{<:Measurement}, y::AbstractArray{<:Measurement})
    xerror := uncertainty.(x)
    yerror := uncertainty.(y)
    value.(x), value.(y)
end

@recipe function f(x::AbstractArray{<:Measurement}, y::AbstractArray)
    xerror := uncertainty.(x)
    value.(x), y
end

@recipe function f(x::AbstractArray, y::AbstractArray{<:Measurement})
    yerror := uncertainty.(y)
    x, value.(y)
end
