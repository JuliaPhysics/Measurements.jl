# Benchmark result

* Pull request commit: [`55317f22cc04d1c736a0f420fbd546432d6b6843`](https://github.com/JuliaPhysics/Measurements.jl/commit/55317f22cc04d1c736a0f420fbd546432d6b6843)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/141> ([GHA] Switch to `codecov/codecov-action`)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 7 Feb 2024 - 17:01
    - Baseline: 7 Feb 2024 - 17:02
* Package commits:
    - Target: ecc522
    - Baseline: 02540d
* Julia commits:
    - Target: 17cfb8
    - Baseline: 17cfb8
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
| `["base", "sin"]`                    |                1.09 (5%) :x: |   1.00 (1%)  |
| `["vector", "sin²+cos²"]`            | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |

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
Julia Version 1.8.5
Commit 17cfb8e65ea (2023-01-08 06:45 UTC)
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 22.04.3 LTS
  uname: Linux 6.2.0-1019-azure #19~22.04.1-Ubuntu SMP Wed Jan 10 22:57:03 UTC 2024 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1  3244 MHz        973 s          0 s         59 s       1844 s          0 s
       #2  2445 MHz        512 s          0 s         69 s       2279 s          0 s
       #3  2600 MHz        342 s          0 s         64 s       2462 s          0 s
       #4  2547 MHz        453 s          0 s         72 s       2344 s          0 s
  Memory: 15.60690689086914 GB (13702.3203125 MB free)
  Uptime: 289.91 sec
  Load Avg:  1.0  0.58  0.24
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, znver3)
  Threads: 1 on 4 virtual cores
```

### Baseline
```
Julia Version 1.8.5
Commit 17cfb8e65ea (2023-01-08 06:45 UTC)
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 22.04.3 LTS
  uname: Linux 6.2.0-1019-azure #19~22.04.1-Ubuntu SMP Wed Jan 10 22:57:03 UTC 2024 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1  2602 MHz       1095 s          0 s         65 s       2492 s          0 s
       #2  2445 MHz        625 s          0 s         73 s       2938 s          0 s
       #3  2445 MHz        680 s          0 s         70 s       2894 s          0 s
       #4  3243 MHz        648 s          0 s         86 s       2912 s          0 s
  Memory: 15.60690689086914 GB (13793.59375 MB free)
  Uptime: 367.66 sec
  Load Avg:  1.0  0.68  0.31
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, znver3)
  Threads: 1 on 4 virtual cores
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 7 Feb 2024 - 17:1
* Package commit: ecc522
* Julia commit: 17cfb8
* Julia command flags: None
* Environment variables: None

## Results
Below is a table of this job's results, obtained by running the benchmarks.
The values listed in the `ID` column have the structure `[parent_group, child_group, ..., key]`, and can be used to
index into the BaseBenchmarks suite to retrieve the corresponding benchmarks.
The percentages accompanying time and memory values in the below table are noise tolerances. The "true"
time/memory value for a given benchmark is expected to fall within this percentage of the reported value.
An empty cell means that the value was zero.

| ID                                   | time            | GC time    | memory          | allocations |
|--------------------------------------|----------------:|-----------:|----------------:|------------:|
| `["base", "create"]`                 |   6.953 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  33.649 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  18.560 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  17.036 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  34.092 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  81.031 μs (5%) |            | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.076 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    2.015 s (5%) | 673.015 ms |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 125.547 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 565.000 ns (5%) |            |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 582.681 ns (5%) |            |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 532.779 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 813.388 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    2.199 s (5%) |   5.434 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 222.656 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 274.609 ms (5%) |   8.764 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     |  60.207 ms (5%) |   7.111 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 250.277 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.026 ms (5%) |            |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 204.512 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 234.989 ms (5%) |            | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      |  75.510 μs (5%) |            | 156.39 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.8.5
Commit 17cfb8e65ea (2023-01-08 06:45 UTC)
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 22.04.3 LTS
  uname: Linux 6.2.0-1019-azure #19~22.04.1-Ubuntu SMP Wed Jan 10 22:57:03 UTC 2024 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1  3244 MHz        973 s          0 s         59 s       1844 s          0 s
       #2  2445 MHz        512 s          0 s         69 s       2279 s          0 s
       #3  2600 MHz        342 s          0 s         64 s       2462 s          0 s
       #4  2547 MHz        453 s          0 s         72 s       2344 s          0 s
  Memory: 15.60690689086914 GB (13702.3203125 MB free)
  Uptime: 289.91 sec
  Load Avg:  1.0  0.58  0.24
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, znver3)
  Threads: 1 on 4 virtual cores
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 7 Feb 2024 - 17:2
* Package commit: 02540d
* Julia commit: 17cfb8
* Julia command flags: None
* Environment variables: None

## Results
Below is a table of this job's results, obtained by running the benchmarks.
The values listed in the `ID` column have the structure `[parent_group, child_group, ..., key]`, and can be used to
index into the BaseBenchmarks suite to retrieve the corresponding benchmarks.
The percentages accompanying time and memory values in the below table are noise tolerances. The "true"
time/memory value for a given benchmark is expected to fall within this percentage of the reported value.
An empty cell means that the value was zero.

| ID                                   | time            | GC time    | memory          | allocations |
|--------------------------------------|----------------:|-----------:|----------------:|------------:|
| `["base", "create"]`                 |   7.243 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  33.920 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  17.062 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  17.075 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  34.112 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  85.048 μs (5%) |            | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.084 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    2.010 s (5%) | 667.688 ms |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 125.333 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 555.686 ns (5%) |            |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 579.319 ns (5%) |            |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 528.195 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 808.456 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    2.209 s (5%) |   4.595 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 225.400 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 264.040 ms (5%) |   6.423 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     |  57.900 ms (5%) |   4.761 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 246.480 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.109 ms (5%) |            |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 199.191 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 225.125 ms (5%) |            | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      |  75.701 μs (5%) |            | 156.39 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.8.5
Commit 17cfb8e65ea (2023-01-08 06:45 UTC)
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 22.04.3 LTS
  uname: Linux 6.2.0-1019-azure #19~22.04.1-Ubuntu SMP Wed Jan 10 22:57:03 UTC 2024 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1  2602 MHz       1095 s          0 s         65 s       2492 s          0 s
       #2  2445 MHz        625 s          0 s         73 s       2938 s          0 s
       #3  2445 MHz        680 s          0 s         70 s       2894 s          0 s
       #4  3243 MHz        648 s          0 s         86 s       2912 s          0 s
  Memory: 15.60690689086914 GB (13793.59375 MB free)
  Uptime: 367.66 sec
  Load Avg:  1.0  0.68  0.31
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, znver3)
  Threads: 1 on 4 virtual cores
```

---
# Runtime information
| Runtime Info | |
|:--|:--|
| BLAS #threads | 2 |
| `BLAS.vendor()` | `openblas64` |
| `Sys.CPU_THREADS` | 4 |

`lscpu` output:

    Architecture:                       x86_64
    CPU op-mode(s):                     32-bit, 64-bit
    Address sizes:                      48 bits physical, 48 bits virtual
    Byte Order:                         Little Endian
    CPU(s):                             4
    On-line CPU(s) list:                0-3
    Vendor ID:                          AuthenticAMD
    Model name:                         AMD EPYC 7763 64-Core Processor
    CPU family:                         25
    Model:                              1
    Thread(s) per core:                 2
    Core(s) per socket:                 2
    Socket(s):                          1
    Stepping:                           1
    BogoMIPS:                           4890.85
    Flags:                              fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl tsc_reliable nonstop_tsc cpuid extd_apicid aperfmperf pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm cmp_legacy svm cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw topoext invpcid_single vmmcall fsgsbase bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves clzero xsaveerptr rdpru arat npt nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold v_vmsave_vmload umip vaes vpclmulqdq rdpid fsrm
    Virtualization:                     AMD-V
    Hypervisor vendor:                  Microsoft
    Virtualization type:                full
    L1d cache:                          64 KiB (2 instances)
    L1i cache:                          64 KiB (2 instances)
    L2 cache:                           1 MiB (2 instances)
    L3 cache:                           32 MiB (1 instance)
    NUMA node(s):                       1
    NUMA node0 CPU(s):                  0-3
    Vulnerability Gather data sampling: Not affected
    Vulnerability Itlb multihit:        Not affected
    Vulnerability L1tf:                 Not affected
    Vulnerability Mds:                  Not affected
    Vulnerability Meltdown:             Not affected
    Vulnerability Mmio stale data:      Not affected
    Vulnerability Retbleed:             Not affected
    Vulnerability Spec rstack overflow: Mitigation; safe RET, no microcode
    Vulnerability Spec store bypass:    Vulnerable
    Vulnerability Spectre v1:           Mitigation; usercopy/swapgs barriers and __user pointer sanitization
    Vulnerability Spectre v2:           Mitigation; Retpolines, STIBP disabled, RSB filling, PBRSB-eIBRS Not affected
    Vulnerability Srbds:                Not affected
    Vulnerability Tsx async abort:      Not affected
    

| Cpu Property       | Value                                                      |
|:------------------ |:---------------------------------------------------------- |
| Brand              | AMD EPYC 7763 64-Core Processor                            |
| Vendor             | :AMD                                                       |
| Architecture       | :Unknown                                                   |
| Model              | Family: 0xaf, Model: 0x01, Stepping: 0x01, Type: 0x00      |
| Cores              | 16 physical cores, 16 logical cores (on executing CPU)     |
|                    | No Hyperthreading hardware capability detected             |
| Clock Frequencies  | Not supported by CPU                                       |
| Data Cache         | Level 1:3 : (32, 512, 32768) kbytes                        |
|                    | 64 byte cache line size                                    |
| Address Size       | 48 bits virtual, 48 bits physical                          |
| SIMD               | 256 bit = 32 byte max. SIMD vector size                    |
| Time Stamp Counter | TSC is accessible via `rdtsc`                              |
|                    | TSC runs at constant rate (invariant from clock frequency) |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported    |
| Hypervisor         | Yes, Microsoft                                             |

