# Benchmark result

* Pull request commit: [`cf0e64194bed12dc5d57bad6871a4d82e31207f9`](https://github.com/JuliaPhysics/Measurements.jl/commit/cf0e64194bed12dc5d57bad6871a4d82e31207f9)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/147> (Reorder sections of `Project.toml` to make Aqua happy)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 28 May 2023 - 16:54
    - Baseline: 28 May 2023 - 16:56
* Package commits:
    - Target: 31598d
    - Baseline: 0b54af
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
| `["base", "sqrt"]`                   |                1.08 (5%) :x: |   1.00 (1%)  |
| `["vector", "sin²+cos²"]`            | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  | 0.86 (5%) :white_check_mark: |   1.00 (1%)  |

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
      Ubuntu 22.04.2 LTS
  uname: Linux 5.15.0-1037-azure #44-Ubuntu SMP Thu Apr 20 13:19:31 UTC 2023 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz       2153 s          0 s        130 s       1299 s          0 s
       #2  2593 MHz        394 s          0 s        134 s       3016 s          0 s
  Memory: 6.781208038330078 GB (4931.65234375 MB free)
  Uptime: 361.79 sec
  Load Avg:  1.04  0.77  0.36
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

### Baseline
```
Julia Version 1.8.5
Commit 17cfb8e65ea (2023-01-08 06:45 UTC)
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 22.04.2 LTS
  uname: Linux 5.15.0-1037-azure #44-Ubuntu SMP Thu Apr 20 13:19:31 UTC 2023 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz       2989 s          0 s        141 s       1328 s          0 s
       #2  2593 MHz        427 s          0 s        138 s       3852 s          0 s
  Memory: 6.781208038330078 GB (5008.9375 MB free)
  Uptime: 449.4 sec
  Load Avg:  1.01  0.83  0.42
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 28 May 2023 - 16:54
* Package commit: 31598d
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

| ID                                   | time            | GC time   | memory          | allocations |
|--------------------------------------|----------------:|----------:|----------------:|------------:|
| `["base", "create"]`                 |  14.815 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  41.979 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  23.795 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  25.803 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  42.080 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  | 115.303 μs (5%) |           | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.380 μs (5%) |           |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    2.967 s (5%) |   1.165 s |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 138.661 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 711.362 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 715.687 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 659.248 ns (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 977.725 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.367 s (5%) | 10.124 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 290.407 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 496.550 ms (5%) | 11.620 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 103.539 ms (5%) | 10.417 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 333.008 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.347 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 268.906 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 341.227 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 119.703 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
      Ubuntu 22.04.2 LTS
  uname: Linux 5.15.0-1037-azure #44-Ubuntu SMP Thu Apr 20 13:19:31 UTC 2023 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz       2153 s          0 s        130 s       1299 s          0 s
       #2  2593 MHz        394 s          0 s        134 s       3016 s          0 s
  Memory: 6.781208038330078 GB (4931.65234375 MB free)
  Uptime: 361.79 sec
  Load Avg:  1.04  0.77  0.36
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 28 May 2023 - 16:56
* Package commit: 0b54af
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

| ID                                   | time            | GC time  | memory          | allocations |
|--------------------------------------|----------------:|---------:|----------------:|------------:|
| `["base", "create"]`                 |  14.815 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  42.282 ns (5%) |          |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  23.896 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  23.897 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  41.676 ns (5%) |          |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  | 115.703 μs (5%) |          | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.370 μs (5%) |          |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    2.967 s (5%) |  1.175 s |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 139.008 ns (5%) |          |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 721.291 ns (5%) |          |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 728.381 ns (5%) |          |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 654.790 ns (5%) |          |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 969.125 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.373 s (5%) | 7.627 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 293.307 μs (5%) |          | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 506.444 ms (5%) | 9.807 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     |  99.057 ms (5%) | 8.297 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 325.508 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.444 ms (5%) |          |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 258.907 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 395.150 ms (5%) |          | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 125.504 μs (5%) |          | 156.39 KiB (1%) |           5 |

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
      Ubuntu 22.04.2 LTS
  uname: Linux 5.15.0-1037-azure #44-Ubuntu SMP Thu Apr 20 13:19:31 UTC 2023 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz       2989 s          0 s        141 s       1328 s          0 s
       #2  2593 MHz        427 s          0 s        138 s       3852 s          0 s
  Memory: 6.781208038330078 GB (5008.9375 MB free)
  Uptime: 449.4 sec
  Load Avg:  1.01  0.83  0.42
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

---
# Runtime information
| Runtime Info | |
|:--|:--|
| BLAS #threads | 1 |
| `BLAS.vendor()` | `openblas64` |
| `Sys.CPU_THREADS` | 2 |

`lscpu` output:

    Architecture:                    x86_64
    CPU op-mode(s):                  32-bit, 64-bit
    Address sizes:                   46 bits physical, 48 bits virtual
    Byte Order:                      Little Endian
    CPU(s):                          2
    On-line CPU(s) list:             0,1
    Vendor ID:                       GenuineIntel
    Model name:                      Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz
    CPU family:                      6
    Model:                           85
    Thread(s) per core:              1
    Core(s) per socket:              2
    Socket(s):                       1
    Stepping:                        7
    BogoMIPS:                        5187.81
    Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm avx512f avx512dq rdseed adx smap clflushopt avx512cd avx512bw avx512vl xsaveopt xsavec xsaves md_clear
    Hypervisor vendor:               Microsoft
    Virtualization type:             full
    L1d cache:                       64 KiB (2 instances)
    L1i cache:                       64 KiB (2 instances)
    L2 cache:                        2 MiB (2 instances)
    L3 cache:                        35.8 MiB (1 instance)
    NUMA node(s):                    1
    NUMA node0 CPU(s):               0,1
    Vulnerability Itlb multihit:     KVM: Mitigation: VMX unsupported
    Vulnerability L1tf:              Mitigation; PTE Inversion
    Vulnerability Mds:               Mitigation; Clear CPU buffers; SMT Host state unknown
    Vulnerability Meltdown:          Mitigation; PTI
    Vulnerability Mmio stale data:   Vulnerable: Clear CPU buffers attempted, no microcode; SMT Host state unknown
    Vulnerability Retbleed:          Vulnerable
    Vulnerability Spec store bypass: Vulnerable
    Vulnerability Spectre v1:        Mitigation; usercopy/swapgs barriers and __user pointer sanitization
    Vulnerability Spectre v2:        Mitigation; Retpolines, STIBP disabled, RSB filling, PBRSB-eIBRS Not affected
    Vulnerability Srbds:             Not affected
    Vulnerability Tsx async abort:   Mitigation; Clear CPU buffers; SMT Host state unknown
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz          |
| Vendor             | :Intel                                                  |
| Architecture       | :Skylake                                                |
| Model              | Family: 0x06, Model: 0x55, Stepping: 0x07, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading hardware capability detected          |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (32, 1024, 36608) kbytes                    |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 46 bits physical                       |
| SIMD               | 512 bit = 64 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |

