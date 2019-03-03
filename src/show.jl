### parsing.jl
#
# Copyright (C) 2018 Mosè Giordano.
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
# This file defines the methods to represent `Measurement` objects in various places.
#
### Code:

truncated_print(io::IO, m::Measurement; atbeg = "", atend = "", pm = "±") =
    print(io, atbeg,
          iszero(m.err) ? m.val : round(m.val, digits = -Base.hidigit(m.err, 10) + 2),
          get(io, :compact, false) ? pm : " $pm ",
          round(m.err, sigdigits=2), atend)

Base.show(io::IO, measure::Measurement) =
    print(io, measure.val, get(io, :compact, false) ? "±" : " ± ", measure.err)

function Base.show(io::IO, ::MIME"text/plain", m::Measurement)
    if get(io, :limit, false) || !iszero(m.err)
        truncated_print(io, m)
    else
       print(io, m)
    end # if
end

Base.show(io::IO, ::MIME"text/latex", measure::Measurement) =
    truncated_print(io, measure, atbeg = "\$", atend = "\$", pm = "\\pm")

for mime in (MIME"text/x-tex", MIME"text/x-latex")
    Base.show(io::IO, ::mime, measure::Measurement) =
        truncated_print(io, measure, pm = "\\pm")
end

# Representation of complex measurements.  Print something that is easy to
# understand and that can be meaningfully copy-pasted into the REPL, at least
# for standard numeric types.
for mime in (MIME"text/plain", MIME"text/x-tex", MIME"text/x-latex")
    function Base.show(io::IO, mtype::mime, measure::Complex{<:Measurement})
        r, i = reim(measure)
        compact = get(io, :compact, false)
        print(io, "(")
        show(io, mtype, r)
        print(io, ")")
        if signbit(i) && !isnan(i)
            i = -i
            print(io, compact ? "-" : " - ")
        else
            print(io, compact ? "+" : " + ")
        end
        print(io, "(")
        show(io, mtype, i)
        print(io, ")im")
    end
end

# This is adapted from base/show.jl for Complex type.
function Base.alignment(io::IO, measure::Measurement)
    m = match(r"^(.*[\±])(.*)$", sprint(show, measure, context=io, sizehint=0))
    m === nothing ? (length(sprint(show, measure, context=io, sizehint=0)), 0) :
        (length(m.captures[1]), length(m.captures[2]))
end

### Juno pretty printing
using Requires
@require Juno="e5e0dc1b-0480-54bc-9374-aad01c23163d" begin
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
