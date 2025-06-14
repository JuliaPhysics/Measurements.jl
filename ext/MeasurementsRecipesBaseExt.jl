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
module MeasurementsRecipesBaseExt

using Measurements: Measurement, value, uncertainty
using RecipesBase

const unrecognised_uncertainty_plot_message = """
    Unrecognized value for `uncertainty_plot` keyword.
    Expecting either of `:bar` (default), `:ribbon`, or `:none`.
    """

@recipe function f(y::AbstractArray{<:Measurement}; uncertainty_plot = :bar)
	if uncertainty_plot == :ribbon
		ribbon := uncertainty.(y)
	elseif uncertainty_plot == :bar
		yerror := uncertainty.(y)
    elseif uncertainty_plot == :none

	else
		error(unrecognised_uncertainty_plot_message)
	end
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

@recipe function f(x::AbstractArray, y::AbstractArray{<:Measurement}; uncertainty_plot = :bar)
	if uncertainty_plot == :ribbon
		ribbon := uncertainty.(y)
	elseif uncertainty_plot == :bar
		yerror := uncertainty.(y)
    elseif uncertainty_plot == :none

	else
		error(unrecognised_uncertainty_plot_message)
	end
	x, value.(y)
end

end
