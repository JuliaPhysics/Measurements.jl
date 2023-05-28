# Benchmark result

* Pull request commit: [`c2f879994c5cb6f5bccecd85725e8ec51e1c800c`](https://github.com/JuliaPhysics/Measurements.jl/commit/c2f879994c5cb6f5bccecd85725e8ec51e1c800c)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/146> (Slim down docs in README, slightly expand introduction)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 28 May 2023 - 16:34
    - Baseline: 28 May 2023 - 16:35
* Package commits:
    - Target: 963cb9
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
| `["base", "sin"]`                    | 0.92 (5%) :white_check_mark: |   1.00 (1%)  |
| `["base", "sqrt"]`                   | 0.79 (5%) :white_check_mark: |   1.00 (1%)  |
| `["base", "sum"]`                    |                1.18 (5%) :x: |   1.00 (1%)  |
| `["quadgk", "cos"]`                  |                1.15 (5%) :x: |   1.00 (1%)  |
| `["quadgk", "int1"]`                 |                1.29 (5%) :x: |   1.00 (1%)  |
| `["uncertain", "atan"]`              |                1.17 (5%) :x: |   1.00 (1%)  |
| `["uncertain", "zeta"]`              | 0.87 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sin²+cos²"]`            |                1.14 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  | 0.86 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sum - all equal"]`      | 0.90 (5%) :white_check_mark: |   1.00 (1%)  |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       2478 s          0 s        154 s       1740 s          0 s
       #2  2095 MHz        435 s          0 s        160 s       3754 s          0 s
  Memory: 6.781208038330078 GB (4966.6640625 MB free)
  Uptime: 442.54 sec
  Load Avg:  1.01  0.8  0.4
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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       3426 s          0 s        167 s       1773 s          0 s
       #2  2095 MHz        474 s          0 s        165 s       4699 s          0 s
  Memory: 6.781208038330078 GB (5072.21484375 MB free)
  Uptime: 541.89 sec
  Load Avg:  1.0  0.86  0.46
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 28 May 2023 - 16:34
* Package commit: 963cb9
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
| `["base", "create"]`                 |  14.330 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  36.944 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  25.202 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  21.085 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  42.382 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  | 115.004 μs (5%) |           | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.540 μs (5%) |           |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    3.508 s (5%) |   1.361 s |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 116.485 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 706.726 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 604.615 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 550.916 ns (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 849.224 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.999 s (5%) | 11.910 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 245.408 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 576.387 ms (5%) | 14.237 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 116.025 ms (5%) | 12.098 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 315.410 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.459 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 240.308 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 394.060 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 103.502 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       2478 s          0 s        154 s       1740 s          0 s
       #2  2095 MHz        435 s          0 s        160 s       3754 s          0 s
  Memory: 6.781208038330078 GB (4966.6640625 MB free)
  Uptime: 442.54 sec
  Load Avg:  1.01  0.8  0.4
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-13.0.1 (ORCJIT, skylake-avx512)
  Threads: 1 on 2 virtual cores
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 28 May 2023 - 16:35
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

| ID                                   | time            | GC time   | memory          | allocations |
|--------------------------------------|----------------:|----------:|----------------:|------------:|
| `["base", "create"]`                 |  13.929 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  37.349 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  27.309 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  26.807 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  36.025 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  | 100.402 μs (5%) |           | 253.17 KiB (1%) |        5266 |
| `["quadgk", "int1"]`                 |   1.190 μs (5%) |           |   2.95 KiB (1%) |          63 |
| `["quadgk", "sin"]`                  |    3.434 s (5%) |   1.333 s |   2.56 GiB (1%) |    55627016 |
| `["specfun", "gamma"]`               | 116.234 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 606.156 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 619.552 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              | 632.347 ns (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 844.317 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.975 s (5%) |  8.963 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 249.605 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 592.077 ms (5%) | 11.516 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 117.376 ms (5%) | 11.203 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 329.808 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.278 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 230.606 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 458.419 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 114.603 μs (5%) |           | 156.39 KiB (1%) |           5 |

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
  CPU: Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2095 MHz       3426 s          0 s        167 s       1773 s          0 s
       #2  2095 MHz        474 s          0 s        165 s       4699 s          0 s
  Memory: 6.781208038330078 GB (5072.21484375 MB free)
  Uptime: 541.89 sec
  Load Avg:  1.0  0.86  0.46
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
    Model name:                      Intel(R) Xeon(R) Platinum 8171M CPU @ 2.60GHz
    CPU family:                      6
    Model:                           85
    Thread(s) per core:              1
    Core(s) per socket:              2
    Socket(s):                       1
    Stepping:                        4
    BogoMIPS:                        4190.35
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

