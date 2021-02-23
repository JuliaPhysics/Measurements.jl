using BenchmarkTools
using Measurements
using SpecialFunctions
using QuadGK

const SUITE = BenchmarkGroup()

const a = 12.3 ± 4.5
const b = 67.8 ± 9.0
const vector = [1 ± 0.1 for _ in 1:10000]

int1(x) = exp(x / a)

SUITE["base"] = BenchmarkGroup()
SUITE["uncertain"] = BenchmarkGroup()
SUITE["vector"] = BenchmarkGroup()
SUITE["specfun"] = BenchmarkGroup()
SUITE["quadgk"] = BenchmarkGroup()

SUITE["base"]["create"] = @benchmarkable 4.7 ± 0.3
SUITE["base"]["sum"] = @benchmarkable $(a) + $(b)
SUITE["base"]["multiplication"] = @benchmarkable $(a) * $(b)
SUITE["base"]["sqrt"] = @benchmarkable sqrt($(b))
SUITE["base"]["sin"] = @benchmarkable sqrt($(a))

SUITE["uncertain"]["zeta"] = @benchmarkable @uncertain zeta($(2 ± 0.13))
SUITE["uncertain"]["log"] = @benchmarkable @uncertain log($(9.4 ± 1.3), $(58.8 ± 3.7))
SUITE["uncertain"]["atan"] = @benchmarkable @uncertain atan($(10), $(13.5 ± 0.8))

SUITE["vector"]["sqrt"] = @benchmarkable sqrt.($(vector))
SUITE["vector"]["sin"] = @benchmarkable sin.($(vector))
SUITE["vector"]["gamma"] = @benchmarkable gamma.($(vector))
SUITE["vector"]["sin²+cos²"] = @benchmarkable cos.($(vector)) .^ 2 .+ sin.($(vector)) .^ 2

SUITE["specfun"]["gamma"] = @benchmarkable gamma($(a))

SUITE["quadgk"]["int1"] = @benchmarkable quadgk(int1, 1, 7)
SUITE["quadgk"]["cos"] = @benchmarkable quadgk(cos, $(a), $(b))
SUITE["quadgk"]["sin"] = @benchmarkable quadgk(sin, $(-a), $(a))
