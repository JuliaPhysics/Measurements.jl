# Benchmark result

* Pull request commit: [`c5c61a154d27b75f2101c6527c31da3412ae89da`](https://github.com/JuliaPhysics/Measurements.jl/commit/c5c61a154d27b75f2101c6527c31da3412ae89da)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/181> (CompatHelper: bump compat for Makie in [weakdeps] to 0.23, (keep existing compat))

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 11 Jun 2025 - 20:55
    - Baseline: 11 Jun 2025 - 20:56
* Package commits:
    - Target: b6ce5b
    - Baseline: ece302
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
| `["quadgk", "sin"]`                  |                1.17 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all different"]` |                1.05 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sum - all equal"]`      |                1.06 (5%) :x: |   1.00 (1%)  |

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
       #1     0 MHz        758 s          0 s         96 s       1970 s          0 s
       #2     0 MHz       1136 s          0 s        100 s       1607 s          0 s
       #3     0 MHz        610 s          0 s         84 s       2115 s          0 s
       #4     0 MHz        499 s          0 s         87 s       2222 s          0 s
  Memory: 15.620769500732422 GB (11537.53515625 MB free)
  Uptime: 290.86 sec
  Load Avg:  1.11  0.93  0.44
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
       #1     0 MHz        896 s          0 s        108 s       2622 s          0 s
       #2     0 MHz       1274 s          0 s        106 s       2267 s          0 s
       #3     0 MHz        801 s          0 s         91 s       2720 s          0 s
       #4     0 MHz        827 s          0 s        102 s       2684 s          0 s
  Memory: 15.620769500732422 GB (11597.984375 MB free)
  Uptime: 371.35 sec
  Load Avg:  1.03  0.95  0.49
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver3)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 11 Jun 2025 - 20:55
* Package commit: b6ce5b
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
| `["base", "create"]`                 |   9.016 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  31.589 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  18.581 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  18.611 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  31.256 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  88.367 μs (5%) |            | 271.19 KiB (1%) |        5643 |
| `["quadgk", "int1"]`                 |   1.150 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    1.931 s (5%) | 283.259 ms |   2.82 GiB (1%) |    59960357 |
| `["specfun", "gamma"]`               | 114.666 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 560.140 ns (5%) |            |  624 bytes (1%) |          23 |
| `["uncertain", "log"]`               | 560.462 ns (5%) |            |  672 bytes (1%) |          24 |
| `["uncertain", "zeta"]`              | 454.457 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 839.479 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "mean - all different"]` |    2.239 s (5%) |   7.914 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 212.109 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 279.244 ms (5%) |  17.205 ms | 764.16 MiB (1%) |       40006 |
| `["vector", "prod - all equal"]`     |  50.772 ms (5%) |  10.858 ms | 763.70 MiB (1%) |       30007 |
| `["vector", "sin"]`                  | 260.571 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "sin²+cos²"]`            |   1.047 ms (5%) |            |   2.14 MiB (1%) |       40003 |
| `["vector", "sqrt"]`                 | 232.197 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "sum - all different"]`  | 214.377 ms (5%) |            | 625.09 KiB (1%) |       10005 |
| `["vector", "sum - all equal"]`      |  53.701 μs (5%) |            | 156.39 KiB (1%) |           6 |

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
       #1     0 MHz        758 s          0 s         96 s       1970 s          0 s
       #2     0 MHz       1136 s          0 s        100 s       1607 s          0 s
       #3     0 MHz        610 s          0 s         84 s       2115 s          0 s
       #4     0 MHz        499 s          0 s         87 s       2222 s          0 s
  Memory: 15.620769500732422 GB (11537.53515625 MB free)
  Uptime: 290.86 sec
  Load Avg:  1.11  0.93  0.44
  WORD_SIZE: 64
  LLVM: libLLVM-16.0.6 (ORCJIT, znver3)
Threads: 1 default, 0 interactive, 1 GC (on 4 virtual cores)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 11 Jun 2025 - 20:56
* Package commit: ece302
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
| `["base", "create"]`                 |   9.317 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  31.407 ns (5%) |            |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  18.923 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  18.932 ns (5%) |            |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  31.145 ns (5%) |            |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  87.123 μs (5%) |            | 271.19 KiB (1%) |        5643 |
| `["quadgk", "int1"]`                 |   1.147 μs (5%) |            |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    1.657 s (5%) | 199.474 ms |   2.82 GiB (1%) |    59960357 |
| `["specfun", "gamma"]`               | 114.983 ns (5%) |            |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 548.231 ns (5%) |            |  624 bytes (1%) |          23 |
| `["uncertain", "log"]`               | 575.755 ns (5%) |            |  672 bytes (1%) |          24 |
| `["uncertain", "zeta"]`              | 454.000 ns (5%) |            |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 834.530 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "mean - all different"]` |    2.264 s (5%) |   6.164 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 206.649 μs (5%) |            | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 264.931 ms (5%) |  14.340 ms | 764.16 MiB (1%) |       40006 |
| `["vector", "prod - all equal"]`     |  53.225 ms (5%) |   9.766 ms | 763.70 MiB (1%) |       30007 |
| `["vector", "sin"]`                  | 259.669 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "sin²+cos²"]`            |   1.026 ms (5%) |            |   2.14 MiB (1%) |       40003 |
| `["vector", "sqrt"]`                 | 230.313 μs (5%) |            | 781.31 KiB (1%) |       10003 |
| `["vector", "sum - all different"]`  | 233.479 ms (5%) |            | 625.09 KiB (1%) |       10005 |
| `["vector", "sum - all equal"]`      |  50.655 μs (5%) |            | 156.39 KiB (1%) |           6 |

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
       #1     0 MHz        896 s          0 s        108 s       2622 s          0 s
       #2     0 MHz       1274 s          0 s        106 s       2267 s          0 s
       #3     0 MHz        801 s          0 s         91 s       2720 s          0 s
       #4     0 MHz        827 s          0 s        102 s       2684 s          0 s
  Memory: 15.620769500732422 GB (11597.984375 MB free)
  Uptime: 371.35 sec
  Load Avg:  1.03  0.95  0.49
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

