# Benchmark result

* Pull request commit: [`19789b46e933c3d05d850705300c2dd9b0bae35e`](https://github.com/JuliaPhysics/Measurements.jl/commit/19789b46e933c3d05d850705300c2dd9b0bae35e)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/120> (Fix computation of norms of `AbstractArray{<:Measurement}`)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 18 May 2022 - 23:55
    - Baseline: 18 May 2022 - 23:57
* Package commits:
    - Target: 4dd6b7
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
| `["base", "create"]`                 | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "prod - all different"]` | 0.88 (5%) :white_check_mark: |   1.00 (1%)  |

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
  uname: Linux 5.13.0-1023-azure #27~20.04.1-Ubuntu SMP Mon Apr 25 22:39:07 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz        379 s          0 s         91 s       5754 s          0 s
       #2  2593 MHz       2018 s          0 s        112 s       4106 s          0 s
       
  Memory: 6.783603668212891 GB (3428.09765625 MB free)
  Uptime: 628.64 sec
  Load Avg:  1.04  0.64  0.27
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, skylake-avx512)
```

### Baseline
```
Julia Version 1.7.2
Commit bf53498635 (2022-02-06 15:21 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.4 LTS
  uname: Linux 5.13.0-1023-azure #27~20.04.1-Ubuntu SMP Mon Apr 25 22:39:07 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz        398 s          0 s         94 s       6630 s          0 s
       #2  2593 MHz       2895 s          0 s        123 s       4121 s          0 s
       
  Memory: 6.783603668212891 GB (3527.54296875 MB free)
  Uptime: 718.9 sec
  Load Avg:  1.04  0.75  0.35
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, skylake-avx512)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 18 May 2022 - 23:55
* Package commit: 4dd6b7
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
| `["base", "create"]`                 |   8.700 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  39.617 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  23.293 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  23.270 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  39.052 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  17.900 μs (5%) |           |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.520 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 429.145 ms (5%) |  9.189 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               | 131.830 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 686.093 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 704.145 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.500 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 964.707 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.401 s (5%) | 11.695 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 275.302 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 451.824 ms (5%) | 11.627 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 101.273 ms (5%) |  9.528 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 333.702 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.264 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 256.202 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 417.428 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 110.401 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
  uname: Linux 5.13.0-1023-azure #27~20.04.1-Ubuntu SMP Mon Apr 25 22:39:07 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz        379 s          0 s         91 s       5754 s          0 s
       #2  2593 MHz       2018 s          0 s        112 s       4106 s          0 s
       
  Memory: 6.783603668212891 GB (3428.09765625 MB free)
  Uptime: 628.64 sec
  Load Avg:  1.04  0.64  0.27
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, skylake-avx512)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 18 May 2022 - 23:57
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
| `["base", "create"]`                 |   9.500 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  39.516 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  23.293 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  23.470 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  39.253 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  17.800 μs (5%) |           |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.530 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 430.752 ms (5%) |  9.380 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               | 132.620 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 678.821 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 689.662 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.490 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 958.512 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.396 s (5%) |  9.842 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 274.703 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 514.651 ms (5%) | 12.265 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     |  99.275 ms (5%) |  8.181 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 335.905 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.244 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 261.603 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 429.093 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 107.001 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
  uname: Linux 5.13.0-1023-azure #27~20.04.1-Ubuntu SMP Mon Apr 25 22:39:07 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz        398 s          0 s         94 s       6630 s          0 s
       #2  2593 MHz       2895 s          0 s        123 s       4121 s          0 s
       
  Memory: 6.783603668212891 GB (3527.54296875 MB free)
  Uptime: 718.9 sec
  Load Avg:  1.04  0.75  0.35
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, skylake-avx512)
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
    Model:                           85
    Model name:                      Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz
    Stepping:                        7
    CPU MHz:                         2593.907
    BogoMIPS:                        5187.81
    Hypervisor vendor:               Microsoft
    Virtualization type:             full
    L1d cache:                       64 KiB
    L1i cache:                       64 KiB
    L2 cache:                        2 MiB
    L3 cache:                        35.8 MiB
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
    Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm avx512f avx512dq rdseed adx smap clflushopt avx512cd avx512bw avx512vl xsaveopt xsavec xsaves md_clear
    

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

