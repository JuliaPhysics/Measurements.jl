using BenchmarkTools
using Measurements
using SpecialFunctions
using QuadGK

const SUITE = BenchmarkGroup()

const a = 12.3 ± 4.5
const b = 67.8 ± 9.0
const vector = [1 ± 0.1 for _ in 1:10000]

int1(x) = exp(x / a)

# A measurement depending on `k` distinct independent variables.
nvars(k, offset) = sum(measurement(float(i) + offset, inv(float(i))) for i in 1:k)

const coeffs = (1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0)

# The two groups below broadcast over vectors of distinct operands and write into a
# preallocated output.  A single operation here takes a few tens of nanoseconds, which
# is around the resolution of the system clock, so measuring one at a time only works
# while `evals` is tuned high enough; batching `nops` of them per sample keeps each
# timing three orders of magnitude clear of the clock and independent of the tuning
# recorded in `tune.json`.
const nops = 64
nvars_vec(k) = [nvars(k, j) for j in 1:nops]

const xs1 = nvars_vec(1)
const ys1 = nvars_vec(1)
const out1 = similar(xs1)

SUITE["base"] = BenchmarkGroup()
SUITE["scalar"] = BenchmarkGroup()
SUITE["nvars"] = BenchmarkGroup()
SUITE["uncertain"] = BenchmarkGroup()
SUITE["vector"] = BenchmarkGroup()
SUITE["specfun"] = BenchmarkGroup()
SUITE["quadgk"] = BenchmarkGroup()

SUITE["base"]["create"] = @benchmarkable 4.7 ± 0.3
SUITE["base"]["sum"] = @benchmarkable $(a) + $(b)
SUITE["base"]["multiplication"] = @benchmarkable $(a) * $(b)
SUITE["base"]["sqrt"] = @benchmarkable sqrt($(b))
SUITE["base"]["sin"] = @benchmarkable sqrt($(a))

# Scalar expressions over one or two variables.  These spend most of their time in
# `result`, so they are the shapes most sensitive to how uncertainty is accumulated,
# unlike the bulk `vector` benchmarks below where the `Derivatives` bookkeeping
# dominates.  `self division` and `self multiplication` also cover the correlated
# path, where both arguments carry the same tag.
SUITE["scalar"]["self division"] = @benchmarkable $(out1) .= $(xs1) ./ $(xs1)
SUITE["scalar"]["self multiplication"] = @benchmarkable $(out1) .= $(xs1) .* $(xs1)
SUITE["scalar"]["two variables"] = @benchmarkable $(out1) .= $(xs1) .* $(ys1) .+ $(xs1) ./ $(ys1)
# `evalpoly` on a tuple unrolls into `muladd`, so this also covers the three-argument
# `result` path that plain `*`/`+` never reaches.
SUITE["scalar"]["evalpoly - 8 coefficients"] = @benchmarkable $(out1) .= evalpoly.($(xs1), Ref($(coeffs)))

# Propagating uncertainty through a binary operation costs O(number of independent
# variables involved).  Sweep that count: the per-variable bookkeeping dominates past
# a handful, so the arithmetic in `result` is only visible at the low end -- which is
# also the common case of a formula combining a few measured quantities.  The large
# end is already covered by the `vector` group, whose operands carry 10000 variables.
for k in (1, 2, 4, 8)
    xk, yk = nvars_vec(k), nvars_vec(k)
    ok = similar(xk)
    SUITE["nvars"]["multiplication - $(k) variables"] = @benchmarkable $(ok) .= $(xk) .* $(yk)
    SUITE["nvars"]["division - $(k) variables"] = @benchmarkable $(ok) .= $(xk) ./ $(yk)
end

SUITE["uncertain"]["zeta"] = @benchmarkable @uncertain zeta($(2 ± 0.13))
SUITE["uncertain"]["log"] = @benchmarkable @uncertain log($(9.4 ± 1.3), $(58.8 ± 3.7))
SUITE["uncertain"]["atan"] = @benchmarkable @uncertain atan($(10), $(13.5 ± 0.8))

SUITE["vector"]["sqrt"] = @benchmarkable sqrt.($(vector))
SUITE["vector"]["sin"] = @benchmarkable sin.($(vector))
SUITE["vector"]["gamma"] = @benchmarkable gamma.($(vector))
SUITE["vector"]["sin²+cos²"] = @benchmarkable cos.($(vector)) .^ 2 .+ sin.($(vector)) .^ 2
SUITE["vector"]["sum - all different"] = @benchmarkable sum($(vector))
SUITE["vector"]["mean - all different"] = @benchmarkable mean($(vector))
SUITE["vector"]["prod - all different"] = @benchmarkable prod($(vector))
SUITE["vector"]["sum - all equal"] = @benchmarkable sum(v) setup = (x = 1 ± 0.1; v = [x for _ in eachindex(vector)])
SUITE["vector"]["mean - all equal"] = @benchmarkable mean(v) setup = (x = 1 ± 0.1; v = [x for _ in eachindex(vector)])
SUITE["vector"]["prod - all equal"] = @benchmarkable prod(v) setup = (x = 1 ± 0.1; v = [x for _ in eachindex(vector)])

SUITE["specfun"]["gamma"] = @benchmarkable gamma($(a))

SUITE["quadgk"]["int1"] = @benchmarkable quadgk(int1, 1, 7)
SUITE["quadgk"]["cos"] = @benchmarkable quadgk(cos, $(a), $(b))
SUITE["quadgk"]["sin"] = @benchmarkable quadgk(sin, $(-a), $(a))
