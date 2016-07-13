History of Measurements.jl
==========================

v0.1.3 (2016-??-??)
-------------------

### New Features ###

* `Measurement` function is made vectorial, so you can create an array of
  `Measurement` objects by feeding it with the array of nominal values and
  uncertainties.
* New functions `value` and `uncertainty` to access the nominal value and the
  uncertainty of measurements.

v0.1.2 (2016-07-09)
-------------------

### Bug Fixes ###

* Fix derivatives of `div`, `fld`, `cld`.
* Fix `frexp` with arguments whose absolute value is less than 0.5.

v0.1.1 (2016-06-23)
-------------------

### New Features ###

* `@uncertain` macro works with functions with any number of arguments.
* New mathematical operations supported: `erfi`, `dawson`, `digamma`,
  `invdigamma`, `trigamma`, `polygamma`, `beta`, `lbeta`, `airy`, `airyai`,
  `airyprime`, `airyaiprime`, `airybi`, `airybiprime`.
* The complete documentation of the package is available at
  http://measurementsjl.readthedocs.io

v0.1.0 (2016-06-18)
-------------------

### New Features ###

* Support for correlated variables has been added
  ([#3](https://github.com/giordano/Measurements.jl/issues/3)).
* Full support for complex measurements.
* Macro `@uncertain` enables propagation of uncertainty in any real function of
  one or two real arguments, including those functions making use of C/Fortran
  calls ([#4](https://github.com/giordano/Measurements.jl/issues/4)).
* New functions `Measurements.derivative` and `Measurements.gradient` to get the
  derivative and the gradient of an expression with respect to one or more
  independent measurements.
* Precompilation enabled.
* New method supported: `typemax`.

v0.0.2 (2016-06-13)
-------------------

### New Features ###

* `Measurement` is now subtype of `AbstractFloat`
  ([#1](https://github.com/giordano/Measurements.jl/issues/1)), but you can feed
  the constructor with any subtype of `Real` that can be converted to an
  `AbstractFloat`.
* New `weightedmean` function for calculating the weighted mean of measurements
  using
  [inverse-variance weighting](https://en.wikipedia.org/wiki/Inverse-variance_weighting).
* New mathematical operations supported: `modf`, `exp10`, `isnan`, `isfinite`,
  `isinf`, `isinteger`, `copysign`, `frexp`, `ldexp`, `div`, `cld`, `fld`,
  `mod`, `rem`, `mod2pi`, `eps`, `flipsign`, `erfinv`, `erfcinv`, `erfcx`.

### Breaking Changes ###

* Function `Constant` has been removed as it was mostly redundant and badly
  capitalized ([#2](https://github.com/giordano/Measurements.jl/issues/2)).
* In order to define complex `Measurement`s you have to use
  `complex(Measurement(a, b), Measurement(c, d))` so real and imaginary parts of
  the number have each their uncertainty.

### Bug Fixes ###

* Fix multiplication by and division of 0.  Previously, those operations would
  return `NaN` as uncertainty, now they give 0.

v0.0.1 (2016-05-20)
-------------------

Initial release.

### New Features ###

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
