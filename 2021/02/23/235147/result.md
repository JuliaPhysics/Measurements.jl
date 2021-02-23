# Benchmark result

* Pull request commit: [`9f61b3867caa5212d539e7d569d72bf6eebcfbe4`](https://github.com/JuliaPhysics/Measurements.jl/commit/9f61b3867caa5212d539e7d569d72bf6eebcfbe4)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/82> (Switch to FiniteDifferences for `@uncertain`)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 23 Feb 2021 - 23:50
    - Baseline: 23 Feb 2021 - 23:51
* Package commits:
    - Target: b971da
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
| `["base", "multiplication"]` |                1.18 (5%) :x: |     1.00 (1%)  |
| `["base", "sin"]`            |                1.18 (5%) :x: |     1.00 (1%)  |
| `["base", "sqrt"]`           | 0.87 (5%) :white_check_mark: |     1.00 (1%)  |
| `["quadgk", "cos"]`          | 0.76 (5%) :white_check_mark: |     1.00 (1%)  |
| `["quadgk", "int1"]`         | 0.77 (5%) :white_check_mark: |     1.00 (1%)  |
| `["quadgk", "sin"]`          | 0.87 (5%) :white_check_mark: |     1.00 (1%)  |
| `["uncertain", "atan"]`      |               19.00 (5%) :x: | 19.22 (1%) :x: |
| `["uncertain", "log"]`       |               16.88 (5%) :x: | 17.83 (1%) :x: |
| `["uncertain", "zeta"]`      |                5.82 (5%) :x: | 37.33 (1%) :x: |
| `["vector", "sin"]`          |                1.06 (5%) :x: |     1.00 (1%)  |
| `["vector", "sin²+cos²"]`    |                1.13 (5%) :x: |     1.00 (1%)  |

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
       #1  2095 MHz        704 s          0 s        104 s       1397 s          0 s
       #2  2095 MHz       1290 s          0 s        136 s        793 s          0 s
       
  Memory: 6.791393280029297 GB (3850.7890625 MB free)
  Uptime: 236.0 sec
  Load Avg:  1.09  0.77  0.34
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
       #1  2095 MHz       1324 s          0 s        115 s       1469 s          0 s
       #2  2095 MHz       1366 s          0 s        141 s       1413 s          0 s
       
  Memory: 6.791393280029297 GB (3847.453125 MB free)
  Uptime: 306.0 sec
  Load Avg:  1.03  0.82  0.39
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 23 Feb 2021 - 23:50
* Package commit: b971da
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
| `["base", "create"]`         |   8.900 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]` |  38.789 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`            |  22.916 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`           |  19.698 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`            |  34.849 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`          |  16.900 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`         |   1.270 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`          | 514.300 ms (5%) | 10.017 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`       | 116.976 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`      |  13.300 μs (5%) |           |  13.52 KiB (1%) |         322 |
| `["uncertain", "log"]`       |  13.500 μs (5%) |           |  13.38 KiB (1%) |         317 |
| `["uncertain", "zeta"]`      |   8.534 μs (5%) |           |   1.75 KiB (1%) |          75 |
| `["vector", "gamma"]`        | 847.705 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin"]`          | 332.108 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`    |   1.252 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`         | 256.001 μs (5%) |           | 781.33 KiB (1%) |       10002 |

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
       #1  2095 MHz        704 s          0 s        104 s       1397 s          0 s
       #2  2095 MHz       1290 s          0 s        136 s        793 s          0 s
       
  Memory: 6.791393280029297 GB (3850.7890625 MB free)
  Uptime: 236.0 sec
  Load Avg:  1.09  0.77  0.34
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, skylake-avx512)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 23 Feb 2021 - 23:51
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
| `["base", "create"]`         |   8.700 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "multiplication"]` |  32.930 ns (5%) |          |   96 bytes (1%) |           2 |
| `["base", "sin"]`            |  19.497 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`           |  22.614 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sum"]`            |  34.949 ns (5%) |          |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`          |  22.200 μs (5%) |          |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`         |   1.640 μs (5%) |          |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`          | 587.851 ms (5%) | 8.820 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`       | 115.988 ns (5%) |          |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`      | 700.000 ns (5%) |          |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`       | 800.000 ns (5%) |          |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`      |   1.467 μs (5%) |          |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`        | 827.011 μs (5%) |          | 781.33 KiB (1%) |       10002 |
| `["vector", "sin"]`          | 312.204 μs (5%) |          | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`    |   1.111 ms (5%) |          |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`         | 250.803 μs (5%) |          | 781.33 KiB (1%) |       10002 |

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
       #1  2095 MHz       1324 s          0 s        115 s       1469 s          0 s
       #2  2095 MHz       1366 s          0 s        141 s       1413 s          0 s
       
  Memory: 6.791393280029297 GB (3847.453125 MB free)
  Uptime: 306.0 sec
  Load Avg:  1.03  0.82  0.39
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
    CPU MHz:             2095.078
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

