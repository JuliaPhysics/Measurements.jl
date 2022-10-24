using .Makie

# PointBased plots
Makie.convert_arguments(P::PointBased, x::AbstractVector{<:Measurement}, y::AbstractVector{<:Measurement}) =
    convert_arguments(P, value.(x), value.(y))
Makie.convert_arguments(P::PointBased, x::AbstractVector{<:Real}, y::AbstractVector{<:Measurement}) =
    convert_arguments(P, x, value.(y))
Makie.convert_arguments(P::PointBased, x::AbstractVector{<:Measurement}, y::AbstractVector{<:Real}) =
    convert_arguments(P, value.(x), y)

# errorbars
Makie.convert_arguments(P::Type{<:Errorbars}, x::AbstractVector{<:Measurement}, y::AbstractVector{<:Measurement}, e::AbstractVector{<:Measurement}) =
    convert_arguments(P, value.(x), value.(y), uncertainty.(e))
Makie.convert_arguments(P::Type{<:Errorbars}, x::AbstractVector{<:Measurement}, y::AbstractVector{<:Real}) =
    convert_arguments(P, value.(x), y, uncertainty.(x))
Makie.convert_arguments(P::Type{<:Errorbars}, x::AbstractVector{<:Real}, y::AbstractVector{<:Measurement}) =
    convert_arguments(P, x, value.(y), uncertainty.(y))

# band
Makie.convert_arguments(P::Type{<:Band}, x::AbstractVector{<:Measurement}, y::AbstractVector{<:Measurement}) =
    convert_arguments(P, value.(x), value.(y) - uncertainty.(y), value.(y) + uncertainty.(y))
Makie.convert_arguments(P::Type{<:Band}, x::AbstractVector{<:Real}, y::AbstractVector{<:Measurement}) =
    convert_arguments(P, x, value.(y) - uncertainty.(y), value.(y) + uncertainty.(y))