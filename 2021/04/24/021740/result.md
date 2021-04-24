# Benchmark result

* Pull request commit: [`6d3da57ffceebb2839b4612bff494a65d68371df`](https://github.com/JuliaPhysics/Measurements.jl/commit/6d3da57ffceebb2839b4612bff494a65d68371df)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/104> (Add `Base.hash(::Measurement, ::UInt)` method)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 24 Apr 2021 - 02:15
    - Baseline: 24 Apr 2021 - 02:16
* Package commits:
    - Target: 37f91d
    - Baseline: cbda13
* Julia commits:
    - Target: f9720d
    - Baseline: f9720d
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
| `["base", "create"]`                 |                1.07 (5%) :x: |   1.00 (1%)  |
| `["quadgk", "int1"]`                 | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["specfun", "gamma"]`               |                1.09 (5%) :x: |   1.00 (1%)  |
| `["vector", "sin"]`                  | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sqrt"]`                 |                1.15 (5%) :x: |   1.00 (1%)  |

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
Julia Version 1.6.0
Commit f9720dc2eb (2021-03-24 12:55 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1046-azure #48-Ubuntu SMP Tue Apr 13 07:18:42 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz        486 s          2 s        115 s       4030 s          0 s
       #2  2294 MHz       2439 s          0 s        140 s       2075 s          0 s
       
  Memory: 6.791339874267578 GB (3724.72265625 MB free)
  Uptime: 469.0 sec
  Load Avg:  1.01  0.82  0.43
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

### Baseline
```
Julia Version 1.6.0
Commit f9720dc2eb (2021-03-24 12:55 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1046-azure #48-Ubuntu SMP Tue Apr 13 07:18:42 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       1360 s          2 s        130 s       4266 s          0 s
       #2  2294 MHz       2678 s          0 s        148 s       2950 s          0 s
       
  Memory: 6.791339874267578 GB (3774.87109375 MB free)
  Uptime: 582.0 sec
  Load Avg:  1.0  0.88  0.5
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 24 Apr 2021 - 2:15
* Package commit: 37f91d
* Julia commit: f9720d
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
| `["base", "create"]`                 |   9.309 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  40.969 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  24.699 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  23.896 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  40.607 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  18.100 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.520 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 540.923 ms (5%) | 10.311 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 123.154 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 660.736 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 678.634 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.280 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 974.907 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.862 s (5%) |  9.551 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 278.902 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 611.994 ms (5%) | 21.636 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 170.414 ms (5%) | 18.603 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 354.902 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.405 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 287.202 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 442.308 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 116.801 μs (5%) |           | 156.45 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.6.0
Commit f9720dc2eb (2021-03-24 12:55 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1046-azure #48-Ubuntu SMP Tue Apr 13 07:18:42 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz        486 s          2 s        115 s       4030 s          0 s
       #2  2294 MHz       2439 s          0 s        140 s       2075 s          0 s
       
  Memory: 6.791339874267578 GB (3724.72265625 MB free)
  Uptime: 469.0 sec
  Load Avg:  1.01  0.82  0.43
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-11.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 24 Apr 2021 - 2:16
* Package commit: cbda13
* Julia commit: f9720d
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
| `["base", "create"]`                 |   8.709 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  41.070 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  23.996 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  24.699 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  40.909 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  18.700 μs (5%) |           |   7.14 KiB (1%) |         326 |
| `["quadgk", "int1"]`                 |   1.660 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 535.774 ms (5%) |  9.832 ms | 139.07 MiB (1%) |     6666693 |
| `["specfun", "gamma"]`               | 112.901 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 663.196 ns (5%) |           |  720 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 690.084 ns (5%) |           |  768 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.320 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 995.307 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.795 s (5%) | 10.793 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 283.602 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 614.302 ms (5%) | 16.713 ms | 764.31 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 168.876 ms (5%) | 15.601 ms | 763.86 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 391.602 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.344 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 249.502 μs (5%) |           | 781.33 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 446.179 ms (5%) |           | 625.16 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 111.601 μs (5%) |           | 156.45 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.6.0
Commit f9720dc2eb (2021-03-24 12:55 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.2 LTS
  uname: Linux 5.4.0-1046-azure #48-Ubuntu SMP Tue Apr 13 07:18:42 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       1360 s          2 s        130 s       4266 s          0 s
       #2  2294 MHz       2678 s          0 s        148 s       2950 s          0 s
       
  Memory: 6.791339874267578 GB (3774.87109375 MB free)
  Uptime: 582.0 sec
  Load Avg:  1.0  0.88  0.5
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
    CPU MHz:                         2294.687
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

