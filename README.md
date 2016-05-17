# Measurements

[![Build Status](https://travis-ci.org/giordano/Measurements.jl.svg?branch=master)](https://travis-ci.org/giordano/Measurements.jl)

Introduction
------------

This package defines a new data type, `Measurement`, that allows you to enter a
quantity with its uncertainty and propagate errors when performing mathematical
operations involving `Measurement` objects.

Examples
--------

``` julia
using Measurements
a = Measurement(4.5, 0.1)
# => 4.5 ± 0.1
b = Measurement(3.8, 0.4)
# => 3.8 ± 0.4
2a + b
# => 12.8 ± 0.4472135954999579
a - 1.2b
# => -0.05999999999999961 ± 0.49030602688525043
l = Measurement(0.936, 1e-3);
T = Measurement(1.942, 4e-3);
P = 4pi^2*l/T^2
# => 9.797993213510699 ± 0.041697817535336676
c = Constant(4)
# => 4 ± 0
a*c
# => 18.0 ± 0.4
sind(Measurement(94, 1.2))
# => 0.9975640502598242 ± 0.0014609761696991563
```
