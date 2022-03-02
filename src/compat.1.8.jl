# https://github.com/JuliaLang/julia/pull/25085
Base.ceil(::Type{Bool}, x::Measurement) = measurement(ceil(Bool, value(x)))
Base.round(::Type{Bool}, x::Measurement) = measurement(round(Bool, value(x)))
Base.trunc(::Type{Bool}, x::Measurement) = measurement(trunc(Bool, value(x)))
Base.floor(::Type{Bool}, x::Measurement) = measurement(floor(Bool, value(x)))
