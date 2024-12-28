# Benchmark result

* Pull request commit: [`9ea34d3e6eaee4d554598274ddecbee04f4578ae`](https://github.com/JuliaPhysics/Measurements.jl/commit/9ea34d3e6eaee4d554598274ddecbee04f4578ae)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/172> (Bump codecov/codecov-action from 4 to 5)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 28 Dec 2024 - 13:16
    - Baseline: 28 Dec 2024 - 13:18
* Package commits:
    - Target: a34ddb
    - Baseline: 833064
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
| `["quadgk", "sin"]`                  | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "mean - all equal"]`     |                1.06 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all different"]` | 0.86 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sqrt"]`                 |                1.05 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all equal"]`      |                1.10 (5%) :x: |   1.00 (1%)  |

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
      Ubuntu 22.04.5 LTS
  uname: Linux 6.5.0-1025-azure #26~22.04.1-Ubuntu SMP Thu Jul 11 22:33:04 UTC 2024 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1  3243 MHz        493 s          0 s         70 s       4093 s          0 s
       #2  3307 MHz        541 s          0 s         64 s       4059 s          0 s
       #3  3216 MHz        833 s          0 s         74 s       3747 s          0 s
       #4  3167 MHz        540 s          0 s         70 s       4051 s          0 s
  Memory: 15.606491088867188 GB (13520.265625 MB free)
  Uptime: 468.56 sec
  Load Avg:  1.11  0.73  0.35
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
      Ubuntu 22.04.5 LTS
  uname: Linux 6.5.0-1025-azure #26~22.04.1-Ubuntu SMP Thu Jul 11 22:33:04 UTC 2024 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1  3242 MHz        516 s          0 s         74 s       4843 s          0 s
       #2  3282 MHz        543 s          0 s         67 s       4831 s          0 s
       #3  3176 MHz       1252 s          0 s         84 s       4097 s          0 s
       #4  2445 MHz        869 s          0 s         77 s       4494 s          0 s
  Memory: 15.606491088867188 GB (13826.1015625 MB free)
  Uptime: 546.5 sec
  Load Avg:  1.09  0.81  0.41
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, znver3)
  Threads: 1 on 4 virtual cores
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 28 Dec 2024 - 13:16
* Package commit: a34ddb
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
| `["base", "create"]`                 |   6.943 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  33.920 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  17.196 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  17.146 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  34.293 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  81.522 μs (5%) |            | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.104 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    2.088 s (5%) | 687.581 ms |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 121.775 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 535.258 ns (5%) |            |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 547.564 ns (5%) |            |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 530.253 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 817.687 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    2.217 s (5%) |   5.642 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 230.380 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 314.827 ms (5%) |   6.752 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     |  64.193 ms (5%) |   6.287 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 257.841 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.026 ms (5%) |            |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 210.984 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 254.011 ms (5%) |            | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      |  76.052 μs (5%) |            | 156.39 KiB (1%) |           5 |

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
      Ubuntu 22.04.5 LTS
  uname: Linux 6.5.0-1025-azure #26~22.04.1-Ubuntu SMP Thu Jul 11 22:33:04 UTC 2024 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1  3243 MHz        493 s          0 s         70 s       4093 s          0 s
       #2  3307 MHz        541 s          0 s         64 s       4059 s          0 s
       #3  3216 MHz        833 s          0 s         74 s       3747 s          0 s
       #4  3167 MHz        540 s          0 s         70 s       4051 s          0 s
  Memory: 15.606491088867188 GB (13520.265625 MB free)
  Uptime: 468.56 sec
  Load Avg:  1.11  0.73  0.35
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, znver3)
  Threads: 1 on 4 virtual cores
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 28 Dec 2024 - 13:18
* Package commit: 833064
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
| `["base", "multiplication"]`         |  34.212 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  17.196 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  17.136 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  33.991 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  80.771 μs (5%) |            | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.089 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    2.208 s (5%) | 834.355 ms |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 122.018 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 533.732 ns (5%) |            |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 543.298 ns (5%) |            |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 527.563 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 823.088 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    2.216 s (5%) |   8.719 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 216.524 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 366.245 ms (5%) |   5.941 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     |  63.902 ms (5%) |   7.087 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 254.565 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.005 ms (5%) |            |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 200.455 μs (5%) |            | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 265.439 ms (5%) |            | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      |  69.079 μs (5%) |            | 156.39 KiB (1%) |           5 |

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
      Ubuntu 22.04.5 LTS
  uname: Linux 6.5.0-1025-azure #26~22.04.1-Ubuntu SMP Thu Jul 11 22:33:04 UTC 2024 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1  3242 MHz        516 s          0 s         74 s       4843 s          0 s
       #2  3282 MHz        543 s          0 s         67 s       4831 s          0 s
       #3  3176 MHz       1252 s          0 s         84 s       4097 s          0 s
       #4  2445 MHz        869 s          0 s         77 s       4494 s          0 s
  Memory: 15.606491088867188 GB (13826.1015625 MB free)
  Uptime: 546.5 sec
  Load Avg:  1.09  0.81  0.41
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
    Vulnerability Spec rstack overflow: Vulnerable: Safe RET, no microcode
    Vulnerability Spec store bypass:    Vulnerable
    Vulnerability Spectre v1:           Mitigation; usercopy/swapgs barriers and __user pointer sanitization
    Vulnerability Spectre v2:           Mitigation; Retpolines; STIBP disabled; RSB filling; PBRSB-eIBRS Not affected; BHI Not affected
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

