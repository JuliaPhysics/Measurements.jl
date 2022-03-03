# Benchmark result

* Pull request commit: [`64bd0ed17eb6f3bc5ad64ba1a198b621db50403c`](https://github.com/JuliaPhysics/Measurements.jl/commit/64bd0ed17eb6f3bc5ad64ba1a198b621db50403c)
* Pull request: <https://github.com/JuliaPhysics/Measurements.jl/pull/117> (Capture deprecation warnings in tests)

# Judge result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmarks:
    - Target: 3 Mar 2022 - 22:25
    - Baseline: 3 Mar 2022 - 22:26
* Package commits:
    - Target: 542d20
    - Baseline: 0ff755
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
| `["vector", "prod - all equal"]`     |                1.05 (5%) :x: |   1.00 (1%)  |
| `["vector", "sqrt"]`                 |                1.06 (5%) :x: |   1.00 (1%)  |
| `["vector", "sum - all different"]`  | 0.81 (5%) :white_check_mark: |   1.00 (1%)  |
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
      Ubuntu 20.04.4 LTS
  uname: Linux 5.11.0-1028-azure #31~20.04.2-Ubuntu SMP Tue Jan 18 08:46:15 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz        647 s          0 s         90 s       1718 s          0 s
       #2  2593 MHz       1773 s          0 s         89 s        632 s          0 s
       
  Memory: 6.7845458984375 GB (3717.75 MB free)
  Uptime: 251.7 sec
  Load Avg:  1.0  0.63  0.28
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
      Ubuntu 20.04.4 LTS
  uname: Linux 5.11.0-1028-azure #31~20.04.2-Ubuntu SMP Tue Jan 18 08:46:15 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz        699 s          0 s         95 s       2550 s          0 s
       #2  2593 MHz       2610 s          0 s         98 s        678 s          0 s
       
  Memory: 6.7845458984375 GB (3788.203125 MB free)
  Uptime: 340.98 sec
  Load Avg:  1.0  0.73  0.35
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, skylake-avx512)
```

---
# Target result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 3 Mar 2022 - 22:25
* Package commit: 542d20
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
| `["base", "create"]`                 |   8.900 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  39.759 ns (5%) |           |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  23.370 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  23.370 ns (5%) |           |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  39.516 ns (5%) |           |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  16.800 μs (5%) |           |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.500 μs (5%) |           |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 400.471 ms (5%) |  8.915 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               | 133.071 ns (5%) |           |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 678.853 ns (5%) |           |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 691.163 ns (5%) |           |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.500 μs (5%) |           |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 968.906 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.399 s (5%) | 11.011 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 276.002 μs (5%) |           | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 466.372 ms (5%) | 10.012 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 105.147 ms (5%) | 10.585 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 346.302 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.276 ms (5%) |           |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 268.302 μs (5%) |           | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 353.067 ms (5%) |           | 625.09 KiB (1%) |       10004 |
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
Julia Version 1.7.2
Commit bf53498635 (2022-02-06 15:21 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
      Ubuntu 20.04.4 LTS
  uname: Linux 5.11.0-1028-azure #31~20.04.2-Ubuntu SMP Tue Jan 18 08:46:15 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz        647 s          0 s         90 s       1718 s          0 s
       #2  2593 MHz       1773 s          0 s         89 s        632 s          0 s
       
  Memory: 6.7845458984375 GB (3717.75 MB free)
  Uptime: 251.7 sec
  Load Avg:  1.0  0.63  0.28
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-12.0.1 (ORCJIT, skylake-avx512)
```

---
# Baseline result
# Benchmark Report for */home/runner/work/Measurements.jl/Measurements.jl*

## Job Properties
* Time of benchmark: 3 Mar 2022 - 22:26
* Package commit: 0ff755
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

| ID                                   | time            | GC time  | memory          | allocations |
|--------------------------------------|----------------:|---------:|----------------:|------------:|
| `["base", "create"]`                 |   8.800 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "multiplication"]`         |  39.758 ns (5%) |          |   96 bytes (1%) |           2 |
| `["base", "sin"]`                    |  23.370 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sqrt"]`                   |  23.470 ns (5%) |          |   48 bytes (1%) |           1 |
| `["base", "sum"]`                    |  39.516 ns (5%) |          |   96 bytes (1%) |           2 |
| `["quadgk", "cos"]`                  |  17.000 μs (5%) |          |   7.78 KiB (1%) |         325 |
| `["quadgk", "int1"]`                 |   1.530 μs (5%) |          |   3.14 KiB (1%) |          68 |
| `["quadgk", "sin"]`                  | 411.601 ms (5%) | 9.906 ms | 132.00 MiB (1%) |     6666687 |
| `["specfun", "gamma"]`               | 131.717 ns (5%) |          |   48 bytes (1%) |           1 |
| `["uncertain", "atan"]`              | 673.724 ns (5%) |          |  656 bytes (1%) |          20 |
| `["uncertain", "log"]`               | 688.435 ns (5%) |          |  704 bytes (1%) |          21 |
| `["uncertain", "zeta"]`              |   1.500 μs (5%) |          |   48 bytes (1%) |           1 |
| `["vector", "gamma"]`                | 975.206 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "mean - all different"]` |    3.412 s (5%) | 9.672 ms | 145.57 MiB (1%) |     3179985 |
| `["vector", "mean - all equal"]`     | 278.102 μs (5%) |          | 468.80 KiB (1%) |       10001 |
| `["vector", "prod - all different"]` | 478.640 ms (5%) | 8.678 ms | 764.01 MiB (1%) |       30004 |
| `["vector", "prod - all equal"]`     | 100.013 ms (5%) | 7.933 ms | 763.55 MiB (1%) |       20005 |
| `["vector", "sin"]`                  | 331.602 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "sin²+cos²"]`            |   1.222 ms (5%) |          |   2.14 MiB (1%) |       40002 |
| `["vector", "sqrt"]`                 | 254.002 μs (5%) |          | 781.30 KiB (1%) |       10002 |
| `["vector", "sum - all different"]`  | 436.316 ms (5%) |          | 625.09 KiB (1%) |       10004 |
| `["vector", "sum - all equal"]`      | 107.100 μs (5%) |          | 156.39 KiB (1%) |           5 |

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
      Ubuntu 20.04.4 LTS
  uname: Linux 5.11.0-1028-azure #31~20.04.2-Ubuntu SMP Tue Jan 18 08:46:15 UTC 2022 x86_64 x86_64
  CPU: Intel(R) Xeon(R) Platinum 8272CL CPU @ 2.60GHz: 
              speed         user         nice          sys         idle          irq
       #1  2593 MHz        699 s          0 s         95 s       2550 s          0 s
       #2  2593 MHz       2610 s          0 s         98 s        678 s          0 s
       
  Memory: 6.7845458984375 GB (3788.203125 MB free)
  Uptime: 340.98 sec
  Load Avg:  1.0  0.73  0.35
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

