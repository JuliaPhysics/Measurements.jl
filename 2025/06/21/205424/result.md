# Benchmark result

* Pull request commit: [`41e4ddfeb4ed0c20a213b6e13ab3fee68697ac50`](https://github.com/JuliaPhysics/Measurements.jl/commit/41e4ddfeb4ed0c20a213b6e13ab3fee68697ac50)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/185> (CompatHelper: bump compat for Makie in [weakdeps] to 0.24, (keep existing compat))

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 21 Jun 2025 - 20:52
    - Baseline: 21 Jun 2025 - 20:54
* Package commits:
    - Target: 5e8691
    - Baseline: f4bbae
* Julia commits:
    - Target: d63ade
    - Baseline: d63ade
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
| `["quadgk", "int1"]`                 |                1.06 (5%) :x: |   1.00 (1%)  |
| `["quadgk", "sin"]`                  |                1.16 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  |                1.05 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all equal"]`      | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |

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
Julia Version 1.11.3
Commit d63adeda50d (2025-01-21 19:42 UTC)
Build Info:
  Official https://julialang.org/ release
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 24.04.2 LTS
  uname: Linux 6.11.0-1015-azure #15~24.04.1-Ubuntu SMP Thu May  1 02:52:08 UTC 2025 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        660 s          0 s         93 s       3042 s          0 s
       #2     0 MHz       1018 s          0 s         91 s       2704 s          0 s
       #3     0 MHz        554 s          0 s         82 s       3142 s          0 s
       #4     0 MHz        676 s          0 s         88 s       2982 s          0 s
  Memory: 15.620765686035156 GB (11654.58984375 MB free)
  Uptime: 387.17 sec
  Load Avg:  1.05  0.73  0.33
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver3)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

### Baseline
```
Julia Version 1.11.3
Commit d63adeda50d (2025-01-21 19:42 UTC)
Build Info:
  Official https://julialang.org/ release
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 24.04.2 LTS
  uname: Linux 6.11.0-1015-azure #15~24.04.1-Ubuntu SMP Thu May  1 02:52:08 UTC 2025 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        823 s          0 s         99 s       3662 s          0 s
       #2     0 MHz       1106 s          0 s        102 s       3394 s          0 s
       #3     0 MHz        673 s          0 s         88 s       3806 s          0 s
       #4     0 MHz       1074 s          0 s        106 s       3355 s          0 s
  Memory: 15.620765686035156 GB (11704.5625 MB free)
  Uptime: 466.2 sec
  Load Avg:  1.06  0.81  0.39
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver3)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 21 Jun 2025 - 20:52
* Package commit: 5e8691
* Julia commit: d63ade
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
| `["base", "create"]`                 |   9.056 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  31.840 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  18.671 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  18.681 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  31.276 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  88.475 μs (5%) |            | 271.19 KiB (1%) |        5643 |
| `["quadgk", "int1"]`                 |   1.219 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    1.842 s (5%) | 197.536 ms |   2.82 GiB (1%) |    59960357 |
| `["specfun", "gamma"]`               | 114.447 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 559.359 ns (5%) |            |  624 bytes (1%) |          23 |
| `["uncertain", "log"]`               | 558.321 ns (5%) |            |  672 bytes (1%) |          24 |
| `["uncertain", "zeta"]`              | 454.503 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 840.412 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "mean - all different"]` |    2.214 s (5%) |   7.186 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 208.420 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 294.302 ms (5%) |  15.894 ms | 764.16 MiB (1%) |       40006 |
| `["vector", "prod - all equal"]`     |  46.437 ms (5%) |  10.348 ms | 763.70 MiB (1%) |       30007 |
| `["vector", "sin"]`                  | 256.910 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "sin²+cos²"]`            |   1.022 ms (5%) |            |   2.14 MiB (1%) |       40003 |
| `["vector", "sqrt"]`                 | 229.919 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "sum - all different"]`  | 233.743 ms (5%) |            | 625.09 KiB (1%) |       10005 |
| `["vector", "sum - all equal"]`      |  50.755 μs (5%) |            | 156.39 KiB (1%) |           6 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.11.3
Commit d63adeda50d (2025-01-21 19:42 UTC)
Build Info:
  Official https://julialang.org/ release
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 24.04.2 LTS
  uname: Linux 6.11.0-1015-azure #15~24.04.1-Ubuntu SMP Thu May  1 02:52:08 UTC 2025 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        660 s          0 s         93 s       3042 s          0 s
       #2     0 MHz       1018 s          0 s         91 s       2704 s          0 s
       #3     0 MHz        554 s          0 s         82 s       3142 s          0 s
       #4     0 MHz        676 s          0 s         88 s       2982 s          0 s
  Memory: 15.620765686035156 GB (11654.58984375 MB free)
  Uptime: 387.17 sec
  Load Avg:  1.05  0.73  0.33
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver3)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 21 Jun 2025 - 20:54
* Package commit: f4bbae
* Julia commit: d63ade
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
| `["base", "create"]`                 |   9.036 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  31.225 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  18.691 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  18.681 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  31.084 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  87.443 μs (5%) |            | 271.19 KiB (1%) |        5643 |
| `["quadgk", "int1"]`                 |   1.151 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    1.588 s (5%) | 174.941 ms |   2.82 GiB (1%) |    59960357 |
| `["specfun", "gamma"]`               | 114.326 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 553.212 ns (5%) |            |  624 bytes (1%) |          23 |
| `["uncertain", "log"]`               | 578.620 ns (5%) |            |  672 bytes (1%) |          24 |
| `["uncertain", "zeta"]`              | 453.792 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 841.103 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "mean - all different"]` |    2.235 s (5%) |   5.144 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 209.552 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 285.777 ms (5%) |  14.026 ms | 764.16 MiB (1%) |       40006 |
| `["vector", "prod - all equal"]`     |  47.264 ms (5%) |   9.116 ms | 763.70 MiB (1%) |       30007 |
| `["vector", "sin"]`                  | 257.761 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "sin²+cos²"]`            |   1.014 ms (5%) |            |   2.14 MiB (1%) |       40003 |
| `["vector", "sqrt"]`                 | 229.679 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "sum - all different"]`  | 222.181 ms (5%) |            | 625.09 KiB (1%) |       10005 |
| `["vector", "sum - all equal"]`      |  55.334 μs (5%) |            | 156.39 KiB (1%) |           6 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.11.3
Commit d63adeda50d (2025-01-21 19:42 UTC)
Build Info:
  Official https://julialang.org/ release
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 24.04.2 LTS
  uname: Linux 6.11.0-1015-azure #15~24.04.1-Ubuntu SMP Thu May  1 02:52:08 UTC 2025 x86_64 x86_64
  CPU: AMD EPYC 7763 64-Core Processor: 
              speed         user         nice          sys         idle          irq
       #1     0 MHz        823 s          0 s         99 s       3662 s          0 s
       #2     0 MHz       1106 s          0 s        102 s       3394 s          0 s
       #3     0 MHz        673 s          0 s         88 s       3806 s          0 s
       #4     0 MHz       1074 s          0 s        106 s       3355 s          0 s
  Memory: 15.620765686035156 GB (11704.5625 MB free)
  Uptime: 466.2 sec
  Load Avg:  1.06  0.81  0.39
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

    Architecture:                         x86_64
    CPU op-mode(s):                       32-bit, 64-bit
    Address sizes:                        48 bits physical, 48 bits virtual
    Byte Order:                           Little Endian
    CPU(s):                               4
    On-line CPU(s) list:                  0-3
    Vendor ID:                            AuthenticAMD
    Model name:                           AMD EPYC 7763 64-Core Processor
    CPU family:                           25
    Model:                                1
    Thread(s) per core:                   2
    Core(s) per socket:                   2
    Socket(s):                            1
    Stepping:                             1
    BogoMIPS:                             4890.84
    Flags:                                fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ht syscall nx mmxext fxsr_opt pdpe1gb rdtscp lm constant_tsc rep_good nopl tsc_reliable nonstop_tsc cpuid extd_apicid aperfmperf tsc_known_freq pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm cmp_legacy svm cr8_legacy abm sse4a misalignsse 3dnowprefetch osvw topoext vmmcall fsgsbase bmi1 avx2 smep bmi2 erms invpcid rdseed adx smap clflushopt clwb sha_ni xsaveopt xsavec xgetbv1 xsaves user_shstk clzero xsaveerptr rdpru arat npt nrip_save tsc_scale vmcb_clean flushbyasid decodeassists pausefilter pfthreshold v_vmsave_vmload umip vaes vpclmulqdq rdpid fsrm
    Virtualization:                       AMD-V
    Hypervisor vendor:                    Microsoft
    Virtualization type:                  full
    L1d cache:                            64 KiB (2 instances)
    L1i cache:                            64 KiB (2 instances)
    L2 cache:                             1 MiB (2 instances)
    L3 cache:                             32 MiB (1 instance)
    NUMA node(s):                         1
    NUMA node0 CPU(s):                    0-3
    Vulnerability Gather data sampling:   Not affected
    Vulnerability Itlb multihit:          Not affected
    Vulnerability L1tf:                   Not affected
    Vulnerability Mds:                    Not affected
    Vulnerability Meltdown:               Not affected
    Vulnerability Mmio stale data:        Not affected
    Vulnerability Reg file data sampling: Not affected
    Vulnerability Retbleed:               Not affected
    Vulnerability Spec rstack overflow:   Vulnerable: Safe RET, no microcode
    Vulnerability Spec store bypass:      Vulnerable
    Vulnerability Spectre v1:             Mitigation; usercopy/swapgs barriers and __user pointer sanitization
    Vulnerability Spectre v2:             Mitigation; Retpolines; STIBP disabled; RSB filling; PBRSB-eIBRS Not affected; BHI Not affected
    Vulnerability Srbds:                  Not affected
    Vulnerability Tsx async abort:        Not affected
    

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

