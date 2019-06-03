### parsing.jl
#
# Copyright (C) 2016, 2017 Mosè Giordano.
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
# "123(45)e6".  Captures:
#  1: the whole nominal value
#  2: the decimal part of the nominal value (optional)
#  3: the uncertainty on the last digits
#  4: the decimal part of the uncertainty, if any
#  5: a global exponent factor (optional)
const rxp_error_with_parentheses =
    Regex("^[ \\t]*([+-]?[0-9]+(\\.[0-9]+)?)\\(([0-9]+(\\.[0-9]+)?)\\)(" *
          rxp_expn * ")?[ \\t]*\$")

# Regexp matching a global exponent: "(...)e-1".  Captures:
#  1: the rest of the string
#  2: the global exponent
const rxp_global_exponent = Regex("^[ \\t]*\\((.*)\\)(" *
                                  rxp_expn * ")[ \\t]*\$")

# Regexp matching a measurement, with error expressed within plus-minus sign:
# "12.3e-4 ± 5.6e-7".  Captures:
#  1: the nominal value
#  2: the uncertainty
#  3: global exponent factor (optional)
const rxp_error_with_pm =
    Regex("^[ \\t]*(" * rxp_full_numb_sign * ")[ \\t]*(?:\\+/?-|±)[ \\t]*(" *
          rxp_full_numb * ")[ \\t]*\$")

# Regexp matching number without uncertainty "123.4e5"
const rxp_no_error = Regex("^[ \\t]*(" * rxp_full_numb_sign * ")[ \\t]*\$")

"""
    measurement(string) -> Measurement{Float64}

Parse the string and return a `Measurement{Float64}` object.

Examples of valid strings and the resulting `Measurement{Float64}` are:

```jldoctest
julia> measurement("-123.4(56)")
-123.4 ± 5.6

julia> measurement("+1234(56)e-1")
123.4 ± 5.6

julia> measurement("12.34e-1 +- 0.56e1")
1.2 ± 5.6

julia> measurement("(-1.234 ± 0.056)e2")
-123.4 ± 5.6

julia> measurement("1234e-1 +/- 5.6e0")
123.4 ± 5.6

julia> measurement("-1234e-1")
-123.4 ± 0.0
```
"""
measurement(str::AbstractString) = parse(Measurement{Float64}, str)

function Base.parse(::Type{Measurement{T}}, str::S) where {T<:AbstractFloat, S<:AbstractString}
    m = match(rxp_error_with_parentheses, str)
    if m !== nothing # "123(45)e6"
        val_str::S, val_dec, err_str::S, err_dec_str, expn = m.captures
    else
        m = match(rxp_global_exponent, str)
        if m === nothing # There is no global exponent
            expn = nothing
        else # "(...)e5"
            str, expn = m.captures
        end
        m = match(rxp_error_with_pm, str)
        if m !== nothing # "12.3e-4 ± 5.6e-7"
            val_str, err_str, val_dec = m.captures..., nothing
        else
            m = match(rxp_no_error, str) # Match "123.4e5"
            if m !== nothing === expn # Exclude the case "(123.4e5)e6"
                # measurement(val) returns val ± 0.  For consistency,
                # measurement("val") should give the same result.
                val_str, err_str, val_dec, expn =
                    m.captures[1], "0", nothing, nothing
            else
                throw(ArgumentError("cannot parse $(repr(str)) as Measurement{$T}"))
            end
        end
    end
    val::T = parse(T, val_str)
    err::T = parse(T, err_str)
    if val_dec !== nothing # The nominal value has a decimal part
        if err_dec_str === nothing
            # The uncertainty is to be interpreted as the uncertainty on the
            # last digits of the value.  Divide the uncertainty by
            # 10^(number_of_decimal_digits)
            err /= exp10(length(val_dec) - 1)
        end
    end
    if expn !== nothing # There is a global exponent factor
        # Parse to a number
        fact = parse(T, "1" * expn)
        val *= fact
        err *= fact
    end
    return measurement(val, err)
end
