Measurements
============

Introduction
------------

`Measurements.jl <https://github.com/giordano/Measurements.jl>`__ is a `Julia
<http://julialang.org/>`__ package that allows you to define numbers with
uncertainties, perform calculations involving them, and easily get the
uncertainty of the result according to `linear error propagation theory
<https://en.wikipedia.org/wiki/Propagation_of_uncertainty>`__.

Features List
~~~~~~~~~~~~~

- Support for most mathematical operations available in Julia involving real and
  complex numbers. All existing functions that accept ``AbstractFloat`` (and
  ``Complex{AbstractFloat}``) arguments and internally use already supported
  functions can in turn perform calculations involving numbers with
  uncertainties without being redefined. This greatly enhances the power of
  ``Measurements.jl`` without effort for the users
- Functional correlation between variables is correctly handled, so :math:`x - x
  = 0 \pm 0`, :math:`x/x = 1 \pm 0`, :math:`\tan(x) = \sin(x)/\cos(x)`, etc...
- Support for `arbitrary precision
  <http://docs.julialang.org/en/stable/manual/integers-and-floating-point-numbers/#arbitrary-precision-arithmetic>`__
  numbers with uncertainties (though this may not be very useful for quantities
  that are intrinsically imprecise)
- Define arrays of measurements and perform calculations with them
- Propagate uncertainty for any function of real arguments (including functions
  based on `C/Fortran calls
  <http://docs.julialang.org/en/stable/manual/calling-c-and-fortran-code/>`__),
  using ``@uncertain`` `macro
  <http://docs.julialang.org/en/stable/manual/metaprogramming/>`__
- Functions to get the derivative and the gradient of an expression with respect
  to one or more independent measurements
- Functions to calculate `standard score
  <https://en.wikipedia.org/wiki/Standard_score>`__ and `weighted mean
  <https://en.wikipedia.org/wiki/Weighted_arithmetic_mean>`__
- Easy way to attach the uncertainty to a number using ``±`` sign

Further features are expected to come in the future, see the "How Can I Help?"
section and the TODO list.

License
-------

The ``Measurements.jl`` package is licensed under the MIT "Expat" License. The
original author is Mosè Giordano.

.. toctree::
   :maxdepth: 2

   installation.rst
   usage.rst
   examples.rst
   todo.rst
   appendix.rst
