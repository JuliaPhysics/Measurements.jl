# Benchmark result

* Pull request commit: [`48cd886ba8bd2e4481b9b20da61bfa0237cd424c`](https://github.com/JuliaPhysics/Measurements.jl/commit/48cd886ba8bd2e4481b9b20da61bfa0237cd424c)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/82> (Switch to FiniteDifferences for `@uncertain`)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 23 Feb 2021 - 23:59
    - Baseline: 24 Feb 2021 - 00:00
* Package commits:
    - Target: ef8432
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

| ID                           | time ratio                   | memory ratio   |
|------------------------------|------------------------------|----------------|
| `["base", "create"]`         | 0.88 (5%) :white_check_mark: |     1.00 (1%)  |
| `["base", "sin"]`            | 0.94 (5%) :white_check_mark: |     1.00 (1%)  |
| `["base", "sum"]`            | 0.95 (5%) :white_check_mark: |     1.00 (1%)  |
| `["quadgk", "int1"]`         |                1.08 (5%) :x: |     1.00 (1%)  |
| `["quadgk", "sin"]`          |                1.09 (5%) :x: |     1.00 (1%)  |
| `["uncertain", "atan"]`      |               33.60 (5%) :x: | 27.09 (1%) :x: |
| `["uncertain", "log"]`       |               31.20 (5%) :x: | 25.46 (1%) :x: |
| `["uncertain", "zeta"]`      |                9.55 (5%) :x: | 69.67 (1%) :x: |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       1656 s          0 s        123 s        506 s          0 s
       #2  2294 MHz        462 s          0 s        122 s       1689 s          0 s
       
  Memory: 6.791393280029297 GB (3710.32421875 MB free)
  Uptime: 242.0 sec
  Load Avg:  1.1  0.83  0.37
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

### Baseline
```
Julia Version 1.6.0-rc1
Commit a58bdd9010 (2021-02-06 15:49 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 18.04.5 LTS
  uname: Linux 5.4.0-1039-azure #41~18.04.1-Ubuntu SMP Mon Jan 18 14:00:01 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       1724 s          0 s        128 s       1130 s          0 s
       #2  2294 MHz       1085 s          0 s        133 s       1752 s          0 s
       
  Memory: 6.791393280029297 GB (3830.49609375 MB free)
  Uptime: 312.0 sec
  Load Avg:  1.03  0.87  0.42
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 23 Feb 2021 - 23:59
* Package commit: ef8432
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

| ID                           | time            | GC time   | memory          | allocations |
|------------------------------|----------------:|----------:|----------------:|------------:|
| `["base", "create"]`         |   7.708 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]` |  34.747 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`            |  20.582 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`           |  22.714 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`            |  34.813 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`          |  14.801 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`         |   1.430 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`          | 457.309 ms (5%) | 33.290 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`       | 103.950 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`      |  16.800 μs (5%) |           |  19.05 KiB (1%) |         260 |
| `["uncertain", "log"]`       |  15.601 μs (5%) |           |  19.09 KiB (1%) |         261 |
| `["uncertain", "zeta"]`      |  10.500 μs (5%) |           |   3.27 KiB (1%) |          55 |
| `["vector", "gamma"]`        | 815.514 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin"]`          | 303.705 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`    |   1.098 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`         | 228.304 μs (5%) |           | 781.33 KiB (1%) |       10002 |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       1656 s          0 s        123 s        506 s          0 s
       #2  2294 MHz        462 s          0 s        122 s       1689 s          0 s
       
  Memory: 6.791393280029297 GB (3710.32421875 MB free)
  Uptime: 242.0 sec
  Load Avg:  1.1  0.83  0.37
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 24 Feb 2021 - 0:0
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
| `["base", "create"]`         |   8.809 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "multiplication"]` |  36.061 ns (5%) |          |   96 bytes (1%) |           2 |
| `["base", "sin"]`            |  21.988 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`           |  21.809 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sum"]`            |  36.832 ns (5%) |          |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`          |  14.700 μs (5%) |          |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`         |   1.330 μs (5%) |          |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`          | 418.585 ms (5%) | 9.200 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`       | 107.563 ns (5%) |          |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`      | 500.000 ns (5%) |          |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`       | 500.000 ns (5%) |          |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`      |   1.100 μs (5%) |          |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`        | 808.506 μs (5%) |          | 781.33 KiB (1%) |       10002 |
| `["vector", "sin"]`          | 299.602 μs (5%) |          | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`    |   1.106 ms (5%) |          |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`         | 223.702 μs (5%) |          | 781.33 KiB (1%) |       10002 |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       1724 s          0 s        128 s       1130 s          0 s
       #2  2294 MHz       1085 s          0 s        133 s       1752 s          0 s
       
  Memory: 6.791393280029297 GB (3830.49609375 MB free)
  Uptime: 312.0 sec
  Load Avg:  1.03  0.87  0.42
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
    Model:               79
    Model name:          Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz
    Stepping:            1
    CPU MHz:             2294.687
    BogoMIPS:            4589.37
    Hypervisor vendor:   Microsoft
    Virtualization type: full
    L1d cache:           32K
    L1i cache:           32K
    L2 cache:            256K
    L3 cache:            51200K
    NUMA node0 CPU(s):   0,1
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm rdseed adx smap xsaveopt md_clear
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz               |
| Vendor             | :Intel                                                  |
| Architecture       | :Broadwell                                              |
| Model              | Family: 0x06, Model: 0x4f, Stepping: 0x01, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading detected                              |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 256, 51200) kbytes                     |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 46 bits physical                       |
| SIMD               | 256 bit = 32 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

