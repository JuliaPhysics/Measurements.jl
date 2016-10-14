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

# Regxep matching the exponent part: "e-4"
const rxp_expn = "e[+-]?[0-9]+"
# Regexp matching the complete number: "5.6e-7"  or "48"
const rxp_full_numb = "[0-9.]+" * "(?:" * rxp_expn * ")?"
# Regexp matching the complete number, including the sign: "-12.3e4"
const rxp_full_numb_sign = "[+-]?" * rxp_full_numb
# Regexp matching a measurement, with error expressed within parentheses:
# "123(45)e6"
const rxp_error_with_parentheses =
    Regex("^([+-]?[0-9]+(\\.[0-9]+)?)\\(([0-9]+)\\)(" * rxp_expn * ")?\$")
# Regexp matching a global exponent: "(...)e-1"
const rxp_global_exponent = Regex("^\\((.*)\\)(" * rxp_expn * ")\$")
# Regexp matching a measurement, with error expressed within plus-minus sign:
# "12.3e-4 ± 5.6e-7"
const rxp_error_with_pm =
    Regex("^(" * rxp_full_numb_sign * ")[ \\t]*(?:\\+/?-|±)[ \\t]*(" *
          rxp_full_numb * ")\$")
# Regexp matching number without uncertainty "123.4e5"
const rxp_no_error = Regex("^(" * rxp_full_numb_sign * ")\$")

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
    m = match(rxp_error_with_parentheses, str)
    # Captures:
    #  1: the whole nominal value
    #  2: the decimal part of the nominal value (optional)
    #  3: the uncertainty on the last digits
    #  4: a global exponent factor (optional)
    if m != nothing
        val_str, val_dec, err_str, expn = m.captures
    else
        m = match(rxp_global_exponent, str)
        # Captures:
        #  1: the rest of the string
        #  2: the global exponent
        if m == nothing
            expn = nothing
        else
            str, expn = m.captures
        end
        m = match(rxp_error_with_pm, str)
        # Captures:
        #  1: the nominal value
        #  2: the uncertainty
        #  3: global exponent factor (optional)
        if m != nothing
            val_str, err_str, val_dec = m.captures..., nothing
        else
            m = match(rxp_no_error, str)
            if m != nothing == expn # Exclude the case "(123e4)e5"
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
