# Benchmark result

* Pull request commit: [`7030578e39aa6f644a88fa032942258c77ac11f7`](https://github.com/JuliaPhysics/Measurements.jl/commit/7030578e39aa6f644a88fa032942258c77ac11f7)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/111> (Deprecate `factorial(::Measurement)`)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 14 Dec 2021 - 14:50
    - Baseline: 14 Dec 2021 - 14:51
* Package commits:
    - Target: 6f3d15
    - Baseline: ba5644
* Julia commits:
    - Target: 3bf9d1
    - Baseline: 3bf9d1
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
Julia Version 1.7.0
Commit 3bf9d17731 (2021-11-30 12:12 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.3 LTS
  uname: Linux 5.11.0-1022-azure #23~20.04.1-Ubuntu SMP Fri Nov 19 10:20:52 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz        303 s          1 s        108 s       3674 s          0 s
       #2  2294 MHz       2149 s          1 s        122 s       1852 s          0 s
       
  Memory: 6.788982391357422 GB (3684.2421875 MB free)
  Uptime: 415.42 sec
  Load Avg:  1.08  0.67  0.3
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, broadwell)
```

### Baseline
```
Julia Version 1.7.0
Commit 3bf9d17731 (2021-11-30 12:12 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.3 LTS
  uname: Linux 5.11.0-1022-azure #23~20.04.1-Ubuntu SMP Fri Nov 19 10:20:52 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz        355 s          1 s        113 s       4544 s          0 s
       #2  2294 MHz       3032 s          1 s        135 s       1889 s          0 s
       
  Memory: 6.788982391357422 GB (3539.0546875 MB free)
  Uptime: 508.76 sec
  Load Avg:  1.09  0.79  0.38
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, broadwell)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 14 Dec 2021 - 14:50
* Package commit: 6f3d15
* Julia commit: 3bf9d1
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
| `["base", "sin"]`                    |  20.541 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  20.541 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  35.045 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  17.000 μs (5%) |           |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.330 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 433.773 ms (5%) |  9.943 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               |  98.941 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 748.342 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 578.261 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.090 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 823.405 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.050 s (5%) | 12.817 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 239.501 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 563.494 ms (5%) | 20.300 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 134.323 ms (5%) | 17.057 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 305.202 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.111 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 247.001 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 387.843 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 110.701 μs (5%) |           | 156.39 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.7.0
Commit 3bf9d17731 (2021-11-30 12:12 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.3 LTS
  uname: Linux 5.11.0-1022-azure #23~20.04.1-Ubuntu SMP Fri Nov 19 10:20:52 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz        303 s          1 s        108 s       3674 s          0 s
       #2  2294 MHz       2149 s          1 s        122 s       1852 s          0 s
       
  Memory: 6.788982391357422 GB (3684.2421875 MB free)
  Uptime: 415.42 sec
  Load Avg:  1.08  0.67  0.3
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, broadwell)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 14 Dec 2021 - 14:51
* Package commit: ba5644
* Julia commit: 3bf9d1
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
| `["base", "multiplication"]`         |  34.844 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  23.146 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  23.146 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  34.642 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  16.900 μs (5%) |           |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.300 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 429.226 ms (5%) | 10.861 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               |  98.941 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 736.667 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 591.853 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.090 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 817.005 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.095 s (5%) | 11.404 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 237.701 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 572.039 ms (5%) | 12.884 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 135.658 ms (5%) | 13.698 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 308.902 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.101 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 247.201 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 396.692 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 107.701 μs (5%) |           | 156.39 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.7.0
Commit 3bf9d17731 (2021-11-30 12:12 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.3 LTS
  uname: Linux 5.11.0-1022-azure #23~20.04.1-Ubuntu SMP Fri Nov 19 10:20:52 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz: 
              speed         user         nice          sys         idle          irq
       #1  2294 MHz        355 s          1 s        113 s       4544 s          0 s
       #2  2294 MHz       3032 s          1 s        135 s       1889 s          0 s
       
  Memory: 6.788982391357422 GB (3539.0546875 MB free)
  Uptime: 508.76 sec
  Load Avg:  1.09  0.79  0.38
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
    CPU MHz:                         2294.683
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

