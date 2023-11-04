# Benchmark result

* Pull request commit: [`f1f46f478dfbcfac1bb55dde53ec2b4ca99f121e`](https://github.com/JuliaPhysics/Measurements.jl/commit/f1f46f478dfbcfac1bb55dde53ec2b4ca99f121e)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/160> (Release v2.11.0)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 4 Nov 2023 - 11:30
    - Baseline: 4 Nov 2023 - 11:32
* Package commits:
    - Target: 383b7b
    - Baseline: ad9f0f
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
| `["vector", "prod - all equal"]`     | 1.08 (5%) :x: |   1.00 (1%)  |
| `["vector", "sin²+cos²"]`            | 1.06 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  | 1.14 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all equal"]`      | 1.18 (5%) :x: |   1.00 (1%)  |

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
  uname: Linux 6.2.0-1015-azure #15~22.04.1-Ubuntu SMP Fri Oct  6 13:20:44 UTC 2023 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz       2331 s          0 s        114 s        902 s          0 s
       #2  2593 MHz        396 s          0 s        128 s       2814 s          0 s
  Memory: 6.7597503662109375 GB (4925.73046875 MB free)
  Uptime: 339.18 sec
  Load Avg:  1.08  0.71  0.32
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
      Ubuntu 22.04.3 LTS
  uname: Linux 6.2.0-1015-azure #15~22.04.1-Ubuntu SMP Fri Oct  6 13:20:44 UTC 2023 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz       3200 s          0 s        126 s        929 s          0 s
       #2  2593 MHz        428 s          0 s        137 s       3678 s          0 s
  Memory: 6.7597503662109375 GB (4953.28125 MB free)
  Uptime: 430.15 sec
  Load Avg:  1.08  0.83  0.4
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 4 Nov 2023 - 11:30
* Package commit: 383b7b
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
| `["base", "create"]`                 |  14.715 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  42.281 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  23.795 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  24.197 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  41.675 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  | 118.402 μs (5%) |           | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.430 μs (5%) |           |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    3.404 s (5%) |   1.381 s |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 143.700 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 744.094 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 758.483 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 657.331 ns (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 967.710 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.394 s (5%) | 11.249 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 298.103 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 489.497 ms (5%) | 12.566 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 132.540 ms (5%) | 10.699 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 323.003 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.419 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 266.702 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 391.617 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 139.201 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
  uname: Linux 6.2.0-1015-azure #15~22.04.1-Ubuntu SMP Fri Oct  6 13:20:44 UTC 2023 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz       2331 s          0 s        114 s        902 s          0 s
       #2  2593 MHz        396 s          0 s        128 s       2814 s          0 s
  Memory: 6.7597503662109375 GB (4925.73046875 MB free)
  Uptime: 339.18 sec
  Load Avg:  1.08  0.71  0.32
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 4 Nov 2023 - 11:32
* Package commit: ad9f0f
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
| `["base", "create"]`                 |  14.615 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  43.189 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  23.896 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  23.896 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  41.878 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  | 117.701 μs (5%) |           | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.420 μs (5%) |           |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    3.321 s (5%) |   1.347 s |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 144.878 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 737.016 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 758.483 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 660.516 ns (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 983.609 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.382 s (5%) |  9.929 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 311.003 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 489.771 ms (5%) | 10.815 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 122.630 ms (5%) |  9.812 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 322.503 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.339 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 263.103 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 342.358 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 118.201 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
  uname: Linux 6.2.0-1015-azure #15~22.04.1-Ubuntu SMP Fri Oct  6 13:20:44 UTC 2023 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz       3200 s          0 s        126 s        929 s          0 s
       #2  2593 MHz        428 s          0 s        137 s       3678 s          0 s
  Memory: 6.7597503662109375 GB (4953.28125 MB free)
  Uptime: 430.15 sec
  Load Avg:  1.08  0.83  0.4
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

    Architecture:                       x86_64
    CPU op-mode(s):                     32-bit, 64-bit
    Address sizes:                      46 bits physical, 48 bits virtual
    Byte Order:                         Little Endian
    CPU(s):                             2
    On-line CPU(s) list:                0,1
    Vendor ID:                          GenuineIntel
    Model name:                         Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz
    CPU family:                         6
    Model:                              85
    Thread(s) per core:                 1
    Core(s) per socket:                 2
    Socket(s):                          1
    Stepping:                           7
    BogoMIPS:                           5187.80
    Flags:                              fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm avx512f avx512dq rdseed adx smap clflushopt avx512cd avx512bw avx512vl xsaveopt xsavec xsaves md_clear
    Hypervisor vendor:                  Microsoft
    Virtualization type:                full
    L1d cache:                          64 KiB (2 instances)
    L1i cache:                          64 KiB (2 instances)
    L2 cache:                           2 MiB (2 instances)
    L3 cache:                           35.8 MiB (1 instance)
    NUMA node(s):                       1
    NUMA node0 CPU(s):                  0,1
    Vulnerability Gather data sampling: Unknown: Dependent on hypervisor status
    Vulnerability Itlb multihit:        KVM: Mitigation: VMX unsupported
    Vulnerability L1tf:                 Mitigation; PTE Inversion
    Vulnerability Mds:                  Mitigation; Clear CPU buffers; SMT Host state unknown
    Vulnerability Meltdown:             Mitigation; PTI
    Vulnerability Mmio stale data:      Vulnerable: Clear CPU buffers attempted, no microcode; SMT Host state unknown
    Vulnerability Retbleed:             Vulnerable
    Vulnerability Spec rstack overflow: Not affected
    Vulnerability Spec store bypass:    Vulnerable
    Vulnerability Spectre v1:           Mitigation; usercopy/swapgs barriers and __user pointer sanitization
    Vulnerability Spectre v2:           Mitigation; Retpolines, STIBP disabled, RSB filling, PBRSB-eIBRS Not affected
    Vulnerability Srbds:                Not affected
    Vulnerability Tsx async abort:      Mitigation; Clear CPU buffers; SMT Host state unknown
    

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

