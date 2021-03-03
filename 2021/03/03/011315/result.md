# Benchmark result

* Pull request commit: [`fbc4499a01feeb0461e97d7e6154ba1f8aa9d0f4`](https://github.com/JuliaPhysics/Measurements.jl/commit/fbc4499a01feeb0461e97d7e6154ba1f8aa9d0f4)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/94> (Improve printing of value when smaller than error)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 3 Mar 2021 - 01:10
    - Baseline: 3 Mar 2021 - 01:12
* Package commits:
    - Target: 3c854d
    - Baseline: 8475ef
* Julia commits:
    - Target: a58bdd
    - Baseline: a58bdd
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
| `["vector", "gamma"]`                |                1.07 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all different"]` |                1.18 (5%) :x: |   1.00 (1%)  |
| `["vector", "sin"]`                  |                1.06 (5%) :x: |   1.00 (1%)  |
| `["vector", "sin²+cos²"]`            | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sqrt"]`                 |                1.05 (5%) :x: |   1.00 (1%)  |

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
Julia Version 1.6.0-rc1
Commit a58bdd9010 (2021-02-06 15:49 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.5 LTS
  uname: Linux 5.4.0-1039-azure #41~18.04.1-Ubuntu SMP Mon Jan 18 14:00:01 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz        391 s          0 s        109 s       2207 s          0 s
       #2  2095 MHz       2244 s          0 s        138 s        380 s          0 s
       
  Memory: 6.791393280029297 GB (3828.52734375 MB free)
  Uptime: 287.0 sec
  Load Avg:  1.02  0.79  0.37
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

### Baseline
```
Julia Version 1.6.0-rc1
Commit a58bdd9010 (2021-02-06 15:49 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.5 LTS
  uname: Linux 5.4.0-1039-azure #41~18.04.1-Ubuntu SMP Mon Jan 18 14:00:01 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz        534 s          0 s        115 s       3116 s          0 s
       #2  2095 MHz       3150 s          0 s        156 s        517 s          0 s
       
  Memory: 6.791393280029297 GB (3801.42578125 MB free)
  Uptime: 393.0 sec
  Load Avg:  1.08  0.87  0.45
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 3 Mar 2021 - 1:10
* Package commit: 3c854d
* Julia commit: a58bdd
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
| `["base", "create"]`                 |  10.010 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  47.322 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  27.639 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  28.544 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  47.119 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  20.600 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.740 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 512.907 ms (5%) |  9.063 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 166.935 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 791.099 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 780.208 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.810 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.160 ms (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.948 s (5%) |  8.593 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 315.907 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 629.663 ms (5%) | 14.742 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 124.530 ms (5%) | 13.666 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 421.608 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.421 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 344.108 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 407.326 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 125.803 μs (5%) |           | 156.45 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.6.0-rc1
Commit a58bdd9010 (2021-02-06 15:49 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.5 LTS
  uname: Linux 5.4.0-1039-azure #41~18.04.1-Ubuntu SMP Mon Jan 18 14:00:01 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz        391 s          0 s        109 s       2207 s          0 s
       #2  2095 MHz       2244 s          0 s        138 s        380 s          0 s
       
  Memory: 6.791393280029297 GB (3828.52734375 MB free)
  Uptime: 287.0 sec
  Load Avg:  1.02  0.79  0.37
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 3 Mar 2021 - 1:12
* Package commit: 8475ef
* Julia commit: a58bdd
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
| `["base", "create"]`                 |  10.010 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  46.006 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  27.940 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  28.040 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  46.309 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  20.600 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.750 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 517.494 ms (5%) |  8.548 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 167.065 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 753.465 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 788.129 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.810 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.089 ms (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.929 s (5%) |  7.788 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 310.503 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 534.648 ms (5%) | 11.527 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 120.295 ms (5%) | 10.739 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 395.903 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.542 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 327.003 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 408.402 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 126.202 μs (5%) |           | 156.45 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.6.0-rc1
Commit a58bdd9010 (2021-02-06 15:49 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.5 LTS
  uname: Linux 5.4.0-1039-azure #41~18.04.1-Ubuntu SMP Mon Jan 18 14:00:01 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz        534 s          0 s        115 s       3116 s          0 s
       #2  2095 MHz       3150 s          0 s        156 s        517 s          0 s
       
  Memory: 6.791393280029297 GB (3801.42578125 MB free)
  Uptime: 393.0 sec
  Load Avg:  1.08  0.87  0.45
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

---
# Runtime information
| Runtime Info | |
|:--|:--|
| BLAS #threads | 2 |
| `BLAS.vendor()` | `openblas64` |
| `Sys.CPU_THREADS` | 2 |

`lscpu` output:

    Architecture:        x86_64
    CPU op-mode(s):      32-bit, 64-bit
    Byte Order:          Little Endian
    CPU(s):              2
    On-line CPU(s) list: 0,1
    Thread(s) per core:  1
    Core(s) per socket:  2
    Socket(s):           1
    NUMA node(s):        1
    Vendor ID:           GenuineIntel
    CPU family:          6
    Model:               85
    Model name:          Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz
    Stepping:            4
    CPU MHz:             2095.076
    BogoMIPS:            4190.15
    Hypervisor vendor:   Microsoft
    Virtualization type: full
    L1d cache:           32K
    L1i cache:           32K
    L2 cache:            1024K
    L3 cache:            36608K
    NUMA node0 CPU(s):   0,1
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt avx512cd avx512bw avx512vl xsaveopt xsavec xsaves md_clear
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz           |
| Vendor             | :Intel                                                  |
| Architecture       | :Skylake                                                |
| Model              | Family: 0x06, Model: 0x55, Stepping: 0x04, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading detected                              |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 1024, 36608) kbytes                    |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 46 bits physical                       |
| SIMD               | 512 bit = 64 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

