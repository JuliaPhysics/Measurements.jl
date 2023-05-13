module MeasurementsJunoExt

@static if isdefined(Base, :get_extension)
    using Measurements
    using Juno
else
    using ..Measurements
    using ..Juno
end

Juno.render(i::Juno.Inline, measure::Measurement) =
Juno.render(i, Juno.Row(measure.val, Text(" ± "), measure.err))

Juno.Row(measure.val, Text(" ± "), measure.err)

function Juno.render(ji::Juno.Inline, cm::Complex{<:Measurement})
    r, i = reim(cm)
    if signbit(i) && !isnan(i)
        i = -i
        sss = " - "
    else
        sss = " + "
    end
    Juno.render(ji, Juno.Row("(", Juno.render(ji, r), ")", sss,
                            "(", Juno.render(ji, i), ")im"))
end

end