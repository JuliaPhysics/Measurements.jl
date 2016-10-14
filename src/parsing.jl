### parsing.jl
#
# Copyright (C) 2016 Mosè Giordano.
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
# This file defines a method for `measurement` which enables parsing of a string
# into a `Measurement` object.
#
### Code:

"""
    measurement(string) -> Measurement

Parse the string and return a `Measurement` object.

Examples of valid strings and the resulting `Measurement` are:

```
measurement("-123.4(56)")         -> -123.4 ± 5.6
measurement("+1234(56)e-1")       ->  123.4 ± 5.6
measurement("12.34e-1 +- 0.56e1") ->  123.4 ± 5.6
measurement("(-1.234 ± 0.056)e2")  > -123.4 ± 5.6
measurement("1234e-1 +/- 5.6e0")  ->  123.4 ± 5.6
measurement("-1234e-1")           -> -123.4 ± 0.0
```
"""
function measurement{T<:AbstractString}(s::T)
    str = strip(s)
    m = match(r"^([+-]?[0-9]+(\.[0-9]+)?)\(([0-9]+)\)(e[+-]?[0-9]+)?$", str)
    # Captures:
    #  1: the whole nominal value
    #  2: the decimal part of the nominal value (optional)
    #  3: the uncertainty on the last digits
    #  4: a global exponent factor (optional)
    if m != nothing
        val_str, val_dec, err_str, expn = m.captures
    else
        m = match(r"^\(?([+-]?[0-9.]+(?:e[+-]?[0-9]+)?)[ \t]*(?:\+/?-|±)[ \t]*([0-9.]+(?:e[+-]?[0-9]+)?)\)?(e[+-]?[0-9]+)?$", str)
        # Captures:
        #  1: the nominal value
        #  2: the uncertainty
        #  3: global exponent factor (optional)
        if m != nothing
            val_str, err_str, expn, val_dec = m.captures..., nothing
        else
            m = match(r"^([+-]?[0-9.]+(?:e[+-]?[0-9]+)?)$", str)
            if m != nothing
                # measurement(val) returns val ± 0.  For consistency,
                # measurement("val") should give the same result.
                val_str, err_str, val_dec, expn = m.captures[1], "0", nothing, nothing
            else
                error("Cannot parse \"", s, "\" string")
            end
        end
    end
    val = parse(val_str)
    err = parse(err_str)
    # The nominal value has a decimal part
    if val_dec != nothing
        # Multiply the uncertainty by 10^(-number_of_decimal_digits)
        err *= exp10(1 - length(val_dec))
    end
    # There is a global exponent factor
    if expn != nothing
        # Parse to a number
        fact = parse("1" * expn)
        val *= fact
        err *= fact
    end
    return measurement(val, err)
end
