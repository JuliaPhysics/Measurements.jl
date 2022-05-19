# Benchmark result

* Pull request commit: [`d2ada3dc966df5e022e1a0482027655329de0e78`](https://github.com/JuliaPhysics/Measurements.jl/commit/d2ada3dc966df5e022e1a0482027655329de0e78)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/120> (Fix computation of norms of `AbstractArray{<:Measurement}`)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 19 May 2022 - 00:02
    - Baseline: 19 May 2022 - 00:04
* Package commits:
    - Target: f8cf42
    - Baseline: 6bd561
* Julia commits:
    - Target: bf5349
    - Baseline: bf5349
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
| `["base", "sin"]`                    | 0.89 (5%) :white_check_mark: |   1.00 (1%)  |
| `["base", "sqrt"]`                   | 0.89 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "prod - all different"]` | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "prod - all equal"]`     |                1.11 (5%) :x: |   1.00 (1%)  |
| `["vector", "sqrt"]`                 | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |

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
Julia Version 1.7.2
Commit bf53498635 (2022-02-06 15:21 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.4 LTS
  uname: Linux 5.13.0-1022-azure #26~20.04.1-Ubuntu SMP Thu Apr 7 19:42:45 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz        708 s          4 s        118 s       5074 s          0 s
       #2  2294 MHz       1855 s          1 s        135 s       3924 s          0 s
       
  Memory: 6.783607482910156 GB (3431.1875 MB free)
  Uptime: 596.01 sec
  Load Avg:  1.0  0.64  0.29
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, broadwell)
```

### Baseline
```
Julia Version 1.7.2
Commit bf53498635 (2022-02-06 15:21 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.4 LTS
  uname: Linux 5.13.0-1022-azure #26~20.04.1-Ubuntu SMP Thu Apr 7 19:42:45 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz        731 s          4 s        121 s       6025 s          0 s
       #2  2294 MHz       2797 s          1 s        156 s       3941 s          0 s
       
  Memory: 6.783607482910156 GB (3446.32421875 MB free)
  Uptime: 694.09 sec
  Load Avg:  1.14  0.79  0.38
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 19 May 2022 - 0:2
* Package commit: f8cf42
* Julia commit: bf5349
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
| `["base", "create"]`                 |   7.900 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  35.750 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  20.562 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  20.662 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  35.952 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  14.700 μs (5%) |           |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.310 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 401.759 ms (5%) | 12.270 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               |  99.049 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 747.508 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 586.746 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.090 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 829.805 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.251 s (5%) | 15.382 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 239.201 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 563.798 ms (5%) | 20.062 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 159.949 ms (5%) | 20.332 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 309.302 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.136 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 233.602 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 398.384 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 113.501 μs (5%) |           | 156.39 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.7.2
Commit bf53498635 (2022-02-06 15:21 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.4 LTS
  uname: Linux 5.13.0-1022-azure #26~20.04.1-Ubuntu SMP Thu Apr 7 19:42:45 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz        708 s          4 s        118 s       5074 s          0 s
       #2  2294 MHz       1855 s          1 s        135 s       3924 s          0 s
       
  Memory: 6.783607482910156 GB (3431.1875 MB free)
  Uptime: 596.01 sec
  Load Avg:  1.0  0.64  0.29
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 19 May 2022 - 0:4
* Package commit: 6bd561
* Julia commit: bf5349
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
| `["base", "create"]`                 |   7.900 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  34.945 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  23.170 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  23.170 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  34.644 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  14.700 μs (5%) |           |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.300 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 403.272 ms (5%) | 11.019 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               |  99.049 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 746.675 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 583.431 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.100 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 823.108 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.165 s (5%) | 12.460 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 240.702 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 598.457 ms (5%) | 17.572 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 144.449 ms (5%) | 14.746 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 303.604 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.125 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 248.503 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 428.009 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 108.701 μs (5%) |           | 156.39 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.7.2
Commit bf53498635 (2022-02-06 15:21 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.4 LTS
  uname: Linux 5.13.0-1022-azure #26~20.04.1-Ubuntu SMP Thu Apr 7 19:42:45 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz        731 s          4 s        121 s       6025 s          0 s
       #2  2294 MHz       2797 s          1 s        156 s       3941 s          0 s
       
  Memory: 6.783607482910156 GB (3446.32421875 MB free)
  Uptime: 694.09 sec
  Load Avg:  1.14  0.79  0.38
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, broadwell)
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
    CPU MHz:                         2294.685
    BogoMIPS:                        4589.37
    Hypervisor vendor:               Microsoft
    Virtualization type:             full
    L1d cache:                       64 KiB
    L1i cache:                       64 KiB
    L2 cache:                        512 KiB
    L3 cache:                        50 MiB
    NUMA node0 CPU(s):               0,1
    Vulnerability Itlb multihit:     KVM: Mitigation: VMX unsupported
    Vulnerability L1tf:              Mitigation; PTE Inversion
    Vulnerability Mds:               Mitigation; Clear CPU buffers; SMT Host state unknown
    Vulnerability Meltdown:          Mitigation; PTI
    Vulnerability Spec store bypass: Vulnerable
    Vulnerability Spectre v1:        Mitigation; usercopy/swapgs barriers and __user pointer sanitization
    Vulnerability Spectre v2:        Mitigation; Retpolines, STIBP disabled, RSB filling
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
|                    | No Hyperthreading hardware capability detected          |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 256, 51200) kbytes                     |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 46 bits physical                       |
| SIMD               | 256 bit = 32 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

