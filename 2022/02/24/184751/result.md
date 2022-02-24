# Benchmark result

* Pull request commit: [`0db5f62c9d23bdacefe460ca2e15db7948a563fa`](https://github.com/JuliaPhysics/Measurements.jl/commit/0db5f62c9d23bdacefe460ca2e15db7948a563fa)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/115> (add Aqua test & fix all ambiguities and unbound args)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 24 Feb 2022 - 18:45
    - Baseline: 24 Feb 2022 - 18:47
* Package commits:
    - Target: 9b0857
    - Baseline: c79947
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
| `["base", "create"]`                 |                1.24 (5%) :x: |   1.00 (1%)  |
| `["base", "multiplication"]`         | 0.86 (5%) :white_check_mark: |   1.00 (1%)  |
| `["base", "sin"]`                    | 0.84 (5%) :white_check_mark: |   1.00 (1%)  |
| `["base", "sqrt"]`                   |                1.10 (5%) :x: |   1.00 (1%)  |
| `["quadgk", "cos"]`                  |                1.12 (5%) :x: |   1.00 (1%)  |
| `["quadgk", "int1"]`                 |                1.19 (5%) :x: |   1.00 (1%)  |
| `["specfun", "gamma"]`               | 0.85 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "gamma"]`                | 0.94 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "mean - all equal"]`     |                1.08 (5%) :x: |   1.00 (1%)  |
| `["vector", "sin²+cos²"]`            | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  | 0.85 (5%) :white_check_mark: |   1.00 (1%)  |
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
Julia Version 1.7.2
Commit bf53498635 (2022-02-06 15:21 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.3 LTS
  uname: Linux 5.11.0-1028-azure #31~20.04.2-Ubuntu SMP Tue Jan 18 08:46:15 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz        408 s          0 s         96 s       4433 s          0 s
       #2  2095 MHz       2212 s          0 s        115 s       2641 s          0 s
       
  Memory: 6.7845458984375 GB (3878.546875 MB free)
  Uptime: 500.13 sec
  Load Avg:  1.0  0.67  0.32
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
      Ubuntu 20.04.3 LTS
  uname: Linux 5.11.0-1028-azure #31~20.04.2-Ubuntu SMP Tue Jan 18 08:46:15 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz        483 s          0 s        102 s       5345 s          0 s
       #2  2095 MHz       3122 s          0 s        133 s       2710 s          0 s
       
  Memory: 6.7845458984375 GB (3896.97265625 MB free)
  Uptime: 599.89 sec
  Load Avg:  1.02  0.78  0.4
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, skylake-avx512)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 24 Feb 2022 - 18:45
* Package commit: 9b0857
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
| `["base", "create"]`                 |  11.312 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  34.143 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  21.810 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  21.587 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  35.522 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  16.401 μs (5%) |           |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.540 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 476.475 ms (5%) | 10.629 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               | 109.804 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 580.177 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 580.771 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.450 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 894.055 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    4.008 s (5%) | 12.193 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 246.116 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 534.051 ms (5%) | 12.637 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 109.591 ms (5%) | 11.134 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 301.419 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.112 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 258.716 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 412.127 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 104.006 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
      Ubuntu 20.04.3 LTS
  uname: Linux 5.11.0-1028-azure #31~20.04.2-Ubuntu SMP Tue Jan 18 08:46:15 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz        408 s          0 s         96 s       4433 s          0 s
       #2  2095 MHz       2212 s          0 s        115 s       2641 s          0 s
       
  Memory: 6.7845458984375 GB (3878.546875 MB free)
  Uptime: 500.13 sec
  Load Avg:  1.0  0.67  0.32
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, skylake-avx512)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 24 Feb 2022 - 18:47
* Package commit: c79947
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
| `["base", "create"]`                 |   9.110 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  39.902 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  25.830 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  19.579 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  34.210 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  14.701 μs (5%) |           |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.290 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 484.164 ms (5%) | 10.542 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               | 128.499 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 587.270 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 588.110 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.460 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 953.358 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.988 s (5%) | 10.971 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 228.512 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 510.816 ms (5%) | 10.584 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 107.249 ms (5%) |  9.486 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 308.819 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.275 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 247.715 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 487.235 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      |  94.405 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
      Ubuntu 20.04.3 LTS
  uname: Linux 5.11.0-1028-azure #31~20.04.2-Ubuntu SMP Tue Jan 18 08:46:15 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz        483 s          0 s        102 s       5345 s          0 s
       #2  2095 MHz       3122 s          0 s        133 s       2710 s          0 s
       
  Memory: 6.7845458984375 GB (3896.97265625 MB free)
  Uptime: 599.89 sec
  Load Avg:  1.02  0.78  0.4
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
    Model name:                      Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz
    Stepping:                        4
    CPU MHz:                         2095.194
    BogoMIPS:                        4190.38
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
    Vulnerability Spectre v2:        Mitigation; Full generic retpoline, STIBP disabled, RSB filling
    Vulnerability Srbds:             Not affected
    Vulnerability Tsx async abort:   Mitigation; Clear CPU buffers; SMT Host state unknown
    Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt avx512cd avx512bw avx512vl xsaveopt xsavec xsaves md_clear
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz           |
| Vendor             | :Intel                                                  |
| Architecture       | :Skylake                                                |
| Model              | Family: 0x06, Model: 0x55, Stepping: 0x04, Type: 0x00   |
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

