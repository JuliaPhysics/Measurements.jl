# Benchmark result

* Pull request commit: [`d2391c1dcc1088aa8f52f9958f3b42caae820647`](https://github.com/JuliaPhysics/Measurements.jl/commit/d2391c1dcc1088aa8f52f9958f3b42caae820647)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/210> ([benchmark] Add few-variable scalar workloads)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 20 Sep 2026 - 12:20
    - Baseline: 20 Sep 2026 - 12:21
* Package commits:
    - Target: 6efc5de
    - Baseline: c58cbe2
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
| `["base", "sin"]`                    |                1.34 (5%) :x: |   1.00 (1%)  |
| `["uncertain", "atan"]`              | 0.90 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "prod - all different"]` |                1.08 (5%) :x: |   1.00 (1%)  |

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
      Ubuntu 24.04.5 LTS
  uname: Linux 6.17.0-1022-azure #22-Ubuntu SMP Mon Jul 27 17:24:03 UTC 2026 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz       1245 s          0 s         83 s       1103 s          0 s
       #2     0 MHz        595 s          0 s         55 s       1763 s          0 s
       #3     0 MHz        761 s          0 s         74 s       1581 s          0 s
       #4     0 MHz        513 s          0 s         65 s       1858 s          0 s
  Memory: 15.614940643310547 GB (14041.5234375 MB free)
  Uptime: 247.75 sec
  Load Avg:  1.2  1.11  0.53
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver3)
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
      Ubuntu 24.04.5 LTS
  uname: Linux 6.17.0-1022-azure #22-Ubuntu SMP Mon Jul 27 17:24:03 UTC 2026 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz       1554 s          0 s         93 s       1571 s          0 s
       #2     0 MHz        898 s          0 s         62 s       2240 s          0 s
       #3     0 MHz        811 s          0 s         77 s       2314 s          0 s
       #4     0 MHz        623 s          0 s         74 s       2526 s          0 s
  Memory: 15.614940643310547 GB (11699.953125 MB free)
  Uptime: 326.59 sec
  Load Avg:  1.1  1.1  0.58
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver3)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 20 Sep 2026 - 12:20
* Package commit: 6efc5de
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

| ID                                          | time            | GC time    | memory          | allocations |
|---------------------------------------------|----------------:|-----------:|----------------:|------------:|
| `["base", "create"]`                        |   9.026 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`                |  31.597 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                           |  25.419 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                          |  18.591 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                           |  30.701 ns (5%) |            |   96 bytes (1%) |           2 |
| `["nvars", "division - 1 variables"]`       |   1.993 μs (5%) |            |   6.00 KiB (1%) |         128 |
| `["nvars", "division - 2 variables"]`       |   3.416 μs (5%) |            |  12.00 KiB (1%) |         256 |
| `["nvars", "division - 4 variables"]`       |   7.554 μs (5%) |            |  24.00 KiB (1%) |         512 |
| `["nvars", "division - 8 variables"]`       |  21.681 μs (5%) |            |  48.00 KiB (1%) |        1024 |
| `["nvars", "multiplication - 1 variables"]` |   1.944 μs (5%) |            |   6.00 KiB (1%) |         128 |
| `["nvars", "multiplication - 2 variables"]` |   3.416 μs (5%) |            |  12.00 KiB (1%) |         256 |
| `["nvars", "multiplication - 4 variables"]` |   7.314 μs (5%) |            |  24.00 KiB (1%) |         512 |
| `["nvars", "multiplication - 8 variables"]` |  20.168 μs (5%) |            |  48.00 KiB (1%) |        1024 |
| `["quadgk", "cos"]`                         |  86.352 μs (5%) |            | 271.20 KiB (1%) |        5643 |
| `["quadgk", "int1"]`                        |   1.129 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                         |    1.657 s (5%) | 257.110 ms |   2.82 GiB (1%) |    59960357 |
| `["scalar", "evalpoly - 8 coefficients"]`   |   8.646 μs (5%) |            |  21.00 KiB (1%) |         448 |
| `["scalar", "self division"]`               |   1.463 μs (5%) |            |  672 bytes (1%) |          14 |
| `["scalar", "self multiplication"]`         |   1.492 μs (5%) |            |   3.00 KiB (1%) |          64 |
| `["scalar", "two variables"]`               |   5.771 μs (5%) |            |  18.00 KiB (1%) |         384 |
| `["specfun", "gamma"]`                      | 109.039 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`                     | 533.865 ns (5%) |            |  624 bytes (1%) |          23 |
| `["uncertain", "log"]`                      | 546.683 ns (5%) |            |  672 bytes (1%) |          24 |
| `["uncertain", "zeta"]`                     | 454.886 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                       | 770.803 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "mean - all different"]`        |    2.252 s (5%) |   8.122 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`            | 207.709 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]`        | 290.071 ms (5%) |  14.303 ms | 764.24 MiB (1%) |       40006 |
| `["vector", "prod - all equal"]`            |  45.655 ms (5%) |   8.499 ms | 763.78 MiB (1%) |       30007 |
| `["vector", "sin"]`                         | 255.819 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sin²+cos²"]`                   |   1.027 ms (5%) |            |   2.14 MiB (1%) |       40003 |
| `["vector", "sqrt"]`                        | 230.782 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sum - all different"]`         | 198.691 ms (5%) |            | 625.11 KiB (1%) |       10005 |
| `["vector", "sum - all equal"]`             |  50.835 μs (5%) |            | 156.41 KiB (1%) |           6 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["nvars"]`
- `["quadgk"]`
- `["scalar"]`
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
      Ubuntu 24.04.5 LTS
  uname: Linux 6.17.0-1022-azure #22-Ubuntu SMP Mon Jul 27 17:24:03 UTC 2026 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz       1245 s          0 s         83 s       1103 s          0 s
       #2     0 MHz        595 s          0 s         55 s       1763 s          0 s
       #3     0 MHz        761 s          0 s         74 s       1581 s          0 s
       #4     0 MHz        513 s          0 s         65 s       1858 s          0 s
  Memory: 15.614940643310547 GB (14041.5234375 MB free)
  Uptime: 247.75 sec
  Load Avg:  1.2  1.11  0.53
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver3)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 20 Sep 2026 - 12:21
* Package commit: c58cbe2
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
| `["base", "create"]`                 |   9.026 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  31.637 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  18.903 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  18.912 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  31.476 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  86.692 μs (5%) |            | 271.20 KiB (1%) |        5643 |
| `["quadgk", "int1"]`                 |   1.145 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    1.669 s (5%) | 258.732 ms |   2.82 GiB (1%) |    59960357 |
| `["specfun", "gamma"]`               | 109.906 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 595.646 ns (5%) |            |  624 bytes (1%) |          23 |
| `["uncertain", "log"]`               | 543.291 ns (5%) |            |  672 bytes (1%) |          24 |
| `["uncertain", "zeta"]`              | 453.920 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 770.151 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "mean - all different"]` |    2.243 s (5%) |   7.330 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 209.682 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 268.403 ms (5%) |  12.761 ms | 764.24 MiB (1%) |       40006 |
| `["vector", "prod - all equal"]`     |  45.509 ms (5%) |   8.353 ms | 763.78 MiB (1%) |       30007 |
| `["vector", "sin"]`                  | 255.979 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sin²+cos²"]`            |   1.034 ms (5%) |            |   2.14 MiB (1%) |       40003 |
| `["vector", "sqrt"]`                 | 230.972 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sum - all different"]`  | 197.430 ms (5%) |            | 625.11 KiB (1%) |       10005 |
| `["vector", "sum - all equal"]`      |  50.705 μs (5%) |            | 156.41 KiB (1%) |           6 |

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
      Ubuntu 24.04.5 LTS
  uname: Linux 6.17.0-1022-azure #22-Ubuntu SMP Mon Jul 27 17:24:03 UTC 2026 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz       1554 s          0 s         93 s       1571 s          0 s
       #2     0 MHz        898 s          0 s         62 s       2240 s          0 s
       #3     0 MHz        811 s          0 s         77 s       2314 s          0 s
       #4     0 MHz        623 s          0 s         74 s       2526 s          0 s
  Memory: 15.614940643310547 GB (11699.953125 MB free)
  Uptime: 326.59 sec
  Load Avg:  1.1  1.1  0.58
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver3)
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
    Model name:                              AMD EPYC 7763 64-Core Processor
    CPU family:                              25
    Model:                                   1
    Thread(s) per core:                      2
    Core(s) per socket:                      2
    Socket(s):                               1
    Stepping:                                1
    BogoMIPS:                                4890.85
    Flags:                                   fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl tsc_reliable nonstop_tsc cpuid extd_apicid aperfmperf tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm cmp_legacy svm cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw topoext vmmcall fsgsbase bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves user_shstk clzero xsaveerptr rdpru arat npt nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold v_vmsave_vmload umip vaes vpclmulqdq rdpid fsrm
    Virtualization:                          AMD-V
    Hypervisor vendor:                       Microsoft
    Virtualization type:                     full
    L1d cache:                               64 KiB (2 instances)
    L1i cache:                               64 KiB (2 instances)
    L2 cache:                                1 MiB (2 instances)
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

