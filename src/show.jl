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

full_print(io::IO, val, err; atbeg = "", atend = "", pm = "±") =
    print(io, atbeg, val, get(io, :compact, false) ? pm : " $pm ", err, atend)

function truncated_print(io::IO, m::Measurement;
                         atbeg = "", atend = "", pm = "±")
    error_digits::Int = get(io, :error_digits, 2)

    val = m.val
    err = m.err

    if error_digits < 0
        error("`error_digits` must be non-negative")
    elseif error_digits > 0 && !_is_symbolic(val)
        val = if iszero(err) || !isfinite(err)
            val
        else
            err_digits = -Base.hidigit(err, 10) + error_digits
            digits = if isfinite(val)
                max(-Base.hidigit(val, 10) + 2, err_digits)
            else
                err_digits
            end
            round(val, digits = digits)
        end
        err = round(err, sigdigits=error_digits)
    end # if
    full_print(io, val, err, atbeg = atbeg, atend = atend, pm = pm)
end

function Base.show(io::IO, m::Measurement)
    truncated_print(io, m)
end

function Base.show(io::IO, ::MIME"text/latex", measure::Measurement)
    truncated_print(io, measure, atbeg = "\$", atend = "\$", pm = "\\pm")
end

for mime in (MIME"text/x-tex", MIME"text/x-latex")
    function Base.show(io::IO, ::mime, measure::Measurement)
        truncated_print(io, measure, pm = "\\pm")
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
        if !_is_symbolic(i.val) && signbit(i) && !isnan(i)
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

function Base.show(io::IO, ::MIME"text/latex", measure::Complex{<:Measurement})
    print(io, "\$")
    Base.show(io, "text/x-latex", measure)
    print(io, "\$")
end

function Base.show(io::IO, measure::Complex{<:Measurement})
    Base.show(io, "text/plain", measure)
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
