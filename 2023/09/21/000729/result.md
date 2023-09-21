# Benchmark result

* Pull request commit: [`4ff72734396aa821484625ffc1cac103c9204ef4`](https://github.com/JuliaPhysics/Measurements.jl/commit/4ff72734396aa821484625ffc1cac103c9204ef4)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/153> (Release v2.10.0)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 21 Sep 2023 - 00:05
    - Baseline: 21 Sep 2023 - 00:07
* Package commits:
    - Target: 9a17b2
    - Baseline: 553327
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

| ID                                   | time ratio    | memory ratio |
|--------------------------------------|---------------|--------------|
| `["base", "multiplication"]`         | 1.08 (5%) :x: |   1.00 (1%)  |
| `["base", "sum"]`                    | 1.07 (5%) :x: |   1.00 (1%)  |

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
      Ubuntu 22.04.3 LTS
  uname: Linux 6.2.0-1011-azure #11~22.04.1-Ubuntu SMP Wed Aug 23 19:26:19 UTC 2023 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8370C CPU @ 2.80GHz: 
              speed         user         nice          sys         idle          irq
       #1  2793 MHz       2126 s          0 s        106 s        374 s          0 s
       #2  2793 MHz        419 s          0 s        107 s       2075 s          0 s
  Memory: 6.759757995605469 GB (4947.9296875 MB free)
  Uptime: 266.63 sec
  Load Avg:  1.02  0.7  0.31
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, icelake-server)
  Threads: 1 on 2 virtual cores
```

### Baseline
```
Julia Version 1.8.5
Commit 17cfb8e65ea (2023-01-08 06:45 UTC)
Platform Info:
  OS: Linux (x86_64-linux-gnu)
      Ubuntu 22.04.3 LTS
  uname: Linux 6.2.0-1011-azure #11~22.04.1-Ubuntu SMP Wed Aug 23 19:26:19 UTC 2023 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8370C CPU @ 2.80GHz: 
              speed         user         nice          sys         idle          irq
       #1  2793 MHz       2790 s          0 s        116 s        551 s          0 s
       #2  2793 MHz        602 s          0 s        118 s       2732 s          0 s
  Memory: 6.759757995605469 GB (4950.265625 MB free)
  Uptime: 351.9 sec
  Load Avg:  1.0  0.78  0.38
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, icelake-server)
  Threads: 1 on 2 virtual cores
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 21 Sep 2023 - 0:5
* Package commit: 9a17b2
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
| `["base", "create"]`                 |  13.914 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  42.685 ns (5%) |          |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  21.866 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  22.969 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  41.675 ns (5%) |          |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  | 106.901 μs (5%) |          | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.360 μs (5%) |          |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    2.767 s (5%) |  1.024 s |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 153.884 ns (5%) |          |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 683.439 ns (5%) |          |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 692.667 ns (5%) |          |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 715.328 ns (5%) |          |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.017 ms (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.672 s (5%) | 7.934 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 264.901 μs (5%) |          | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 459.247 ms (5%) | 9.310 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 128.893 ms (5%) | 8.032 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 296.501 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.256 ms (5%) |          |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 245.201 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 345.124 ms (5%) |          | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 127.701 μs (5%) |          | 156.39 KiB (1%) |           5 |

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
      Ubuntu 22.04.3 LTS
  uname: Linux 6.2.0-1011-azure #11~22.04.1-Ubuntu SMP Wed Aug 23 19:26:19 UTC 2023 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8370C CPU @ 2.80GHz: 
              speed         user         nice          sys         idle          irq
       #1  2793 MHz       2126 s          0 s        106 s        374 s          0 s
       #2  2793 MHz        419 s          0 s        107 s       2075 s          0 s
  Memory: 6.759757995605469 GB (4947.9296875 MB free)
  Uptime: 266.63 sec
  Load Avg:  1.02  0.7  0.31
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, icelake-server)
  Threads: 1 on 2 virtual cores
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 21 Sep 2023 - 0:7
* Package commit: 553327
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
| `["base", "create"]`                 |  13.914 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  39.555 ns (5%) |          |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  22.166 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  22.166 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  39.051 ns (5%) |          |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  | 107.000 μs (5%) |          | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.350 μs (5%) |          |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    2.740 s (5%) |  1.014 s |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 153.760 ns (5%) |          |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 678.981 ns (5%) |          |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 700.000 ns (5%) |          |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 718.978 ns (5%) |          |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                |   1.016 ms (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.635 s (5%) | 6.441 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 265.601 μs (5%) |          | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 459.283 ms (5%) | 7.349 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 124.923 ms (5%) | 6.256 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 307.601 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.292 ms (5%) |          |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 247.800 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 330.646 ms (5%) |          | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 128.500 μs (5%) |          | 156.39 KiB (1%) |           5 |

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
      Ubuntu 22.04.3 LTS
  uname: Linux 6.2.0-1011-azure #11~22.04.1-Ubuntu SMP Wed Aug 23 19:26:19 UTC 2023 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8370C CPU @ 2.80GHz: 
              speed         user         nice          sys         idle          irq
       #1  2793 MHz       2790 s          0 s        116 s        551 s          0 s
       #2  2793 MHz        602 s          0 s        118 s       2732 s          0 s
  Memory: 6.759757995605469 GB (4950.265625 MB free)
  Uptime: 351.9 sec
  Load Avg:  1.0  0.78  0.38
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, icelake-server)
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

    Architecture:                       x86_64
    CPU op-mode(s):                     32-bit, 64-bit
    Address sizes:                      46 bits physical, 48 bits virtual
    Byte Order:                         Little Endian
    CPU(s):                             2
    On-line CPU(s) list:                0,1
    Vendor ID:                          GenuineIntel
    Model name:                         Intel(R) Xeon(R) Platinum 8370C CPU @ 2.80GHz
    CPU family:                         6
    Model:                              106
    Thread(s) per core:                 1
    Core(s) per socket:                 2
    Socket(s):                          1
    Stepping:                           6
    BogoMIPS:                           5586.87
    Flags:                              fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm avx512f avx512dq rdseed adx smap clflushopt avx512cd avx512bw avx512vl xsaveopt xsavec xsaves md_clear
    Hypervisor vendor:                  Microsoft
    Virtualization type:                full
    L1d cache:                          96 KiB (2 instances)
    L1i cache:                          64 KiB (2 instances)
    L2 cache:                           2.5 MiB (2 instances)
    L3 cache:                           48 MiB (1 instance)
    NUMA node(s):                       1
    NUMA node0 CPU(s):                  0,1
    Vulnerability Gather data sampling: Unknown: Dependent on hypervisor status
    Vulnerability Itlb multihit:        KVM: Mitigation: VMX unsupported
    Vulnerability L1tf:                 Mitigation; PTE Inversion
    Vulnerability Mds:                  Mitigation; Clear CPU buffers; SMT Host state unknown
    Vulnerability Meltdown:             Mitigation; PTI
    Vulnerability Mmio stale data:      Vulnerable: Clear CPU buffers attempted, no microcode; SMT Host state unknown
    Vulnerability Retbleed:             Not affected
    Vulnerability Spec store bypass:    Vulnerable
    Vulnerability Spectre v1:           Mitigation; usercopy/swapgs barriers and __user pointer sanitization
    Vulnerability Spectre v2:           Mitigation; Retpolines, STIBP disabled, RSB filling, PBRSB-eIBRS Not affected
    Vulnerability Srbds:                Not affected
    Vulnerability Tsx async abort:      Mitigation; Clear CPU buffers; SMT Host state unknown
    

| Cpu Property       | Value                                                   |
|:------------------ |:------------------------------------------------------- |
| Brand              | Intel(R) Xeon(R) Platinum 8370C CPU @ 2.80GHz           |
| Vendor             | :Intel                                                  |
| Architecture       | :UnknownIntel                                           |
| Model              | Family: 0x06, Model: 0x6a, Stepping: 0x06, Type: 0x00   |
| Cores              | 2 physical cores, 2 logical cores (on executing CPU)    |
|                    | No Hyperthreading hardware capability detected          |
| Clock Frequencies  | Not supported by CPU                                    |
| Data Cache         | Level 1:3 : (48, 1280, 49152) kbytes                    |
|                    | 64 byte cache line size                                 |
| Address Size       | 48 bits virtual, 46 bits physical                       |
| SIMD               | 512 bit = 64 byte max. SIMD vector size                 |
| Time Stamp Counter | TSC is accessible via `rdtsc`                           |
|                    | TSC increased at every clock cycle (non-invariant TSC)  |
| Perf. Monitoring   | Performance Monitoring Counters (PMC) are not supported |
| Hypervisor         | Yes, Microsoft                                          |
