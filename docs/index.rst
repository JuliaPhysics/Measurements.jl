Measurements.jl
===============

`Measurements.jl <https://github.com/JuliaPhysics/Measurements.jl>`__ is a
package that allows you to define numbers with `uncertainties
<https://en.wikipedia.org/wiki/Measurement_uncertainty>`__, perform calculations
involving them, and easily get the uncertainty of the result according to
`linear error propagation theory
<https://en.wikipedia.org/wiki/Propagation_of_uncertainty>`__.  This library is
written in `Julia <http://julialang.org/>`__, a modern high-level,
high-performance dynamic programming language designed for technical computing.

When used in the `Julia interactive session
<http://docs.julialang.org/en/stable/manual/getting-started/>`__, it can serve
also as an easy-to-use calculator.

The main features of the package are:

- Support for most mathematical operations available in Julia standard library
  and special functions from `SpecialFunctions.jl
  <https://github.com/JuliaMath/SpecialFunctions.jl>`__ package, involving real
  and complex numbers.  All existing functions that accept ``AbstractFloat``
  (and ``Complex{AbstractFloat}`` as well) arguments and internally use already
  supported functions can in turn perform calculations involving numbers with
  uncertainties without being redefined.  This greatly enhances the power of
  ``Measurements.jl`` without effort for the users
- Functional correlation between variables is correctly handled, so :math:`x - x
  \approx 0 \pm 0`, :math:`x/x \approx 1 \pm 0`, :math:`\tan(x) \approx
  \sin(x)/\cos(x)`, :math:`\mathrm{cis}(x) \approx \exp(ix)`, etc...
- Support for `arbitrary precision
  <http://docs.julialang.org/en/stable/manual/integers-and-floating-point-numbers/#arbitrary-precision-arithmetic>`__
  (also called multiple precision) numbers with uncertainties.  This is useful
  for measurements with very low relative error
- Define arrays of measurements and perform calculations with them.  Some linear
  algebra functions work out-of-the-box
- Propagate uncertainty for any function of real arguments (including functions
  based on `C/Fortran calls
  <http://docs.julialang.org/en/stable/manual/calling-c-and-fortran-code/>`__),
  using ``@uncertain`` `macro
  <http://docs.julialang.org/en/stable/manual/metaprogramming/>`__
- Function to get the derivative and the gradient of an expression with respect
  to one or more independent measurements
- Functions to calculate `standard score
  <https://en.wikipedia.org/wiki/Standard_score>`__ and `weighted mean
  <https://en.wikipedia.org/wiki/Weighted_arithmetic_mean>`__
- Parse strings to create measurement objects
- Easy way to attach the uncertainty to a number using the ``±`` sign as infix
  operator.  This syntactic sugar makes the code more readable and visually
  appealing
- Combined with external packages allows for error propagation of measurements
  with their `physical units
  <https://en.wikipedia.org/wiki/Units_of_measurement>`__
- Extensible in combination with external packages: you can propagate errors of
  measurements with their physical units, perform numerical integration with
  `QuadGK.jl <https://github.com/JuliaMath/QuadGK.jl>`__, numerical and
  automatic differentiation, and much more.

The method used to handle functional correlation is described in this paper:

.. [GIO16] M. Giordano, 2016, "Uncertainty propagation with functionally
	   correlated quantities", `arXiv:1610.08716
	   <http://arxiv.org/abs/1610.08716>`__ (Bibcode: `2016arXiv161008716G
	   <http://adsabs.harvard.edu/abs/2016arXiv161008716G>`__)

If you use use this package for your research, please cite it.

Other features are expected to come in the future, see the "How Can I Help?"
section and the TODO list.

The ``Measurements.jl`` package is licensed under the MIT "Expat" License. The
original author is Mosè Giordano.

.. toctree::
   :maxdepth: 2

   installation.rst
   usage.rst
   examples.rst
   performance.rst
   todo.rst
   appendix.rst
