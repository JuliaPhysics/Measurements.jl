# Benchmark result

* Pull request commit: [`e660cc8f0e0cfdafd51599afe3419a88fe57a848`](https://github.com/JuliaPhysics/Measurements.jl/commit/e660cc8f0e0cfdafd51599afe3419a88fe57a848)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/146> (Slim down docs in README, slightly expand introduction)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 28 May 2023 - 17:11
    - Baseline: 28 May 2023 - 17:12
* Package commits:
    - Target: 54436f
    - Baseline: 628aad
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
| `["vector", "sin²+cos²"]`            | 0.93 (5%) :white_check_mark: |   1.00 (1%)  |

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
       #1  2593 MHz        380 s          0 s        115 s       2868 s          0 s
       #2  2593 MHz       2138 s          0 s        148 s       1071 s          0 s
  Memory: 6.781208038330078 GB (4950.78515625 MB free)
  Uptime: 340.63 sec
  Load Avg:  1.01  0.71  0.33
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
       #1  2593 MHz        412 s          0 s        119 s       3696 s          0 s
       #2  2593 MHz       2966 s          0 s        159 s       1100 s          0 s
  Memory: 6.781208038330078 GB (5017.12109375 MB free)
  Uptime: 427.39 sec
  Load Avg:  1.0  0.79  0.4
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 28 May 2023 - 17:11
* Package commit: 54436f
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
| `["base", "create"]`                 |  14.615 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  41.978 ns (5%) |          |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  23.896 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  23.795 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  41.978 ns (5%) |          |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  | 115.801 μs (5%) |          | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.390 μs (5%) |          |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    2.993 s (5%) |  1.161 s |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 139.258 ns (5%) |          |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 720.430 ns (5%) |          |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 725.381 ns (5%) |          |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 659.883 ns (5%) |          |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 989.612 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.382 s (5%) | 9.855 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 289.903 μs (5%) |          | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 490.914 ms (5%) | 9.569 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     |  98.254 ms (5%) | 8.737 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 325.704 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.318 ms (5%) |          |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 262.403 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 337.616 ms (5%) |          | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 120.801 μs (5%) |          | 156.39 KiB (1%) |           5 |

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
       #1  2593 MHz        380 s          0 s        115 s       2868 s          0 s
       #2  2593 MHz       2138 s          0 s        148 s       1071 s          0 s
  Memory: 6.781208038330078 GB (4950.78515625 MB free)
  Uptime: 340.63 sec
  Load Avg:  1.01  0.71  0.33
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 28 May 2023 - 17:12
* Package commit: 628aad
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
| `["base", "create"]`                 |  14.715 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  42.180 ns (5%) |          |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  23.896 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  23.896 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  41.574 ns (5%) |          |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  | 113.301 μs (5%) |          | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.400 μs (5%) |          |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    3.005 s (5%) |  1.192 s |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 141.697 ns (5%) |          |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 723.246 ns (5%) |          |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 723.142 ns (5%) |          |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 656.796 ns (5%) |          |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 963.610 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.372 s (5%) | 9.705 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 294.303 μs (5%) |          | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 480.426 ms (5%) | 8.642 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     |  95.374 ms (5%) | 7.963 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 317.103 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.416 ms (5%) |          |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 258.602 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 349.302 ms (5%) |          | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 118.001 μs (5%) |          | 156.39 KiB (1%) |           5 |

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
       #1  2593 MHz        412 s          0 s        119 s       3696 s          0 s
       #2  2593 MHz       2966 s          0 s        159 s       1100 s          0 s
  Memory: 6.781208038330078 GB (5017.12109375 MB free)
  Uptime: 427.39 sec
  Load Avg:  1.0  0.79  0.4
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

