### show.jl
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

import Printf

function truncated_print(io::IO, m::Measurement, error_digits::Int;
                         atbeg = "", atend = "", pm = "±")
    val = if iszero(m.err) || !isfinite(m.err)
        m.val
    else
        err_digits = -Base.hidigit(m.err, 10) + error_digits
        digits = if isfinite(m.val)
            max(-Base.hidigit(m.val, 10) + 2, err_digits)
        else
            err_digits
        end
        round(m.val, digits = digits)
    end
    print(io, atbeg, val,
          get(io, :compact, false) ? pm : " $pm ",
          round(m.err, sigdigits=error_digits), atend)
end

full_print(io::IO, measure::Measurement) =
    print(io, measure.val, get(io, :compact, false) ? "±" : " ± ", measure.err)

function Base.show(io::IO, m::Measurement)
    error_digits = get(io, :error_digits, 2)
    if error_digits > 0
            truncated_print(io, m, error_digits)
    elseif error_digits == 0
        full_print(io, m)
    else
        error("`error_digits` must be non-negative")
    end # if
end

function Base.show(io::IO, ::MIME"text/latex", measure::Measurement)
    error_digits = get(io, :error_digits, 2)
    truncated_print(io, measure, error_digits, atbeg = "\$", atend = "\$", pm = "\\pm")
end

for mime in (MIME"text/x-tex", MIME"text/x-latex")
    function Base.show(io::IO, ::mime, measure::Measurement)
        error_digits = get(io, :error_digits, 2)
        truncated_print(io, measure, error_digits, pm = "\\pm")
    end
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

if VERSION >= v"1.6.0-rc1"
    Printf.tofloat(measure::Measurement) = Printf.tofloat(measure.val)
end

### Juno pretty printing
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
