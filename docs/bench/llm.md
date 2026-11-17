# Benchmarks, 2026-11-17, llm

- **Commit:** `94fad17` (engine: pairwise gravity's kernel per target and scalar, in one place (f64 −17% in V8) (#307))
- **Machine:** Linux x86_64, 16 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Run:** `cargo xtask bench`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `llm`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 895.4 µs | 0.1% |  | -0.8% |
| `barnes_hut_f32/theta_0.5/128` | 23.3 µs | 0.1% |  | +0.1% |
| `barnes_hut_f32/theta_0.5/4096` | 5.15 ms | 0.1% |  | +0.7% |
| `barnes_hut_f32/theta_1/1024` | 601.1 µs | 0.1% |  | -1.5% |
| `barnes_hut_f32/theta_1/128` | 16.2 µs | 0.1% |  | +0.4% |
| `barnes_hut_f32/theta_1/4096` | 3.04 ms | 0.1% |  | -1.5% |
| `barnes_hut_f64/theta_0.5/1024` | 979.0 µs | 0.1% |  | +0.8% |
| `barnes_hut_f64/theta_0.5/128` | 21.7 µs | 0.0% |  | +0.5% |
| `barnes_hut_f64/theta_0.5/4096` | 5.56 ms | 0.1% |  | +0.1% |
| `barnes_hut_f64/theta_1/1024` | 671.9 µs | 0.2% |  | -2.1% |
| `barnes_hut_f64/theta_1/128` | 14.5 µs | 0.0% |  | +0.4% |
| `barnes_hut_f64/theta_1/4096` | 3.38 ms | 0.1% |  | -0.5% |
| `bodyvec_f32/1024` | 267 ns | 0.1% |  | -2.0% |
| `bodyvec_f32/128` | 43 ns | 0.2% |  | +2.4% |
| `bodyvec_f32/16` | 8 ns | 1.4% |  | +5.3% |
| `bodyvec_f64/1024` | 414 ns | 0.1% |  | +1.0% |
| `bodyvec_f64/128` | 57 ns | 0.1% |  | +2.6% |
| `bodyvec_f64/16` | 9 ns | 0.4% |  | +9.0% |
| `broadphase_f64/1024` | 57.6 µs | 0.1% |  | -5.1% |
| `broadphase_f64/128` | 6.0 µs | 0.1% |  | -3.6% |
| `broadphase_f64/4096` | 360.7 µs | 0.1% |  | -8.6% |
| `fft_f32/1024` | 5.1 µs | 0.2% |  | -0.5% |
| `fft_f32/16384` | 146.1 µs | 0.4% |  | -0.7% |
| `fft_f32/4096` | 24.2 µs | 0.1% |  | -0.2% |
| `pairwise_f32/1024` | 304.3 µs | 0.0% |  | +0.8% |
| `pairwise_f32/128` | 6.5 µs | 0.1% |  | +0.5% |
| `pairwise_f32/16` | 205 ns | 0.2% |  | +1.5% |
| `pairwise_f32/4096` | 4.69 ms | 0.1% |  | +0.2% |
| `pairwise_f64/1024` | 645.6 µs | 0.0% |  | -6.1% |
| `pairwise_f64/128` | 13.3 µs | 0.1% |  | +9.5% |
| `pairwise_f64/16` | 277 ns | 0.0% |  | -0.3% |
| `pairwise_f64/4096` | 10.03 ms | 0.0% |  | -7.8% |
| `piano_16_voices_x3_strings/128` | 63.4 µs | 0.3% |  | +1.8% |
| `piano_design_88_keys` | 26.50 ms | 0.1% |  | -45.9% |
| `sand_step/busy/1920x1080_chunks` | 15.15 ms | 0.1% | 136.9 Melem/s | -0.2% |
| `sand_step/busy/1920x1080_full` | 15.00 ms | 0.1% | 138.2 Melem/s | -0.3% |
| `sand_step/busy/640x360_chunks` | 1.67 ms | 0.2% | 138.0 Melem/s | +1.2% |
| `sand_step/busy/640x360_full` | 1.66 ms | 0.1% | 139.1 Melem/s | +1.0% |
| `sand_step/settled/1920x1080_chunks` | 19.8 µs | 0.2% | 104.9 Gelem/s | -1.7% |
| `sand_step/settled/1920x1080_full` | 5.16 ms | 0.1% | 402.2 Melem/s | -0.3% |
| `sand_step/settled/640x360_chunks` | 2.9 µs | 0.0% | 80.6 Gelem/s | -0.4% |
| `sand_step/settled/640x360_full` | 572.7 µs | 0.1% | 402.3 Melem/s | +0.1% |
| `spectrum_f32/4096` | 34.5 µs | 0.0% |  | -0.3% |
| `step_f32_symplectic/1024` | 306.3 µs | 0.2% |  | +0.9% |
| `step_f32_symplectic/128` | 6.6 µs | 0.1% |  | -1.1% |
| `step_f32_symplectic/16` | 226 ns | 0.1% |  | -0.1% |
| `step_f32_verlet/1024` | 610.5 µs | 0.0% |  | +0.9% |
| `step_f32_verlet/128` | 13.2 µs | 0.0% |  | -0.0% |
| `step_f32_verlet/16` | 436 ns | 0.1% |  | -0.6% |
| `step_f64_symplectic/1024` | 647.5 µs | 0.0% |  | -5.9% |
| `step_f64_symplectic/128` | 13.4 µs | 0.1% |  | +9.4% |
| `step_f64_symplectic/16` | 302 ns | 0.0% |  | -1.5% |
| `step_f64_verlet/1024` | 1.31 ms | 0.1% |  | -5.3% |
| `step_f64_verlet/128` | 26.8 µs | 0.1% |  | +8.8% |
| `step_f64_verlet/16` | 595 ns | 0.0% |  | +0.5% |
| `stiff_waveguide_new/21` | 46.3 µs | 0.6% |  | -34.3% |
| `stiff_waveguide_new/36` | 441.2 µs | 0.1% |  | -41.4% |
| `stiff_waveguide_new/60` | 146.1 µs | 0.1% |  | -44.5% |
| `stiff_waveguide_new/69` | 3.29 ms | 0.1% |  | -48.5% |
| `stiff_waveguide_new/84` | 495.2 µs | 0.2% |  | -43.2% |
| `swarm_models/ants/200x120_500` | 213.7 µs | 4.8% |  | -9.7% |
| `swarm_models/physarum/512_100k` | 4.13 ms | 0.7% |  | -0.2% |
| `swarm_models/vicsek/4000` | 1.28 ms | 5.3% |  | -0.3% |
| `swarm_step/Brute/1000` | 504.1 µs | 0.1% | 2.0 Melem/s | -0.0% |
| `swarm_step/Brute/10000` | 47.97 ms | 0.1% | 208.5 Kelem/s | +0.0% |
| `swarm_step/Brute/300` | 53.5 µs | 0.0% | 5.6 Melem/s | -0.2% |
| `swarm_step/Brute/3000` | 4.37 ms | 0.1% | 685.9 Kelem/s | -0.0% |
| `swarm_step/Grid/1000` | 608.4 µs | 2.7% | 1.6 Melem/s | +0.0% |
| `swarm_step/Grid/10000` | 5.84 ms | 15.5% | 1.7 Melem/s | +0.3% |
| `swarm_step/Grid/100000` | 43.60 ms | 1.2% | 2.3 Melem/s | +0.0% |
| `swarm_step/Grid/300` | 194.0 µs | 0.2% | 1.5 Melem/s | +0.2% |
| `swarm_step/Grid/3000` | 1.73 ms | 6.7% | 1.7 Melem/s | -0.1% |
| `swarm_step/Sorted/1000` | 189.9 µs | 1.2% | 5.3 Melem/s | +0.8% |
| `swarm_step/Sorted/10000` | 1.93 ms | 3.2% | 5.2 Melem/s | -0.0% |
| `swarm_step/Sorted/100000` | 17.74 ms | 0.4% | 5.6 Melem/s | -0.8% |
| `swarm_step/Sorted/300` | 56.8 µs | 0.1% | 5.3 Melem/s | +0.2% |
| `swarm_step/Sorted/3000` | 557.1 µs | 2.1% | 5.4 Melem/s | -0.2% |
