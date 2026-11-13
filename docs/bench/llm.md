# Benchmarks, 2026-11-13, llm

- **Commit:** `816ddd6` (xtask/bench recorded (#258))
- **Machine:** Linux x86_64, 16 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Run:** `cargo xtask bench`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from each benchmark's previous run. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 932.6 µs | 0.1% |  |  |
| `barnes_hut_f32/theta_0.5/128` | 22.8 µs | 0.1% |  |  |
| `barnes_hut_f32/theta_0.5/4096` | 5.31 ms | 0.1% |  |  |
| `barnes_hut_f32/theta_1/1024` | 638.0 µs | 0.2% |  |  |
| `barnes_hut_f32/theta_1/128` | 15.6 µs | 0.2% |  |  |
| `barnes_hut_f32/theta_1/4096` | 3.17 ms | 0.1% |  |  |
| `barnes_hut_f64/theta_0.5/1024` | 927.2 µs | 0.4% |  |  |
| `barnes_hut_f64/theta_0.5/128` | 22.8 µs | 0.3% |  |  |
| `barnes_hut_f64/theta_0.5/4096` | 5.21 ms | 0.0% |  |  |
| `barnes_hut_f64/theta_1/1024` | 641.7 µs | 0.1% |  |  |
| `barnes_hut_f64/theta_1/128` | 15.6 µs | 0.1% |  |  |
| `barnes_hut_f64/theta_1/4096` | 3.13 ms | 0.1% |  |  |
| `bodyvec_f32/1024` | 273 ns | 0.1% |  |  |
| `bodyvec_f32/128` | 42 ns | 0.1% |  |  |
| `bodyvec_f32/16` | 7 ns | 0.1% |  |  |
| `bodyvec_f64/1024` | 415 ns | 0.2% |  |  |
| `bodyvec_f64/128` | 60 ns | 0.1% |  |  |
| `bodyvec_f64/16` | 8 ns | 0.3% |  |  |
| `broadphase_f64/1024` | 55.6 µs | 0.1% |  |  |
| `broadphase_f64/128` | 5.6 µs | 0.1% |  |  |
| `broadphase_f64/4096` | 358.3 µs | 0.1% |  |  |
| `fft_f32/1024` | 5.1 µs | 0.3% |  |  |
| `fft_f32/16384` | 146.1 µs | 0.0% |  |  |
| `fft_f32/4096` | 24.3 µs | 0.4% |  |  |
| `pairwise_f32/1024` | 1.12 ms | 0.0% |  |  |
| `pairwise_f32/128` | 16.1 µs | 0.2% |  |  |
| `pairwise_f32/16` | 206 ns | 0.1% |  |  |
| `pairwise_f32/4096` | 18.18 ms | 0.1% |  |  |
| `pairwise_f64/1024` | 1.17 ms | 0.1% |  |  |
| `pairwise_f64/128` | 18.3 µs | 0.1% |  |  |
| `pairwise_f64/16` | 278 ns | 0.2% |  |  |
| `pairwise_f64/4096` | 18.75 ms | 0.0% |  |  |
| `piano_16_voices_x3_strings/128` | 62.9 µs | 0.1% |  |  |
| `piano_design_88_keys` | 165.40 ms | 0.2% |  |  |
| `sand_step/busy/1920x1080_chunks` | 15.29 ms | 0.1% | 135.6 Melem/s |  |
| `sand_step/busy/1920x1080_full` | 15.06 ms | 0.1% | 137.6 Melem/s |  |
| `sand_step/busy/640x360_chunks` | 1.68 ms | 0.1% | 137.1 Melem/s |  |
| `sand_step/busy/640x360_full` | 1.66 ms | 0.1% | 138.4 Melem/s |  |
| `sand_step/settled/1920x1080_chunks` | 19.8 µs | 0.2% | 104.9 Gelem/s |  |
| `sand_step/settled/1920x1080_full` | 5.17 ms | 0.1% | 401.4 Melem/s |  |
| `sand_step/settled/640x360_chunks` | 2.9 µs | 0.1% | 80.6 Gelem/s |  |
| `sand_step/settled/640x360_full` | 573.3 µs | 0.1% | 401.9 Melem/s |  |
| `spectrum_f32/4096` | 34.5 µs | 0.0% |  |  |
| `step_f32_symplectic/1024` | 1.13 ms | 0.1% |  |  |
| `step_f32_symplectic/128` | 16.3 µs | 0.1% |  |  |
| `step_f32_symplectic/16` | 227 ns | 0.1% |  |  |
| `step_f32_verlet/1024` | 2.25 ms | 0.0% |  |  |
| `step_f32_verlet/128` | 32.4 µs | 0.1% |  |  |
| `step_f32_verlet/16` | 441 ns | 0.1% |  |  |
| `step_f64_symplectic/1024` | 1.17 ms | 0.0% |  |  |
| `step_f64_symplectic/128` | 18.4 µs | 0.1% |  |  |
| `step_f64_symplectic/16` | 302 ns | 0.1% |  |  |
| `step_f64_verlet/1024` | 2.34 ms | 0.0% |  |  |
| `step_f64_verlet/128` | 36.7 µs | 0.1% |  |  |
| `step_f64_verlet/16` | 590 ns | 0.1% |  |  |
| `stiff_waveguide_new/21` | 1.27 ms | 0.1% |  |  |
| `stiff_waveguide_new/36` | 2.19 ms | 0.2% |  |  |
| `stiff_waveguide_new/60` | 1.66 ms | 0.1% |  |  |
| `stiff_waveguide_new/69` | 25.74 ms | 0.1% |  |  |
| `stiff_waveguide_new/84` | 2.52 ms | 0.3% |  |  |
| `swarm_models/ants/200x120_500` | 235.9 µs | 11.0% |  |  |
| `swarm_models/physarum/512_100k` | 4.13 ms | 0.7% |  |  |
| `swarm_models/vicsek/4000` | 1.24 ms | 6.0% |  |  |
| `swarm_step/Brute/1000` | 504.5 µs | 0.1% | 2.0 Melem/s |  |
| `swarm_step/Brute/10000` | 48.65 ms | 0.0% | 205.5 Kelem/s |  |
| `swarm_step/Brute/300` | 50.2 µs | 0.1% | 6.0 Melem/s |  |
| `swarm_step/Brute/3000` | 4.43 ms | 0.1% | 676.9 Kelem/s |  |
| `swarm_step/Grid/1000` | 619.8 µs | 3.7% | 1.6 Melem/s |  |
| `swarm_step/Grid/10000` | 6.38 ms | 9.1% | 1.6 Melem/s |  |
| `swarm_step/Grid/100000` | 43.10 ms | 1.6% | 2.3 Melem/s |  |
| `swarm_step/Grid/300` | 140.7 µs | 0.6% | 2.1 Melem/s |  |
| `swarm_step/Grid/3000` | 1.77 ms | 10.2% | 1.7 Melem/s |  |
| `swarm_step/Sorted/1000` | 143.4 µs | 4.2% | 7.0 Melem/s |  |
| `swarm_step/Sorted/10000` | 1.81 ms | 10.2% | 5.5 Melem/s |  |
| `swarm_step/Sorted/100000` | 14.13 ms | 1.9% | 7.1 Melem/s |  |
| `swarm_step/Sorted/300` | 42.0 µs | 2.6% | 7.1 Melem/s |  |
| `swarm_step/Sorted/3000` | 457.6 µs | 4.6% | 6.6 Melem/s |  |
