# Benchmark result

* Pull request commit: [`311d17ffba071c4f49d6832cb4af4c2e171fcec1`](https://github.com/JuliaPhysics/Measurements.jl/commit/311d17ffba071c4f49d6832cb4af4c2e171fcec1)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/139> (Simplify benchmark run)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 22 Mar 2023 - 23:07
    - Baseline: 22 Mar 2023 - 23:09
* Package commits:
    - Target: f31696
    - Baseline: 9e7414
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
| `["vector", "prod - all different"]` | 0.91 (5%) :white_check_mark: |   1.00 (1%)  |

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
  uname: Linux 5.15.0-1034-azure #41-Ubuntu SMP Fri Feb 10 19:59:45 UTC 2023 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz        713 s          0 s        136 s       3496 s          0 s
       #2  2593 MHz       1890 s          0 s        142 s       2314 s          0 s
  Memory: 6.781219482421875 GB (5005.6328125 MB free)
  Uptime: 439.47 sec
  Load Avg:  1.0  0.64  0.28
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
  uname: Linux 5.15.0-1034-azure #41-Ubuntu SMP Fri Feb 10 19:59:45 UTC 2023 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz        744 s          0 s        141 s       4367 s          0 s
       #2  2593 MHz       2761 s          0 s        153 s       2342 s          0 s
  Memory: 6.781219482421875 GB (5045.98828125 MB free)
  Uptime: 530.48 sec
  Load Avg:  1.0  0.74  0.35
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 22 Mar 2023 - 23:7
* Package commit: f31696
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
| `["base", "multiplication"]`         |  41.978 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  23.896 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  23.795 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  41.734 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  | 111.702 μs (5%) |           | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.370 μs (5%) |           |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    3.446 s (5%) |   1.485 s |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 139.143 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 711.203 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 717.533 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 654.388 ns (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 965.113 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.376 s (5%) | 12.077 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 293.404 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 486.534 ms (5%) | 13.789 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 132.226 ms (5%) | 10.700 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 325.104 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.394 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 265.303 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 388.200 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 130.602 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
  uname: Linux 5.15.0-1034-azure #41-Ubuntu SMP Fri Feb 10 19:59:45 UTC 2023 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz        713 s          0 s        136 s       3496 s          0 s
       #2  2593 MHz       1890 s          0 s        142 s       2314 s          0 s
  Memory: 6.781219482421875 GB (5005.6328125 MB free)
  Uptime: 439.47 sec
  Load Avg:  1.0  0.64  0.28
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 22 Mar 2023 - 23:9
* Package commit: 9e7414
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
| `["base", "multiplication"]`         |  42.180 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  23.897 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  23.996 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  41.734 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  | 116.202 μs (5%) |           | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.390 μs (5%) |           |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    3.389 s (5%) |   1.465 s |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 140.071 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 707.000 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 729.204 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 656.256 ns (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 974.713 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.388 s (5%) |  9.576 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 293.803 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 534.508 ms (5%) | 11.691 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 133.045 ms (5%) | 10.032 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 320.403 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.378 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 262.003 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 390.517 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 126.201 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
  uname: Linux 5.15.0-1034-azure #41-Ubuntu SMP Fri Feb 10 19:59:45 UTC 2023 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz        744 s          0 s        141 s       4367 s          0 s
       #2  2593 MHz       2761 s          0 s        153 s       2342 s          0 s
  Memory: 6.781219482421875 GB (5045.98828125 MB free)
  Uptime: 530.48 sec
  Load Avg:  1.0  0.74  0.35
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

