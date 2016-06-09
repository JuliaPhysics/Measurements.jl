vX.Y.Z (201?-??-??)
===================

New Features
------------

* `Measurement` is now subtype of `Real`
  ([#1](https://github.com/giordano/Measurements.jl/issues/1)).  In order to
  define complex `Measurement`s you can use `complex(Measurement(a, b),
  Measurement(c, d))` so real and imaginary parts of the number have each their
  uncertainty.
* New `weightedmean` function for calculating the weighted mean of measurements
  using
  [inverse-variance weighting](https://en.wikipedia.org/wiki/Inverse-variance_weighting).
* New methods: `modf`, `exp10`, `isnan`, `isfinite`, `isinf`, `isinteger`,
  `copysign`, `frexp`, `ldexp`, `div`, `fld`, `mod`, `rem`, `eps`.

Breaking Changes
----------------

* Function `Constant` has been removed as it was mostly redundant and badly
  capitalized ([#2](https://github.com/giordano/Measurements.jl/issues/2)).

Bug Fixes
---------

* Fix multiplication by and division of 0.  Previously, those operations would
  return `NaN` as uncertainty, now they give 0.

v0.0.1 (2016-05-20)
===================

Initial release.

New Features
------------

* `Measurement` type is a parametric type, subtype of `Number`.
* You can define `Measurement` objects with `Measurement(a, b)`, being `a` the
  value of the measurement, and `b` its uncertainty as standard deviation.  You
  can also employ the shorter syntax `a ± b`.
* The function `stdscore` to calculate the
  [standard score](https://en.wikipedia.org/wiki/Standard_score) is available.
