# Benchmark result

* Pull request commit: [`9845069e252fda293b90a521c595066314a315d9`](https://github.com/JuliaPhysics/Measurements.jl/commit/9845069e252fda293b90a521c595066314a315d9)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/211> (Accumulate uncertainty as a scaled sum of squares)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 20 Sep 2026 - 12:29
    - Baseline: 20 Sep 2026 - 12:30
* Package commits:
    - Target: ef4e499
    - Baseline: 47466d6
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

| ID                                          | time ratio                   | memory ratio |
|---------------------------------------------|------------------------------|--------------|
| `["base", "create"]`                        | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |
| `["base", "multiplication"]`                |                1.21 (5%) :x: |   1.00 (1%)  |
| `["base", "sum"]`                           |                1.26 (5%) :x: |   1.00 (1%)  |
| `["nvars", "division - 1 variables"]`       |                1.24 (5%) :x: |   1.00 (1%)  |
| `["nvars", "division - 2 variables"]`       |                1.19 (5%) :x: |   1.00 (1%)  |
| `["nvars", "division - 4 variables"]`       |                1.12 (5%) :x: |   1.00 (1%)  |
| `["nvars", "division - 8 variables"]`       |                1.11 (5%) :x: |   1.00 (1%)  |
| `["nvars", "multiplication - 1 variables"]` |                1.21 (5%) :x: |   1.00 (1%)  |
| `["nvars", "multiplication - 2 variables"]` |                1.16 (5%) :x: |   1.00 (1%)  |
| `["nvars", "multiplication - 4 variables"]` |                1.07 (5%) :x: |   1.00 (1%)  |
| `["nvars", "multiplication - 8 variables"]` |                1.07 (5%) :x: |   1.00 (1%)  |
| `["quadgk", "cos"]`                         |                1.07 (5%) :x: |   1.00 (1%)  |
| `["scalar", "self division"]`               |                1.10 (5%) :x: |   1.00 (1%)  |
| `["scalar", "self multiplication"]`         |                1.16 (5%) :x: |   1.00 (1%)  |
| `["scalar", "two variables"]`               |                1.11 (5%) :x: |   1.00 (1%)  |
| `["vector", "mean - all equal"]`            |                1.07 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all equal"]`            |                1.10 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all different"]`         | 0.85 (5%) :white_check_mark: |   1.00 (1%)  |

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
  CPU: AMD EPYC 9V74 80-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        253 s          0 s         52 s       1793 s          0 s
       #2     0 MHz        645 s          0 s         61 s       1421 s          0 s
       #3     0 MHz        536 s          0 s         57 s       1503 s          0 s
       #4     0 MHz       1159 s          0 s         78 s        861 s          0 s
  Memory: 15.614936828613281 GB (13875.984375 MB free)
  Uptime: 218.24 sec
  Load Avg:  1.26  0.77  0.32
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
      Ubuntu 24.04.5 LTS
  uname: Linux 6.17.0-1022-azure #22-Ubuntu SMP Mon Jul 27 17:24:03 UTC 2026 x86_64 x86_64
  CPU: AMD EPYC 9V74 80-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        364 s          0 s         59 s       2515 s          0 s
       #2     0 MHz       1089 s          0 s         73 s       1801 s          0 s
       #3     0 MHz        739 s          0 s         74 s       2104 s          0 s
       #4     0 MHz       1210 s          0 s         84 s       1645 s          0 s
  Memory: 15.614936828613281 GB (13800.140625 MB free)
  Uptime: 302.52 sec
  Load Avg:  1.06  0.83  0.39
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver4)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 20 Sep 2026 - 12:29
* Package commit: ef4e499
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
| `["base", "create"]`                        |   7.550 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`                |  30.236 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                           |  21.355 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                          |  16.162 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                           |  31.506 ns (5%) |            |   96 bytes (1%) |           2 |
| `["nvars", "division - 1 variables"]`       |   1.993 μs (5%) |            |   6.00 KiB (1%) |         128 |
| `["nvars", "division - 2 variables"]`       |   3.335 μs (5%) |            |  12.00 KiB (1%) |         256 |
| `["nvars", "division - 4 variables"]`       |   6.439 μs (5%) |            |  24.00 KiB (1%) |         512 |
| `["nvars", "division - 8 variables"]`       |  17.236 μs (5%) |            |  48.00 KiB (1%) |        1024 |
| `["nvars", "multiplication - 1 variables"]` |   1.933 μs (5%) |            |   6.00 KiB (1%) |         128 |
| `["nvars", "multiplication - 2 variables"]` |   3.204 μs (5%) |            |  12.00 KiB (1%) |         256 |
| `["nvars", "multiplication - 4 variables"]` |   6.200 μs (5%) |            |  24.00 KiB (1%) |         512 |
| `["nvars", "multiplication - 8 variables"]` |  16.805 μs (5%) |            |  48.00 KiB (1%) |        1024 |
| `["quadgk", "cos"]`                         |  72.370 μs (5%) |            | 271.20 KiB (1%) |        5643 |
| `["quadgk", "int1"]`                        | 984.500 ns (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                         |    1.545 s (5%) | 258.332 ms |   2.82 GiB (1%) |    59960357 |
| `["scalar", "evalpoly - 8 coefficients"]`   |   7.882 μs (5%) |            |  21.00 KiB (1%) |         448 |
| `["scalar", "self division"]`               |   1.131 μs (5%) |            |  672 bytes (1%) |          14 |
| `["scalar", "self multiplication"]`         |   1.332 μs (5%) |            |   3.00 KiB (1%) |          64 |
| `["scalar", "two variables"]`               |   5.288 μs (5%) |            |  18.00 KiB (1%) |         384 |
| `["specfun", "gamma"]`                      |  91.046 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`                     | 440.562 ns (5%) |            |  624 bytes (1%) |          23 |
| `["uncertain", "log"]`                      | 458.153 ns (5%) |            |  672 bytes (1%) |          24 |
| `["uncertain", "zeta"]`                     | 499.506 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                       | 614.748 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "mean - all different"]`        |    1.971 s (5%) |   9.623 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`            | 191.880 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]`        | 236.596 ms (5%) |  11.130 ms | 764.24 MiB (1%) |       40006 |
| `["vector", "prod - all equal"]`            |  46.584 ms (5%) |   7.233 ms | 763.78 MiB (1%) |       30007 |
| `["vector", "sin"]`                         | 200.873 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sin²+cos²"]`                   | 825.587 μs (5%) |            |   2.14 MiB (1%) |       40003 |
| `["vector", "sqrt"]`                        | 169.085 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sum - all different"]`         | 176.375 ms (5%) |            | 625.11 KiB (1%) |       10005 |
| `["vector", "sum - all equal"]`             |  45.669 μs (5%) |            | 156.41 KiB (1%) |           6 |

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
  CPU: AMD EPYC 9V74 80-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        253 s          0 s         52 s       1793 s          0 s
       #2     0 MHz        645 s          0 s         61 s       1421 s          0 s
       #3     0 MHz        536 s          0 s         57 s       1503 s          0 s
       #4     0 MHz       1159 s          0 s         78 s        861 s          0 s
  Memory: 15.614936828613281 GB (13875.984375 MB free)
  Uptime: 218.24 sec
  Load Avg:  1.26  0.77  0.32
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver4)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 20 Sep 2026 - 12:30
* Package commit: 47466d6
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
| `["base", "create"]`                        |   8.260 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`                |  24.992 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                           |  21.345 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                          |  16.203 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                           |  24.963 ns (5%) |            |   96 bytes (1%) |           2 |
| `["nvars", "division - 1 variables"]`       |   1.612 μs (5%) |            |   6.00 KiB (1%) |         128 |
| `["nvars", "division - 2 variables"]`       |   2.794 μs (5%) |            |  12.00 KiB (1%) |         256 |
| `["nvars", "division - 4 variables"]`       |   5.758 μs (5%) |            |  24.00 KiB (1%) |         512 |
| `["nvars", "division - 8 variables"]`       |  15.554 μs (5%) |            |  48.00 KiB (1%) |        1024 |
| `["nvars", "multiplication - 1 variables"]` |   1.602 μs (5%) |            |   6.00 KiB (1%) |         128 |
| `["nvars", "multiplication - 2 variables"]` |   2.765 μs (5%) |            |  12.00 KiB (1%) |         256 |
| `["nvars", "multiplication - 4 variables"]` |   5.789 μs (5%) |            |  24.00 KiB (1%) |         512 |
| `["nvars", "multiplication - 8 variables"]` |  15.664 μs (5%) |            |  48.00 KiB (1%) |        1024 |
| `["quadgk", "cos"]`                         |  67.953 μs (5%) |            | 271.20 KiB (1%) |        5643 |
| `["quadgk", "int1"]`                        | 939.400 ns (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                         |    1.484 s (5%) | 281.640 ms |   2.82 GiB (1%) |    59960357 |
| `["scalar", "evalpoly - 8 coefficients"]`   |   7.541 μs (5%) |            |  21.00 KiB (1%) |         448 |
| `["scalar", "self division"]`               |   1.031 μs (5%) |            |  672 bytes (1%) |          14 |
| `["scalar", "self multiplication"]`         |   1.152 μs (5%) |            |   3.00 KiB (1%) |          64 |
| `["scalar", "two variables"]`               |   4.747 μs (5%) |            |  18.00 KiB (1%) |         384 |
| `["specfun", "gamma"]`                      |  87.094 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`                     | 443.844 ns (5%) |            |  624 bytes (1%) |          23 |
| `["uncertain", "log"]`                      | 454.815 ns (5%) |            |  672 bytes (1%) |          24 |
| `["uncertain", "zeta"]`                     | 500.642 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                       | 612.075 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "mean - all different"]`        |    1.978 s (5%) |   9.341 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`            | 179.721 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]`        | 235.421 ms (5%) |  10.701 ms | 764.24 MiB (1%) |       40006 |
| `["vector", "prod - all equal"]`            |  42.167 ms (5%) |   6.830 ms | 763.78 MiB (1%) |       30007 |
| `["vector", "sin"]`                         | 201.965 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sin²+cos²"]`                   | 819.118 μs (5%) |            |   2.14 MiB (1%) |       40003 |
| `["vector", "sqrt"]`                        | 168.254 μs (5%) |            | 781.32 KiB (1%) |       10003 |
| `["vector", "sum - all different"]`         | 208.350 ms (5%) |            | 625.11 KiB (1%) |       10005 |
| `["vector", "sum - all equal"]`             |  45.328 μs (5%) |            | 156.41 KiB (1%) |           6 |

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
  CPU: AMD EPYC 9V74 80-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        364 s          0 s         59 s       2515 s          0 s
       #2     0 MHz       1089 s          0 s         73 s       1801 s          0 s
       #3     0 MHz        739 s          0 s         74 s       2104 s          0 s
       #4     0 MHz       1210 s          0 s         84 s       1645 s          0 s
  Memory: 15.614936828613281 GB (13800.140625 MB free)
  Uptime: 302.52 sec
  Load Avg:  1.06  0.83  0.39
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
    BogoMIPS:                                5192.28
    Flags:                                   fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology tsc_reliable nonstop_tsc cpuid extd_apicid aperfmperf tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm cmp_legacy svm cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw topoext vmmcall fsgsbase bmi1 avx2 smep bmi2 erms invpcid avx512f avx512dq rdseed adx smap avx512ifma clflushopt clwb avx512cd sha_ni avx512bw avx512vl xsaveopt xsavec xgetbv1 xsaves user_shstk avx512_bf16 clzero xsaveerptr rdpru arat npt nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold v_vmsave_vmload avx512vbmi umip avx512_vbmi2 gfni vaes vpclmulqdq avx512_vnni avx512_bitalg avx512_vpopcntdq rdpid fsrm
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
| Cores              | 8 physical cores, 16 logical cores (on executing CPU)      |
|                    | Hyperthreading hardware capability detected                |
| Clock Frequencies  | Not supported by CPU                                       |
| Data Cache         | Level 1:3 : (32, 1024, 32768) kbytes                       |
|                    | 64 byte cache line size                                    |
| Address Size       | 48 bits virtual, 48 bits physical                          |
| SIMD               | 512 bit = 64 byte max. SIMD vector size                    |
| Time Stamp Counter | TSC is accessible via `rdtsc`                              |
|                    | TSC runs at constant rate (invariant from clock frequency) |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported    |
| Hypervisor         | Yes, Microsoft                                             |

