# Benchmark result

* Pull request commit: [`46ab5162eb48473dea616ad79d0f45e6d317dd04`](https://github.com/JuliaPhysics/Measurements.jl/commit/46ab5162eb48473dea616ad79d0f45e6d317dd04)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/161> (Add compat bounds for stdlibs)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 4 Nov 2023 - 11:52
    - Baseline: 4 Nov 2023 - 11:53
* Package commits:
    - Target: 3d6997
    - Baseline: bc9c40
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
| `["quadgk", "int1"]`                 |                1.09 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all different"]` | 0.90 (5%) :white_check_mark: |   1.00 (1%)  |

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
       #1  2593 MHz        575 s          0 s        110 s       3858 s          0 s
       #2  2593 MHz       2177 s          0 s        133 s       2224 s          0 s
  Memory: 6.759746551513672 GB (4958.63671875 MB free)
  Uptime: 460.34 sec
  Load Avg:  1.07  0.75  0.36
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
       #1  2593 MHz        597 s          0 s        119 s       4753 s          0 s
       #2  2593 MHz       3078 s          0 s        145 s       2240 s          0 s
  Memory: 6.759746551513672 GB (4981.28515625 MB free)
  Uptime: 553.35 sec
  Load Avg:  1.11  0.85  0.43
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 4 Nov 2023 - 11:52
* Package commit: 3d6997
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
| `["base", "create"]`                 |  15.015 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  42.886 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  23.896 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  23.896 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  42.079 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  | 119.300 μs (5%) |           | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.580 μs (5%) |           |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    3.395 s (5%) |   1.345 s |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 144.208 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 748.031 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 766.102 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 656.250 ns (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 982.600 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.384 s (5%) | 11.210 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 307.599 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 476.125 ms (5%) | 14.054 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 131.594 ms (5%) | 11.145 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 341.902 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.459 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 278.700 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 387.920 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 153.400 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
       #1  2593 MHz        575 s          0 s        110 s       3858 s          0 s
       #2  2593 MHz       2177 s          0 s        133 s       2224 s          0 s
  Memory: 6.759746551513672 GB (4958.63671875 MB free)
  Uptime: 460.34 sec
  Load Avg:  1.07  0.75  0.36
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 4 Nov 2023 - 11:53
* Package commit: bc9c40
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
| `["base", "multiplication"]`         |  42.886 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  24.197 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  23.896 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  42.684 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  | 124.500 μs (5%) |           | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.450 μs (5%) |           |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    3.310 s (5%) |   1.308 s |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 143.617 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 734.646 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 758.475 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 656.875 ns (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 991.301 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.377 s (5%) |  8.946 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 313.300 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 531.547 ms (5%) | 12.654 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 129.361 ms (5%) | 11.261 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 352.400 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.527 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 280.800 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 398.261 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 148.500 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
       #1  2593 MHz        597 s          0 s        119 s       4753 s          0 s
       #2  2593 MHz       3078 s          0 s        145 s       2240 s          0 s
  Memory: 6.759746551513672 GB (4981.28515625 MB free)
  Uptime: 553.35 sec
  Load Avg:  1.11  0.85  0.43
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
    BogoMIPS:                           5187.81
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

