Performance
-----------

``Measurements.jl`` strives to be as fast as possible.  These are the benchmark
results obtained with the `BenchmarkTools.jl
<https://github.com/JuliaCI/BenchmarkTools.jl>`__ suite on a system equipped
with an Intel(R) Core(TM) i7-4700MQ CPU.

.. code-block:: julia

   using BenchmarkTools

   # Creation of a `Measurement` object
   julia> @benchmark 4.7 ± 0.3
   BenchmarkTools.Trial:
     samples:          10000
     evals/sample:     996
     time tolerance:   5.00%
     memory tolerance: 1.00%
     memory estimate:  144.00 bytes
     allocs estimate:  3
     minimum time:     24.00 ns (0.00% GC)
     median time:      30.00 ns (0.00% GC)
     mean time:        36.13 ns (16.00% GC)
     maximum time:     1.53 μs (96.21% GC)

   # Sum of two `Measurement` objects
   julia> a = 12.3 ± 4.5; b = 67.8 ± 9.0;

   julia> @benchmark a + b
   BenchmarkTools.Trial:
     samples:          10000
     evals/sample:     199
     time tolerance:   5.00%
     memory tolerance: 1.00%
     memory estimate:  624.00 bytes
     allocs estimate:  15
     minimum time:     424.00 ns (0.00% GC)
     median time:      433.00 ns (0.00% GC)
     mean time:        504.87 ns (12.33% GC)
     maximum time:     14.03 μs (95.58% GC)

   # One-argument functions, where functional
   # correlation is not a concern, are even faster
   julia> @benchmark sqrt(b)
   BenchmarkTools.Trial:
     samples:          10000
     evals/sample:     947
     time tolerance:   5.00%
     memory tolerance: 1.00%
     memory estimate:  96.00 bytes
     allocs estimate:  2
     minimum time:     97.00 ns (0.00% GC)
     median time:      99.00 ns (0.00% GC)
     mean time:        106.15 ns (5.12% GC)
     maximum time:     1.79 μs (93.36% GC)

   julia> @benchmark sin(a)
   BenchmarkTools.Trial:
     samples:          10000
     evals/sample:     891
     time tolerance:   5.00%
     memory tolerance: 1.00%
     memory estimate:  96.00 bytes
     allocs estimate:  2
     minimum time:     127.00 ns (0.00% GC)
     median time:      129.00 ns (0.00% GC)
     mean time:        135.90 ns (4.06% GC)
     maximum time:     2.00 μs (91.82% GC)

   julia> @benchmark gamma(a)
   BenchmarkTools.Trial:
     samples:          10000
     evals/sample:     570
     time tolerance:   5.00%
     memory tolerance: 1.00%
     memory estimate:  96.00 bytes
     allocs estimate:  2
     minimum time:     205.00 ns (0.00% GC)
     median time:      206.00 ns (0.00% GC)
     mean time:        219.57 ns (4.57% GC)
     maximum time:     5.31 μs (95.05% GC)

   # Vectorial functions take an almost linear time
   julia> vector = [rand() ± 0.1rand() for _ in 1:10000];

   julia> @benchmark sqrt.(vector)
   BenchmarkTools.Trial:
     samples:          2322
     evals/sample:     1
     time tolerance:   5.00%
     memory tolerance: 1.00%
     memory estimate:  2.37 mb
     allocs estimate:  50027
     minimum time:     1.76 ms (0.00% GC)
     median time:      1.84 ms (0.00% GC)
     mean time:        2.15 ms (13.57% GC)
     maximum time:     5.47 ms (58.76% GC)

   julia> @benchmark sin.(vector)
   BenchmarkTools.Trial:
     samples:          2238
     evals/sample:     1
     time tolerance:   5.00%
     memory tolerance: 1.00%
     memory estimate:  2.37 mb
     allocs estimate:  50027
     minimum time:     1.80 ms (0.00% GC)
     median time:      1.89 ms (0.00% GC)
     mean time:        2.23 ms (14.65% GC)
     maximum time:     5.59 ms (64.94% GC)

   julia> @benchmark gamma.(vector)
   BenchmarkTools.Trial:
     samples:          1656
     evals/sample:     1
     time tolerance:   5.00%
     memory tolerance: 1.00%
     memory estimate:  2.37 mb
     allocs estimate:  50027
     minimum time:     2.64 ms (0.00% GC)
     median time:      2.71 ms (0.00% GC)
     mean time:        3.02 ms (9.44% GC)
     maximum time:     6.58 ms (43.25% GC)
