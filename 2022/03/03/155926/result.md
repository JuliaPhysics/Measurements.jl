# Benchmark result

* Pull request commit: [`b365ed2f99c25a9ece05d4129c1ad27c410ea8dc`](https://github.com/JuliaPhysics/Measurements.jl/commit/b365ed2f99c25a9ece05d4129c1ad27c410ea8dc)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/116> (fix ambiguities on 1.8 & nightly)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 3 Mar 2022 - 15:57
    - Baseline: 3 Mar 2022 - 15:58
* Package commits:
    - Target: e17f4b
    - Baseline: d2edc8
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
| `["base", "create"]`                 | 0.89 (5%) :white_check_mark: |   1.00 (1%)  |
| `["base", "multiplication"]`         | 0.90 (5%) :white_check_mark: |   1.00 (1%)  |
| `["base", "sin"]`                    | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["base", "sqrt"]`                   | 0.88 (5%) :white_check_mark: |   1.00 (1%)  |
| `["quadgk", "cos"]`                  | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |
| `["uncertain", "atan"]`              |                1.17 (5%) :x: |   1.00 (1%)  |
| `["uncertain", "log"]`               | 0.90 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "prod - all equal"]`     | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sqrt"]`                 | 0.90 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  |                1.06 (5%) :x: |   1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       2213 s          2 s        121 s       2133 s          0 s
       #2  2294 MHz        562 s          1 s        108 s       3808 s          0 s
       
  Memory: 6.7845458984375 GB (3773.90625 MB free)
  Uptime: 453.32 sec
  Load Avg:  1.02  0.71  0.33
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
      Ubuntu 20.04.3 LTS
  uname: Linux 5.11.0-1028-azure #31~20.04.2-Ubuntu SMP Tue Jan 18 08:46:15 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       2309 s          2 s        127 s       3082 s          0 s
       #2  2294 MHz       1507 s          1 s        126 s       3900 s          0 s
       
  Memory: 6.7845458984375 GB (3723.265625 MB free)
  Uptime: 558.8 sec
  Load Avg:  1.0  0.8  0.41
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 3 Mar 2022 - 15:57
* Package commit: e17f4b
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
| `["base", "create"]`                 |   7.908 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  34.913 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  20.581 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  20.561 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  35.720 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  15.299 μs (5%) |           |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.340 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 503.985 ms (5%) | 12.273 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               |  98.699 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 865.657 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 579.135 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.090 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 852.895 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.650 s (5%) | 11.778 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 240.298 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 599.227 ms (5%) | 19.810 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 148.001 ms (5%) | 16.726 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 318.697 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.118 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 223.098 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 441.172 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 115.299 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       2213 s          2 s        121 s       2133 s          0 s
       #2  2294 MHz        562 s          1 s        108 s       3808 s          0 s
       
  Memory: 6.7845458984375 GB (3773.90625 MB free)
  Uptime: 453.32 sec
  Load Avg:  1.02  0.71  0.33
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 3 Mar 2022 - 15:58
* Package commit: d2edc8
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
| `["base", "create"]`                 |   8.909 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  38.648 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  23.694 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  23.370 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  37.235 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  16.400 μs (5%) |           |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.350 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 480.968 ms (5%) | 12.158 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               |  99.024 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 737.299 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 641.098 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.100 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 833.098 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.717 s (5%) | 13.209 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 239.100 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 623.319 ms (5%) | 20.781 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 156.538 ms (5%) | 16.450 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 323.298 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.122 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 247.598 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 417.291 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 109.999 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz       2309 s          2 s        127 s       3082 s          0 s
       #2  2294 MHz       1507 s          1 s        126 s       3900 s          0 s
       
  Memory: 6.7845458984375 GB (3723.265625 MB free)
  Uptime: 558.8 sec
  Load Avg:  1.0  0.8  0.41
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
    CPU MHz:                         2294.684
    BogoMIPS:                        4589.36
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
    Vulnerability Spectre v2:        Mitigation; Full generic retpoline, STIBP disabled, RSB filling
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

