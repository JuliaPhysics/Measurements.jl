# Benchmark result

* Pull request commit: [`b594cdba837d5adf3661114a46bf65231445d049`](https://github.com/JuliaPhysics/Measurements.jl/commit/b594cdba837d5adf3661114a46bf65231445d049)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/112> (Extend `Base.tryparse`)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 28 Dec 2021 - 11:53
    - Baseline: 28 Dec 2021 - 11:54
* Package commits:
    - Target: a697d3
    - Baseline: b7b7c8
* Julia commits:
    - Target: ac5cc9
    - Baseline: ac5cc9
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
| `["base", "create"]`                 | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "prod - all different"]` |                1.05 (5%) :x: |   1.00 (1%)  |
| `["vector", "prod - all equal"]`     |                1.07 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  | 0.95 (5%) :white_check_mark: |   1.00 (1%)  |
| `["vector", "sum - all equal"]`      |                1.12 (5%) :x: |   1.00 (1%)  |

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
Julia Version 1.7.1
Commit ac5cc99908 (2021-12-22 19:35 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.3 LTS
  uname: Linux 5.11.0-1022-azure #23~20.04.1-Ubuntu SMP Fri Nov 19 10:20:52 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz        357 s          1 s         92 s       2221 s          0 s
       #2  2593 MHz       2098 s          1 s        107 s        484 s          0 s
       
  Memory: 6.788982391357422 GB (3668.171875 MB free)
  Uptime: 272.92 sec
  Load Avg:  1.02  0.75  0.34
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, skylake-avx512)
```

### Baseline
```
Julia Version 1.7.1
Commit ac5cc99908 (2021-12-22 19:35 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.3 LTS
  uname: Linux 5.11.0-1022-azure #23~20.04.1-Ubuntu SMP Fri Nov 19 10:20:52 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz        425 s          1 s         96 s       3062 s          0 s
       #2  2593 MHz       2941 s          1 s        118 s        547 s          0 s
       
  Memory: 6.788982391357422 GB (3790.23828125 MB free)
  Uptime: 364.57 sec
  Load Avg:  1.0  0.82  0.41
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, skylake-avx512)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 28 Dec 2021 - 11:53
* Package commit: a697d3
* Julia commit: ac5cc9
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
| `["base", "create"]`                 |   8.900 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  40.927 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  23.696 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  23.594 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  40.727 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  17.800 μs (5%) |           |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.570 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 433.646 ms (5%) | 10.504 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               | 132.125 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 684.224 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 702.766 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.510 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 988.715 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.389 s (5%) | 12.170 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 281.104 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 539.379 ms (5%) | 12.558 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 112.522 ms (5%) | 11.352 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 357.605 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.294 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 284.505 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 418.794 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 120.702 μs (5%) |           | 156.39 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.7.1
Commit ac5cc99908 (2021-12-22 19:35 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.3 LTS
  uname: Linux 5.11.0-1022-azure #23~20.04.1-Ubuntu SMP Fri Nov 19 10:20:52 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz        357 s          1 s         92 s       2221 s          0 s
       #2  2593 MHz       2098 s          1 s        107 s        484 s          0 s
       
  Memory: 6.788982391357422 GB (3668.171875 MB free)
  Uptime: 272.92 sec
  Load Avg:  1.02  0.75  0.34
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, skylake-avx512)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 28 Dec 2021 - 11:54
* Package commit: b7b7c8
* Julia commit: ac5cc9
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
| `["base", "create"]`                 |   9.400 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  40.324 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  23.795 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  23.495 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  40.424 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  17.700 μs (5%) |           |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.550 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 434.198 ms (5%) | 10.027 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               | 130.989 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 693.434 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 696.559 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.490 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 977.714 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.395 s (5%) | 10.588 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 288.005 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 513.265 ms (5%) | 10.503 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 104.677 ms (5%) |  8.168 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 346.905 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.274 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 272.404 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 441.354 ms (5%) |           | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 108.101 μs (5%) |           | 156.39 KiB (1%) |           5 |

## Benchmark Group List
Here's a list of all the benchmark groups executed by this job:

- `["base"]`
- `["quadgk"]`
- `["specfun"]`
- `["uncertain"]`
- `["vector"]`

## Julia versioninfo
```
Julia Version 1.7.1
Commit ac5cc99908 (2021-12-22 19:35 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.3 LTS
  uname: Linux 5.11.0-1022-azure #23~20.04.1-Ubuntu SMP Fri Nov 19 10:20:52 UTC 2021 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz        425 s          1 s         96 s       3062 s          0 s
       #2  2593 MHz       2941 s          1 s        118 s        547 s          0 s
       
  Memory: 6.788982391357422 GB (3790.23828125 MB free)
  Uptime: 364.57 sec
  Load Avg:  1.0  0.82  0.41
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
    CPU MHz:                         2593.906
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
    Vulnerability Spectre v2:        Mitigation; Full generic retpoline, STIBP disabled, RSB filling
    Vulnerability Srbds:             Not affected
    Vulnerability Tsx async abort:   Mitigation; Clear CPU buffers; SMT Host state unknown
    Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht syscall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology cpuid pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch invpcid_single pti fsgsbase bmi1 hle avx2 smep bmi2 erms invpcid rtm mpx avx512f avx512dq rdseed adx smap clflushopt avx512cd avx512bw avx512vl xsaveopt xsavec xsaves md_clear
    

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

