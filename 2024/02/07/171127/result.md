# Benchmark result

* Pull request commit: [`9f74b93dfb0d1712ca54e826c10fdd611aac03ef`](https://github.com/JuliaPhysics/Measurements.jl/commit/9f74b93dfb0d1712ca54e826c10fdd611aac03ef)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/141> ([GHA] Switch to `codecov/codecov-action`)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 7 Feb 2024 - 17:09
    - Baseline: 7 Feb 2024 - 17:11
* Package commits:
    - Target: 6dc895
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

| ID                                   | time ratio    | memory ratio |
|--------------------------------------|---------------|--------------|
| `["quadgk", "sin"]`                  | 1.07 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  | 1.21 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all equal"]`      | 1.07 (5%) :x: |   1.00 (1%)  |

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
       #1  2445 MHz        481 s          0 s         46 s       3051 s          0 s
       #2  2598 MHz        301 s          0 s         44 s       3210 s          0 s
       #3  2445 MHz        885 s          0 s         63 s       2619 s          0 s
       #4  3243 MHz        251 s          0 s         67 s       3257 s          0 s
  Memory: 15.606903076171875 GB (13714.765625 MB free)
  Uptime: 360.11 sec
  Load Avg:  1.02  0.55  0.23
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
       #1  3242 MHz        497 s          0 s         52 s       3815 s          0 s
       #2  3016 MHz        320 s          0 s         50 s       3971 s          0 s
       #3  2661 MHz       1014 s          0 s         69 s       3271 s          0 s
       #4  3240 MHz        866 s          0 s         78 s       3419 s          0 s
  Memory: 15.606903076171875 GB (13785.0234375 MB free)
  Uptime: 438.89 sec
  Load Avg:  1.03  0.67  0.3
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, znver3)
  Threads: 1 on 4 virtual cores
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 7 Feb 2024 - 17:9
* Package commit: 6dc895
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
| `["base", "create"]`                 |   7.060 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  33.840 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  17.116 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  17.055 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  34.223 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  81.552 μs (5%) |            | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.078 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    2.185 s (5%) | 773.131 ms |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 125.546 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 530.516 ns (5%) |            |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 544.633 ns (5%) |            |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 531.784 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 818.107 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    2.221 s (5%) |   6.551 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 222.986 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 278.522 ms (5%) |   9.302 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     |  64.979 ms (5%) |   7.750 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 254.555 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.024 ms (5%) |            |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 204.983 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 236.100 ms (5%) |            | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      |  77.224 μs (5%) |            | 156.39 KiB (1%) |           5 |

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
       #1  2445 MHz        481 s          0 s         46 s       3051 s          0 s
       #2  2598 MHz        301 s          0 s         44 s       3210 s          0 s
       #3  2445 MHz        885 s          0 s         63 s       2619 s          0 s
       #4  3243 MHz        251 s          0 s         67 s       3257 s          0 s
  Memory: 15.606903076171875 GB (13714.765625 MB free)
  Uptime: 360.11 sec
  Load Avg:  1.02  0.55  0.23
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, znver3)
  Threads: 1 on 4 virtual cores
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 7 Feb 2024 - 17:11
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
| `["base", "create"]`                 |   7.210 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  34.395 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  17.095 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  17.096 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  34.142 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  85.109 μs (5%) |            | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.090 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    2.036 s (5%) | 682.342 ms |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 125.323 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 551.453 ns (5%) |            |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 569.255 ns (5%) |            |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 527.932 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 811.836 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    2.192 s (5%) |   4.880 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 224.048 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 291.838 ms (5%) |   5.740 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     |  62.493 ms (5%) |   6.962 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 250.118 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.010 ms (5%) |            |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 200.455 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 194.824 ms (5%) |            | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      |  72.415 μs (5%) |            | 156.39 KiB (1%) |           5 |

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
       #1  3242 MHz        497 s          0 s         52 s       3815 s          0 s
       #2  3016 MHz        320 s          0 s         50 s       3971 s          0 s
       #3  2661 MHz       1014 s          0 s         69 s       3271 s          0 s
       #4  3240 MHz        866 s          0 s         78 s       3419 s          0 s
  Memory: 15.606903076171875 GB (13785.0234375 MB free)
  Uptime: 438.89 sec
  Load Avg:  1.03  0.67  0.3
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

