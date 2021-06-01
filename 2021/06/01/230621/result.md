# Benchmark result

* Pull request commit: [`cf9489203bd5b23e3dfd02ebc319ae5a1875a6b0`](https://github.com/JuliaPhysics/Measurements.jl/commit/cf9489203bd5b23e3dfd02ebc319ae5a1875a6b0)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/106> (Don't print output of `at-printf` and actually test it)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 1 Jun 2021 - 23:03
    - Baseline: 1 Jun 2021 - 23:05
* Package commits:
    - Target: f9cdce
    - Baseline: 713041
* Julia commits:
    - Target: 6aaede
    - Baseline: 6aaede
* Julia command flags:
    - Target: None
    - Baseline: None
* Environment variables:
    - Target: None
    - Baseline: None

## Results
A ratio greater than `1.0` denotes a possible regression (marked with :x:), while a ratio less
than `1.0` denotes a possible improvement (marked with :white_check_mark:). Only significant results - results
that indicate possible regressions or improvements - are shown below (thus, an empty table means that all
benchmark results remained invariant between builds).

| ID                                   | time ratio                   | memory ratio |
|--------------------------------------|------------------------------|--------------|
| `["base", "multiplication"]`         | 0.73 (5%) :white_check_mark: |   1.00 (1%)  |
| `["base", "sin"]`                    | 0.77 (5%) :white_check_mark: |   1.00 (1%)  |
| `["base", "sqrt"]`                   |                1.07 (5%) :x: |   1.00 (1%)  |
| `["base", "sum"]`                    | 0.80 (5%) :white_check_mark: |   1.00 (1%)  |
| `["quadgk", "cos"]`                  |                1.06 (5%) :x: |   1.00 (1%)  |
| `["quadgk", "int1"]`                 |                1.07 (5%) :x: |   1.00 (1%)  |
| `["specfun", "gamma"]`               | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["uncertain", "atan"]`              | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["uncertain", "zeta"]`              |                1.05 (5%) :x: |   1.00 (1%)  |
| `["vector", "mean - all equal"]`     |                1.08 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all different"]` |                1.08 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all equal"]`     |                1.12 (5%) :x: |   1.00 (1%)  |
| `["vector", "sin"]`                  |                1.05 (5%) :x: |   1.00 (1%)  |
| `["vector", "sin²+cos²"]`            |                1.08 (5%) :x: |   1.00 (1%)  |
| `["vector", "sqrt"]`                 |                1.22 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  |                1.17 (5%) :x: |   1.00 (1%)  |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo

### Target
```
Julia Version 1.6.1
Commit 6aaedecc44 (2021-04-23 05:59 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1047-azure #49-Ubuntu SMP Thu Apr 22 14:30:37 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz        524 s          2 s        115 s       2256 s          0 s
       #2  2294 MHz       2211 s          0 s        144 s        544 s          0 s
       
  Memory: 6.791339874267578 GB (3622.49609375 MB free)
  Uptime: 295.0 sec
  Load Avg:  1.04  0.8  0.37
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

### Baseline
```
Julia Version 1.6.1
Commit 6aaedecc44 (2021-04-23 05:59 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1047-azure #49-Ubuntu SMP Thu Apr 22 14:30:37 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       1522 s          2 s        131 s       2322 s          0 s
       #2  2294 MHz       2283 s          0 s        148 s       1548 s          0 s
       
  Memory: 6.791339874267578 GB (3663.55859375 MB free)
  Uptime: 403.0 sec
  Load Avg:  1.0  0.87  0.45
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 1 Jun 2021 - 23:3
* Package commit: f9cdce
* Julia commit: 6aaede
* Julia command flags: None
* Environment variables: None

## Results
Below is a table of this job's results, obtained by running the benchmarks.
The values listed in the `ID` column have the structure `[parent_group, child_group, ..., key]`, and can be used to
index into the BaseBenchmarks suite to retrieve the corresponding benchmarks.
The percentages accompanying time and memory values in the below table are noise tolerances. The "true"
time/memory value for a given benchmark is expected to fall within this percentage of the reported value.
An empty cell means that the value was zero.

| ID                                   | time            | GC time   | memory          | allocations |
|--------------------------------------|----------------:|----------:|----------------:|------------:|
| `["base", "create"]`                 |   8.700 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  38.306 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  25.904 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  25.327 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  39.617 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  17.200 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.490 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 498.325 ms (5%) | 12.479 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 106.452 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 567.588 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 556.290 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.160 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 903.806 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.553 s (5%) | 11.874 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 263.501 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 672.079 ms (5%) | 25.088 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 191.213 ms (5%) | 24.100 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 360.502 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.221 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 279.702 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 502.182 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 113.200 μs (5%) |           | 156.45 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.6.1
Commit 6aaedecc44 (2021-04-23 05:59 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1047-azure #49-Ubuntu SMP Thu Apr 22 14:30:37 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz        524 s          2 s        115 s       2256 s          0 s
       #2  2294 MHz       2211 s          0 s        144 s        544 s          0 s
       
  Memory: 6.791339874267578 GB (3622.49609375 MB free)
  Uptime: 295.0 sec
  Load Avg:  1.04  0.8  0.37
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 1 Jun 2021 - 23:5
* Package commit: 713041
* Julia commit: 6aaede
* Julia command flags: None
* Environment variables: None

## Results
Below is a table of this job's results, obtained by running the benchmarks.
The values listed in the `ID` column have the structure `[parent_group, child_group, ..., key]`, and can be used to
index into the BaseBenchmarks suite to retrieve the corresponding benchmarks.
The percentages accompanying time and memory values in the below table are noise tolerances. The "true"
time/memory value for a given benchmark is expected to fall within this percentage of the reported value.
An empty cell means that the value was zero.

| ID                                   | time            | GC time   | memory          | allocations |
|--------------------------------------|----------------:|----------:|----------------:|------------:|
| `["base", "create"]`                 |   8.400 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  52.319 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  33.534 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  23.618 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  49.698 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  16.300 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.390 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 502.598 ms (5%) | 10.905 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 115.591 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 600.005 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 564.486 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.100 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 867.606 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.484 s (5%) | 11.053 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 244.802 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 621.858 ms (5%) | 21.636 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 171.014 ms (5%) | 17.401 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 342.502 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.133 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 229.202 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 430.659 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 112.601 μs (5%) |           | 156.45 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.6.1
Commit 6aaedecc44 (2021-04-23 05:59 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1047-azure #49-Ubuntu SMP Thu Apr 22 14:30:37 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       1522 s          2 s        131 s       2322 s          0 s
       #2  2294 MHz       2283 s          0 s        148 s       1548 s          0 s
       
  Memory: 6.791339874267578 GB (3663.55859375 MB free)
  Uptime: 403.0 sec
  Load Avg:  1.0  0.87  0.45
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

---
# Runtime information
| Runtime Info | |
|:--|:--|
| BLAS #threads | 2 |
| `BLAS.vendor()` | `openblas64` |
| `Sys.CPU_THREADS` | 2 |

`lscpu` output:

    Architecture:                    x86_64
    CPU op-mode(s):                  32-bit, 64-bit
    Byte Order:                      Little Endian
    Address sizes:                   46 bits physical, 48 bits virtual
    CPU(s):                          2
    On-line CPU(s) list:             0,1
    Thread(s) per core:              1
    Core(s) per socket:              2
    Socket(s):                       1
    NUMA node(s):                    1
    Vendor ID:                       GenuineIntel
    CPU family:                      6
    Model:                           79
    Model name:                      Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz
    Stepping:                        1
    CPU MHz:                         2294.685
    BogoMIPS:                        4589.37
    Hypervisor vendor:               Microsoft
    Virtualization type:             full
    L1d cache:                       64 KiB
    L1i cache:                       64 KiB
    L2 cache:                        512 KiB
    L3 cache:                        50 MiB
    NUMA node0 CPU(s):               0,1
    Vulnerability Itlb multihit:     KVM: Vulnerable
    Vulnerability L1tf:              Mitigation; PTE Inversion
    Vulnerability Mds:               Mitigation; Clear CPU buffers; SMT Host state unknown
    Vulnerability Meltdown:          Mitigation; PTI
    Vulnerability Spec store bypass: Vulnerable
    Vulnerability Spectre v1:        Mitigation; usercopy/swapgs barriers and __user pointer sanitization
    Vulnerability Spectre v2:        Mitigation; Full generic retpoline, STIBP disabled, RSB filling
    Vulnerability Srbds:             Not affected
    Vulnerability Tsx async abort:   Mitigation; Clear CPU buffers; SMT Host state unknown
    Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm rdseed adx smap xsaveopt md_clear
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz               |
| Vendor             | :Intel                                                  |
| Architecture       | :Broadwell                                              |
| Model              | Family: 0x06, Model: 0x4f, Stepping: 0x01, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading hardware capability detected          |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 256, 51200) kbytes                     |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 46 bits physical                       |
| SIMD               | 256 bit = 32 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

