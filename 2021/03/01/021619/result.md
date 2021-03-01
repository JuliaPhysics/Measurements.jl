# Benchmark result

* Pull request commit: [`7009e484832ea114a3d985b2a0eb160afca9173d`](https://github.com/JuliaPhysics/Measurements.jl/commit/7009e484832ea114a3d985b2a0eb160afca9173d)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/93> (Add more vector benchmarks)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 1 Mar 2021 - 02:14
    - Baseline: 1 Mar 2021 - 02:15
* Package commits:
    - Target: 642f6b
    - Baseline: e18b75
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

| ID                           | time ratio | memory ratio |
|------------------------------|------------|--------------|

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
       #1  2095 MHz        716 s          0 s        121 s       2089 s          0 s
       #2  2095 MHz       2038 s          0 s        151 s        798 s          0 s
       
  Memory: 6.791393280029297 GB (3836.5390625 MB free)
  Uptime: 310.0 sec
  Load Avg:  1.06  0.86  0.41
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
       #1  2095 MHz       1395 s          0 s        136 s       2127 s          0 s
       #2  2095 MHz       2081 s          0 s        156 s       1478 s          0 s
       
  Memory: 6.791393280029297 GB (3899.609375 MB free)
  Uptime: 384.0 sec
  Load Avg:  1.02  0.89  0.46
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 1 Mar 2021 - 2:14
* Package commit: 642f6b
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
| `["base", "create"]`                 |  10.011 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  46.716 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  28.041 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  28.041 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  46.918 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  23.400 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.770 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 586.047 ms (5%) |  9.131 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 167.022 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 783.196 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 795.811 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.810 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.165 ms (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.958 s (5%) |  8.834 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 335.414 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 553.365 ms (5%) | 17.619 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 128.854 ms (5%) | 15.802 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 412.615 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.563 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 345.815 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 416.961 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 133.806 μs (5%) |           | 156.45 KiB (1%) |           5 |

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
       #1  2095 MHz        716 s          0 s        121 s       2089 s          0 s
       #2  2095 MHz       2038 s          0 s        151 s        798 s          0 s
       
  Memory: 6.791393280029297 GB (3836.5390625 MB free)
  Uptime: 310.0 sec
  Load Avg:  1.06  0.86  0.41
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 1 Mar 2021 - 2:15
* Package commit: e18b75
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

| ID                           | time            | GC time  | memory          | allocations |
|------------------------------|----------------:|---------:|----------------:|------------:|
| `["base", "create"]`         |  10.210 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "multiplication"]` |  48.030 ns (5%) |          |   96 bytes (1%) |           2 |
| `["base", "sin"]`            |  27.941 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`           |  28.543 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sum"]`            |  47.726 ns (5%) |          |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`          |  23.201 μs (5%) |          |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`         |   1.750 μs (5%) |          |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`          | 579.854 ms (5%) | 8.110 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`       | 167.279 ns (5%) |          |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`      | 788.804 ns (5%) |          |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`       | 789.484 ns (5%) |          |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`      |   1.810 μs (5%) |          |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`        |   1.169 ms (5%) |          | 781.33 KiB (1%) |       10002 |
| `["vector", "sin"]`          | 427.709 μs (5%) |          | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`    |   1.504 ms (5%) |          |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`         | 341.508 μs (5%) |          | 781.33 KiB (1%) |       10002 |

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
       #1  2095 MHz       1395 s          0 s        136 s       2127 s          0 s
       #2  2095 MHz       2081 s          0 s        156 s       1478 s          0 s
       
  Memory: 6.791393280029297 GB (3899.609375 MB free)
  Uptime: 384.0 sec
  Load Avg:  1.02  0.89  0.46
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
    CPU MHz:             2095.198
    BogoMIPS:            4190.39
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

