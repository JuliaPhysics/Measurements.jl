module MeasurementsJunoExt

if isdefined(Base, :get_extension)
    using Measurements: Measurement, value, uncertainty
    using RecipesBase
else
    using ..Measurements
    using ..RecipesBase
end

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

end