### special-functions.jl
#
# Copyright (C) 2019 Mosè Giordano.
#
# Maintainer: Mosè Giordano <mose AT gnu DOT org>
# Keywords: uncertainty, error propagation, physics
#
# This file is a part of Measurements.jl.
#
# License is MIT "Expat".
#
### Commentary:
#
# This file contains methods to print Measurement objects within a Juno enviroment
#
### Code:

### Special functions
module MeasurementsJunoExt

using Measurements
using Juno

Juno.render(i::Juno.Inline, measure::Measurement) =
Juno.render(i, Juno.Row(measure.val, Text(" ± "), measure.err))

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
