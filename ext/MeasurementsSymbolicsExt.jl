### MeasurementsSymbolicsExt.jl
#
# Copyright (C) 2023 Roman Lebedev.
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
# This file contains integration with Symbolics.jl.
#
### Code:

### Symbolics
module MeasurementsSymbolicsExt

import Measurements
import Symbolics

Measurements._is_symbolic(::Symbolics.Num) = true

Measurements.measurement(val::Symbolics.Num) = Measurements._measurement(val)

Measurements.measurement(val::Symbolics.Num, err::Symbolics.Num) = Measurements._measurement(val, err)

end
