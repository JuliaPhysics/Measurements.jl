# Benchmark result

* Pull request commit: [`cc1a096cc11a6aff327e62fd838adf10166cb3ae`](https://github.com/JuliaPhysics/Measurements.jl/commit/cc1a096cc11a6aff327e62fd838adf10166cb3ae)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/207> (Bump actions/cache from 5 to 6)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 29 Jun 2026 - 06:47
    - Baseline: 29 Jun 2026 - 06:48
* Package commits:
    - Target: 904579b
    - Baseline: e98321a
* Julia commits:
    - Target: f2b3dbd
    - Baseline: f2b3dbd
* Julia command flags:
    - Target: None
    - Baseline: None
* Environment variables:
    - Target: None
    - Baseline: None

## Results
A ratio greater than `1.0` denotes a possible regression (marked with :x:), while a ratio less
than `1.0` denotes a possible improvement (marked with :white_check_mark:). Brackets display [tolerances](https://juliaci.github.io/BenchmarkTools.jl/stable/manual/#Benchmark-Parameters) for the benchmark estimates. Only significant results - results
that indicate possible regressions or improvements - are shown below (thus, an empty table means that all
benchmark results remained invariant between builds).

| ID                                   | time ratio                   | memory ratio |
|--------------------------------------|------------------------------|--------------|
| `["base", "create"]`                 | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["quadgk", "cos"]`                  |                1.11 (5%) :x: |   1.00 (1%)  |
| `["quadgk", "sin"]`                  |                1.22 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all equal"]`     | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  |                1.20 (5%) :x: |   1.00 (1%)  |

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
Julia Version 1.11.7
Commit f2b3dbda30a (2025-09-08 12:10 UTC)
Build Info:
  Official https://julialang.org/ release
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 24.04.4 LTS
  uname: Linux 6.17.0-1018-azure #18~24.04.1-Ubuntu SMP Thu May 28 16:39:11 UTC 2026 x86_64 x86_64
  CPU: AMD EPYC 9V74 80-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        300 s          0 s         68 s       1320 s          0 s
       #2     0 MHz        341 s          0 s         62 s       1270 s          0 s
       #3     0 MHz        525 s          0 s         62 s       1091 s          0 s
       #4     0 MHz        904 s          0 s         81 s        705 s          0 s
  Memory: 15.614936828613281 GB (11898.9453125 MB free)
  Uptime: 171.18 sec
  Load Avg:  1.25  0.8  0.33
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver4)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

### Baseline
```
Julia Version 1.11.7
Commit f2b3dbda30a (2025-09-08 12:10 UTC)
Build Info:
  Official https://julialang.org/ release
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 24.04.4 LTS
  uname: Linux 6.17.0-1018-azure #18~24.04.1-Ubuntu SMP Thu May 28 16:39:11 UTC 2026 x86_64 x86_64
  CPU: AMD EPYC 9V74 80-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        556 s          0 s         79 s       1847 s          0 s
       #2     0 MHz        819 s          0 s         80 s       1569 s          0 s
       #3     0 MHz        548 s          0 s         63 s       1862 s          0 s
       #4     0 MHz        919 s          0 s         82 s       1484 s          0 s
  Memory: 15.614936828613281 GB (11827.80078125 MB free)
  Uptime: 250.86 sec
  Load Avg:  1.06  0.85  0.39
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver4)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 29 Jun 2026 - 06:47
* Package commit: 904579b
* Julia commit: f2b3dbd
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
| `["base", "create"]`                 |   9.013 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  32.562 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  21.164 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  21.165 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  32.621 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  97.927 μs (5%) |            | 271.20 KiB (1%) |        5643 |
| `["quadgk", "int1"]`                 |   1.254 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    2.141 s (5%) | 255.147 ms |   2.82 GiB (1%) |    59960357 |
| `["specfun", "gamma"]`               | 111.836 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 542.167 ns (5%) |            |  624 bytes (1%) |          23 |
| `["uncertain", "log"]`               | 549.291 ns (5%) |            |  672 bytes (1%) |          24 |
| `["uncertain", "zeta"]`              | 428.881 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 791.868 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "mean - all different"]` |    2.531 s (5%) |   9.742 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 223.695 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 304.939 ms (5%) |  12.853 ms | 764.24 MiB (1%) |       40006 |
| `["vector", "prod - all equal"]`     |  49.243 ms (5%) |   8.360 ms | 763.78 MiB (1%) |       30007 |
| `["vector", "sin"]`                  | 250.777 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sin²+cos²"]`            |   1.051 ms (5%) |            |   2.14 MiB (1%) |       40003 |
| `["vector", "sqrt"]`                 | 213.610 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sum - all different"]`  | 280.893 ms (5%) |            | 625.11 KiB (1%) |       10005 |
| `["vector", "sum - all equal"]`      |  56.985 μs (5%) |            | 156.41 KiB (1%) |           6 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.11.7
Commit f2b3dbda30a (2025-09-08 12:10 UTC)
Build Info:
  Official https://julialang.org/ release
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 24.04.4 LTS
  uname: Linux 6.17.0-1018-azure #18~24.04.1-Ubuntu SMP Thu May 28 16:39:11 UTC 2026 x86_64 x86_64
  CPU: AMD EPYC 9V74 80-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        300 s          0 s         68 s       1320 s          0 s
       #2     0 MHz        341 s          0 s         62 s       1270 s          0 s
       #3     0 MHz        525 s          0 s         62 s       1091 s          0 s
       #4     0 MHz        904 s          0 s         81 s        705 s          0 s
  Memory: 15.614936828613281 GB (11898.9453125 MB free)
  Uptime: 171.18 sec
  Load Avg:  1.25  0.8  0.33
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver4)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 29 Jun 2026 - 06:48
* Package commit: e98321a
* Julia commit: f2b3dbd
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
| `["base", "create"]`                 |   9.795 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  32.179 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  20.964 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  20.984 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  32.139 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  88.292 μs (5%) |            | 271.20 KiB (1%) |        5643 |
| `["quadgk", "int1"]`                 |   1.209 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    1.759 s (5%) | 263.080 ms |   2.82 GiB (1%) |    59960357 |
| `["specfun", "gamma"]`               | 111.868 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 526.573 ns (5%) |            |  624 bytes (1%) |          23 |
| `["uncertain", "log"]`               | 542.720 ns (5%) |            |  672 bytes (1%) |          24 |
| `["uncertain", "zeta"]`              | 428.659 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 793.501 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "mean - all different"]` |    2.498 s (5%) |   9.582 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 226.670 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 307.509 ms (5%) |  13.572 ms | 764.24 MiB (1%) |       40006 |
| `["vector", "prod - all equal"]`     |  51.954 ms (5%) |   8.657 ms | 763.78 MiB (1%) |       30007 |
| `["vector", "sin"]`                  | 253.090 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sin²+cos²"]`            |   1.066 ms (5%) |            |   2.14 MiB (1%) |       40003 |
| `["vector", "sqrt"]`                 | 213.581 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sum - all different"]`  | 233.548 ms (5%) |            | 625.11 KiB (1%) |       10005 |
| `["vector", "sum - all equal"]`      |  58.347 μs (5%) |            | 156.41 KiB (1%) |           6 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.11.7
Commit f2b3dbda30a (2025-09-08 12:10 UTC)
Build Info:
  Official https://julialang.org/ release
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 24.04.4 LTS
  uname: Linux 6.17.0-1018-azure #18~24.04.1-Ubuntu SMP Thu May 28 16:39:11 UTC 2026 x86_64 x86_64
  CPU: AMD EPYC 9V74 80-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        556 s          0 s         79 s       1847 s          0 s
       #2     0 MHz        819 s          0 s         80 s       1569 s          0 s
       #3     0 MHz        548 s          0 s         63 s       1862 s          0 s
       #4     0 MHz        919 s          0 s         82 s       1484 s          0 s
  Memory: 15.614936828613281 GB (11827.80078125 MB free)
  Uptime: 250.86 sec
  Load Avg:  1.06  0.85  0.39
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver4)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Runtime information
| Runtime Info | |
|:--|:--|
| BLAS #threads | 2 |
| `BLAS.vendor()` | `lbt` |
| `Sys.CPU_THREADS` | 4 |

`lscpu` output:

    Architecture:                            x86_64
    CPU op-mode(s):                          32-bit, 64-bit
    Address sizes:                           48 bits physical, 48 bits virtual
    Byte Order:                              Little Endian
    CPU(s):                                  4
    On-line CPU(s) list:                     0-3
    Vendor ID:                               AuthenticAMD
    Model name:                              AMD EPYC 9V74 80-Core Processor
    CPU family:                              25
    Model:                                   17
    Thread(s) per core:                      2
    Core(s) per socket:                      2
    Socket(s):                               1
    Stepping:                                1
    BogoMIPS:                                5192.26
    Flags:                                   fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl tsc_reliable nonstop_tsc cpuid extd_apicid aperfmperf tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm cmp_legacy svm cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw topoext vmmcall fsgsbase bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves user_shstk clzero xsaveerptr rdpru arat npt nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold v_vmsave_vmload umip vaes vpclmulqdq rdpid fsrm
    Virtualization:                          AMD-V
    Hypervisor vendor:                       Microsoft
    Virtualization type:                     full
    L1d cache:                               64 KiB (2 instances)
    L1i cache:                               64 KiB (2 instances)
    L2 cache:                                2 MiB (2 instances)
    L3 cache:                                32 MiB (1 instance)
    NUMA node(s):                            1
    NUMA node0 CPU(s):                       0-3
    Vulnerability Gather data sampling:      Not affected
    Vulnerability Ghostwrite:                Not affected
    Vulnerability Indirect target selection: Not affected
    Vulnerability Itlb multihit:             Not affected
    Vulnerability L1tf:                      Not affected
    Vulnerability Mds:                       Not affected
    Vulnerability Meltdown:                  Not affected
    Vulnerability Mmio stale data:           Not affected
    Vulnerability Old microcode:             Not affected
    Vulnerability Reg file data sampling:    Not affected
    Vulnerability Retbleed:                  Not affected
    Vulnerability Spec rstack overflow:      Vulnerable: Safe RET, no microcode
    Vulnerability Spec store bypass:         Vulnerable
    Vulnerability Spectre v1:                Mitigation; usercopy/swapgs barriers and __user pointer sanitization
    Vulnerability Spectre v2:                Mitigation; Retpolines; STIBP disabled; RSB filling; PBRSB-eIBRS Not affected; BHI Not affected
    Vulnerability Srbds:                     Not affected
    Vulnerability Tsa:                       Vulnerable: No microcode
    Vulnerability Tsx async abort:           Not affected
    Vulnerability Vmscape:                   Not affected
    

| Cpu Property       | Value                                                      |
|:------------------ |:---------------------------------------------------------- |
| Brand              | AMD EPYC 9V74 80-Core Processor                            |
| Vendor             | :AMD                                                       |
| Architecture       | :Unknown                                                   |
| Model              | Family: 0xaf, Model: 0x11, Stepping: 0x01, Type: 0x00      |
| Cores              | 16 physical cores, 16 logical cores (on executing CPU)     |
|                    | No Hyperthreading hardware capability detected             |
| Clock Frequencies  | Not supported by CPU                                       |
| Data Cache         | Level 1:3 : (32, 1024, 32768) kbytes                       |
|                    | 64 byte cache line size                                    |
| Address Size       | 48 bits virtual, 48 bits physical                          |
| SIMD               | 256 bit = 32 byte max. SIMD vector size                    |
| Time Stamp Counter | TSC is accessible via `rdtsc`                              |
|                    | TSC runs at constant rate (invariant from clock frequency) |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported    |
| Hypervisor         | Yes, Microsoft                                             |

