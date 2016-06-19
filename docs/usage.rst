Usage
-----

After installing the package, you can start using it with

.. code-block:: julia

    using Measurements

The module defines a new ``Measurement`` data type. ``Measurement`` objects can
be created with the two following constructors:

.. code-block:: julia

    Measurement(value, uncertainty)
    value ± uncertainty

where

- ``value`` is the nominal value of the measurement
- ``uncertainty`` is its uncertainty, assumed to be a `standard deviation
  <https://en.wikipedia.org/wiki/Standard_deviation>`__.

They are both subtype of ``AbstractFloat``.  Some keyboard layouts provide an
easy way to type the ``±`` sign, if your does not, remember you can insert it in
Julia REPL with ``\pm`` followed by ``TAB`` key.  You can provide ``value`` and
``uncertainty`` of any subtype of ``Real`` that can be converted to
``AbstractFloat``.  Thus, ``Measurement(42, 33//12)`` and ``pi ± 0.1`` are
valid.

``Measurement(value)`` creates a ``Measurement`` object that doesn’t have
uncertainty, like mathematical constants. See below for further examples.

Every time you use one of the constructors above you define a *new independent*
measurement.  Instead, when you perform mathematical operations involving
``Measurement`` objects you create a quantity that is not independent, but
rather depends on really independent measurements.

Most mathematical operations are instructed, by `operator overloading
<https://en.wikipedia.org/wiki/Operator_overloading>`__, to accept
``Measurement`` type, and uncertainty is calculated exactly using analityc
expressions of functions’ derivatives.

In addition, it is possible to create a ``Complex`` measurement with
``complex(Measurement(a, b), Measurement(c, d))``.

Those interested in the technical details of the package, in order integrate the
package in their workflow, can have a look at the technical appendix.

Correlation Between Variables
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This package is able to handle `correlation
<https://en.wikipedia.org/wiki/Correlation_and_dependence>`__ between
variables. This means that uncertainty is correctly propagated also for
functions taking two or more arguments that are correlated, that is one is
derived from the other or both arguments are derived from a set of common
independent variables. As a result, ``x - x == zero(x)`` and ``x/x ==
one(x)``. Instead, two measurements that come from truly different measurements
and only by chance share the same nominal value and uncertainty are not treated
as correlated.

Propagate Uncertainty for Arbitrary Functions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Existing functions implemented exclusively in Julia that accept
``AbstractFloat`` arguments will work out-of-the-box with ``Measurement``
objects as long as they internally use functions already supported by this
package.  However, there are functions that take arguments that are specific
subtype of ``AbstractFloat``, or are implemented in such a way that does not
play nicely with ``Measurement`` variables.

The package provides the ``@uncertain`` macro that overcomes this limitation and
further extends the power of ``Measurements.jl``. This macro allows you to
propagate uncertainty in arbitrary real functions, including those based on
`C/Fortran calls
<http://docs.julialang.org/en/stable/manual/calling-c-and-fortran-code/>`__,
that accept one or two real arguments.  The macro exploits ``derivative`` and
``gradient`` functions from `Calculus
<https://github.com/johnmyleswhite/Calculus.jl>`__ package in order to perform
numerical differentiation.

Derivative and Gradient
~~~~~~~~~~~~~~~~~~~~~~~

In order to propagate the uncertainties, ``Measurements.jl`` keeps track of the
total derivative of an expression with respect to all independent measurements
from which the expression comes. For this reason, the package provides two
convenient functions, ``Measurements.derivative`` and ``Measurements.gradient``,
to get the total derivative and the gradient of an expression with respect to
independent measurements.

Standard Score
~~~~~~~~~~~~~~

The ``stdscore`` function is available to calculate the `standard score
<https://en.wikipedia.org/wiki/Standard_score>`__ between a measurement and its
expected value.

Weighted Average
~~~~~~~~~~~~~~~~

``weightedmean`` function gives the `weighted mean
<https://en.wikipedia.org/wiki/Weighted_arithmetic_mean>`__ of a set of
measurements using `inverses of variances as weights
<https://en.wikipedia.org/wiki/Inverse-variance_weighting>`__.  Use ``mean`` for
the simple arithmetic mean.

Caveat about ``±`` Sign
~~~~~~~~~~~~~~~~~~~~~~~

The ``±`` sign is a convenient symbol to define quantities with uncertainty, but
can lead to unexpected results if used in elaborate expressions involving many
``±``\ s. Use parantheses where appropriate to avoid confusion. See for example
the following cases:

.. code-block:: julia

    7.5±1.2 + 3.9±0.9 # This is wrong!
    # => 11.4 ± 1.2 ± 0.9 ± 0.0
    (7.5±1.2) + (3.9±0.9) # This is correct
    # => 11.4 ± 1.5
