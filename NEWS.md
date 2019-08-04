History of Measurements.jl
==========================

v2.1.1 (2019-08-05)
-------------------

### Bug Fixes

* Fix loading of `SpecialFunctions.jl`
  ([#49](https://github.com/JuliaPhysics/Measurements.jl/issues/49),
  [#50](https://github.com/JuliaPhysics/Measurements.jl/pull/50)).

v2.1.0 (2019-08-03)
-------------------

### New Features

* Performance of `@uncertain` has been slightly improved in certain cases
  ([#32](https://github.com/JuliaPhysics/Measurements.jl/pull/32)).
* New method `measurement(::Quantity, ::Quantity)`, for easier creation of
  numbers with units (from the `Unitful.jl` package) and uncertainties
  ([#35](https://github.com/JuliaPhysics/Measurements.jl/issues/35),
  [#36](https://github.com/JuliaPhysics/Measurements.jl/pull/36)).
* `measurement(s::String)` method now understands decimal uncertainty
  ([#44](https://github.com/JuliaPhysics/Measurements.jl/issues/44),
  [#45](https://github.com/JuliaPhysics/Measurements.jl/pull/45))
* Truncated printing is now always used.  `IOContext` can be used to control the
  behaviour ([#40](https://github.com/JuliaPhysics/Measurements.jl/issues/40),
  [#43](https://github.com/JuliaPhysics/Measurements.jl/pull/43)):
  ```julia
  julia> using Measurements

  julia> x = pi ± (ℯ/100)
  3.142 ± 0.027

  julia> println(IOContext(stdout, :error_digits=>0), x)
  3.141592653589793 ± 0.02718281828459045

  julia> println(IOContext(stdout, :error_digits=>1), x)
  3.14 ± 0.03

  julia> println(IOContext(stdout, :error_digits=>5), x)
  3.141593 ± 0.027183
  ```

v2.0.0 (2019-02-10)
-------------------

### Breaking Changes

* Julia 1.0 is required, support for previous v0.7 was dropped.
* Uncertainties of `Measurement` objects are now shown in the REPL with two
  significant digits
  ([#5](https://github.com/JuliaPhysics/Measurements.jl/pull/5),
  [#30](https://github.com/JuliaPhysics/Measurements.jl/pull/30)).  The value of
  the `Measurement` is shown with the same level of rounding.  Note: this is
  only about representation of the `Measurement` in the REPL, its value and
  uncertainty are not actually rounded.

### New Features

* New method for `rem2pi`
  ([#29](https://github.com/JuliaPhysics/Measurements.jl/issues/29)).

v1.0.2 (2018-09-26)
-------------------

### Bug Fixes

* Fix conversion of a `Measurement` object to an `Int`.  This fixes also power of
  complex measurements.
* Ensure that `Measurement{T}(x)` returns a `Measurement{T}`
  ([#24](https://github.com/JuliaPhysics/Measurements.jl/pull/24)).  Until Julia
  0.6 this was done automatically, now we have to test this explicitly.

v1.0.1 (2018-09-07)
-------------------

### Bug Fixes

* Minor bug fixes
  ([#20](https://github.com/JuliaPhysics/Measurements.jl/pull/20),
  [#23](https://github.com/JuliaPhysics/Measurements.jl/pull/23)).

v1.0.0 (2018-08-16)
-------------------

### Breaking Changes

* Julia 0.7 is required, support for previous versions was dropped.
* Documentation has been movedo to
  https://juliaphysics.github.io/Measurements.jl/stable/.

v0.5.1 (2018-07-11)
-------------------

### New Features

* You can easily plot vectors of `Measurement` objects using the `Plots.jl`
  package.  The uncertainties of the numbers will automatically be used as sizes
  of the errorbars.
* `@uncertain` macro automatically converts all arguments of the function call
  to `Measurement` type, so that the user does not have to manually cast them.
* New method for `measurement(x::Measurement)` returning `x`.
* New methods for `Measurements.value(x::Real)` returning `x` and
  `Measurements.uncertainty(x::Real)` returning `zero(x)`.
* The package now supports pretty printing in Juno
  ([#12](https://github.com/JuliaPhysics/Measurements.jl/issues/12),
  [#13](https://github.com/JuliaPhysics/Measurements.jl/pull/13))
* The tag used internally to identify an independent quantity is now a
  (thread-safe) counter, rather than a (thread-unsafe) random number
  ([#15](https://github.com/JuliaPhysics/Measurements.jl/issues/15),
  [#16](https://github.com/JuliaPhysics/Measurements.jl/pull/16)).
* New `show` method for `text/latex` MIME, used in Jupyter notebooks.

v0.5.0 (2017-07-08)
-------------------

### Breaking Changes

* `isinteger` and `iszero` now check also that the uncertainty is zero.
* Comparison between `Measurement` and `Real` with `==` now compares also the
  uncertainty, so that the `Measurement` must have uncertainty equal to zero to
  be equal to a real number.
* Comparison between `Measurement` and `Irrational` with `==` now gives always
  `false`, consistently with the rest of `Real` types.

### New Features

* New mathematical operations supported: `sinpi`, `cospi`, `sinc`, `cosc`,
  `asec`, `acsc`, `acot`, `asech`, `acsch`, `acoth`, `sincos` (the last one only
  on Julia 0.7).
* It is now possible to parse a string as a `Measurement{T}` with any
  `T<:AbstractFloat` (not only `Measurement{Float64}`), as long as the parsing
  method is able to digest the string.  Tested with `T` equal to `Float16`,
  `Float32`, `Float64`, and `BigFloat`.

v0.4.0 (2017-04-26)
-------------------

### Breaking Changes

* Support for Julia 0.4 and 0.5 was dropped.
* `value` and `uncertainty` functions are no more exported.
* `Measurements.gradient` function has been removed.  Use the vectorized
  function `Measurements.derivative.(x, array)` instead.

### Improvements

* There were several performance improvements, both in speed and memory usage.
  These improvements are more evident for simple operations like addition and
  subtraction (now these operations are 2-3 times faster than in v0.3.0).  In
  addition, the overhead of operations with arrays of `Measurement`s and complex
  `Measurement`s was greatly reduced by avoiding useless conversions (now
  summing an array is 100 times faster than in v0.3.0).

### New Features

* `quadgk` function from [`QuadGK.jl`](https://github.com/JuliaMath/QuadGK.jl)
  package is extended to support `Measurement` objects as endpoints of
  integration ([#8](https://github.com/JuliaPhysics/Measurements.jl/pull/8)).
  Note that only the case of two real endpoints is supported.
* Real `Measurement` objects can be printed with `"text/x-tex"` and
  `"text/x-latex"` MIME types.  `\pm` TeX macro is used to render the `±` sign.
* A new `parse` method is provided, to parse a string to
  `Measurement{Float64}`.  This is the same as calling `measurement` with a
  string argument.

v0.3.0 (2016-12-07)
-------------------

### New Features

* New function ``Measurements.uncertainty_components`` to compute the components
  of the total uncertainty of a derived quantity.

### Breaking Changes

* When both arguments of `stdscore` are `Measurement`, the standard score
  between their difference and zero is now computed, in order to test their
  consistency.  This is most probably what users will expect.  As a consequence
  of this change, the returned value is never a `Measurement`.

v0.2.2 (2016-10-17)
-------------------

### New Features

* New method for `measurement`: you can parse a string in order to create a
  `Measurement` object.
* It is now possible to perform calculations involving numbers that have `NaN`
  as nominal value and/or uncertainty.  In previous versions it was possible
  only to define such numbers, but not to perform calculations with them.
* Performance of `sum` and `prod` with arrays of `Measurement`s has been
  slightly improved.  Now they are quadratic in the number of input arguments,
  instead of cubic.
* Improve printing of complex measurements.  Now each part, real and imaginary,
  is wrapped in parentheses in order to make it easier to distinguish them.

v0.2.1 (2016-09-11)
-------------------

### New Features

* New mathematical operations supported: `log2`, `abs2`, `fma`, `muladd`,
  `besseli`, `besselix`, `besselk`, `besselkx`, `widen`, `big`.

v0.2.0 (2016-07-13)
-------------------

### Breaking Changes

* The constructor of `Measurement` objects that you should directly use has been
  renamed to `measurement`.  What you have to do in your programs is to replace
  all occurrences of the uppercase version with the lowercase one.
  `Measurement` constructor is still exported, but you should never use it
  (unless you know how it works).  `±` is now an alias of `measurement`, so you
  do not need change anything if you used this sign in place of the
  `Measurement` function.

### New Features

* `measurement` function is made vectorial, so you can create an array of
  `Measurement` objects by feeding it with the array of nominal values and
  uncertainties.
* New functions `value` and `uncertainty` to access the nominal value and the
  uncertainty of measurements.

v0.1.2 (2016-07-09)
-------------------

### Bug Fixes

* Fix derivatives of `div`, `fld`, `cld`.
* Fix `frexp` with arguments whose absolute value is less than 0.5.

v0.1.1 (2016-06-23)
-------------------

### New Features

* `@uncertain` macro works with functions with any number of arguments.
* New mathematical operations supported: `erfi`, `dawson`, `digamma`,
  `invdigamma`, `trigamma`, `polygamma`, `beta`, `lbeta`, `airy`, `airyai`,
  `airyprime`, `airyaiprime`, `airybi`, `airybiprime`.
* The complete documentation of the package is available at
  http://measurementsjl.readthedocs.io

v0.1.0 (2016-06-18)
-------------------

### New Features

* Support for correlated variables has been added
  ([#3](https://github.com/JuliaPhysics/Measurements.jl/issues/3)).
* Full support for complex measurements.
* Macro `@uncertain` enables propagation of uncertainty in any real function of
  one or two real arguments, including those functions making use of C/Fortran
  calls ([#4](https://github.com/JuliaPhysics/Measurements.jl/issues/4)).
* New functions `Measurements.derivative` and `Measurements.gradient` to get the
  derivative and the gradient of an expression with respect to one or more
  independent measurements.
* Precompilation enabled.
* New method supported: `typemax`.

v0.0.2 (2016-06-13)
-------------------

### New Features

* `Measurement` is now subtype of `AbstractFloat`
  ([#1](https://github.com/JuliaPhysics/Measurements.jl/issues/1)), but you can
  feed the constructor with any subtype of `Real` that can be converted to an
  `AbstractFloat`.
* New `weightedmean` function for calculating the weighted mean of measurements
  using
  [inverse-variance weighting](https://en.wikipedia.org/wiki/Inverse-variance_weighting).
* New mathematical operations supported: `modf`, `exp10`, `isnan`, `isfinite`,
  `isinf`, `isinteger`, `copysign`, `frexp`, `ldexp`, `div`, `cld`, `fld`,
  `mod`, `rem`, `mod2pi`, `eps`, `flipsign`, `erfinv`, `erfcinv`, `erfcx`.

### Breaking Changes

* Function `Constant` has been removed as it was mostly redundant and badly
  capitalized ([#2](https://github.com/JuliaPhysics/Measurements.jl/issues/2)).
* In order to define complex `Measurement`s you have to use
  `complex(Measurement(a, b), Measurement(c, d))` so real and imaginary parts of
  the number have each their uncertainty.

### Bug Fixes

* Fix multiplication by and division of 0.  Previously, those operations would
  return `NaN` as uncertainty, now they give 0.

v0.0.1 (2016-05-20)
-------------------

Initial release.

### New Features

* `Measurement` type is a parametric type, subtype of `Number`.
* You can define `Measurement` objects with `Measurement(a, b)`, being `a` the
  value of the measurement, and `b` its uncertainty as standard deviation.  You
  can also employ the shorter syntax `a ± b`.
* The function `stdscore` to calculate the
  [standard score](https://en.wikipedia.org/wiki/Standard_score) is available.
* Mathematical operation supported: `+`, `-`, `*`, `/`, `inv`, `^`, `exp2`,
  `cos`, `sin`, `deg2rad`, `rad2deg`, `cosd`, `sind`, `cosh`, `sinh`, `tan`,
  `tand`, `tanh`, `acos`, `acosd`, `acosh`, `asin`, `asind`, `asinh`, `atan`,
  `atan2`, `atand`, `atanh`, `csc`, `cscd`, `csch`, `sec`, `secd`, `sech`,
  `cot`, `cotd`, `coth`, `exp`, `expm1`, `log`, `log10`, `log1p`, `hypot`,
  `sqrt`, `cbrt`, `abs`, `sign`, `zero`, `one`, `erf`, `erfc`, `factorial`,
  `gamma`, `lgamma`, `signbit`.
