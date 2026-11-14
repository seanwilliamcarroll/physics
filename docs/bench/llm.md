# Benchmarks, 2026-11-14, llm

- **Commit:** `ea2169b` (gravity: body i's sum in a register (2x at 128-1024 bodies, same bits); docs/experiments.md (#273))
- **Machine:** Linux x86_64, 16 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Run:** `cargo xtask bench`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `llm`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 927.6 µs | 0.1% |  | -0.5% |
| `barnes_hut_f32/theta_0.5/128` | 23.6 µs | 0.1% |  | +3.2% |
| `barnes_hut_f32/theta_0.5/4096` | 5.30 ms | 0.1% |  | -0.2% |
| `barnes_hut_f32/theta_1/1024` | 631.3 µs | 0.0% |  | -1.1% |
| `barnes_hut_f32/theta_1/128` | 16.1 µs | 0.1% |  | +3.0% |
| `barnes_hut_f32/theta_1/4096` | 3.09 ms | 0.1% |  | -2.6% |
| `barnes_hut_f64/theta_0.5/1024` | 934.5 µs | 0.1% |  | +0.8% |
| `barnes_hut_f64/theta_0.5/128` | 22.1 µs | 0.0% |  | -2.8% |
| `barnes_hut_f64/theta_0.5/4096` | 5.33 ms | 0.0% |  | +2.3% |
| `barnes_hut_f64/theta_1/1024` | 655.8 µs | 0.1% |  | +2.2% |
| `barnes_hut_f64/theta_1/128` | 15.0 µs | 0.1% |  | -3.7% |
| `barnes_hut_f64/theta_1/4096` | 3.24 ms | 0.0% |  | +3.7% |
| `bodyvec_f32/1024` | 264 ns | 0.2% |  | -3.4% |
| `bodyvec_f32/128` | 46 ns | 0.1% |  | +9.5% |
| `bodyvec_f32/16` | 7 ns | 0.3% |  | -0.5% |
| `bodyvec_f64/1024` | 414 ns | 0.0% |  | -0.2% |
| `bodyvec_f64/128` | 56 ns | 0.1% |  | -6.8% |
| `bodyvec_f64/16` | 8 ns | 0.3% |  | +0.9% |
| `broadphase_f64/1024` | 61.5 µs | 0.2% |  | +10.5% |
| `broadphase_f64/128` | 6.4 µs | 0.3% |  | +13.0% |
| `broadphase_f64/4096` | 380.6 µs | 0.1% |  | +6.2% |
| `fft_f32/1024` | 5.1 µs | 0.1% |  | -0.2% |
| `fft_f32/16384` | 142.9 µs | 0.0% |  | -2.2% |
| `fft_f32/4096` | 24.3 µs | 0.1% |  | +0.1% |
| `pairwise_f32/1024` | 837.7 µs | 0.0% |  | -25.5% |
| `pairwise_f32/128` | 13.1 µs | 0.0% |  | -18.9% |
| `pairwise_f32/16` | 203 ns | 0.1% |  | -1.6% |
| `pairwise_f32/4096` | 13.40 ms | 0.0% |  | -26.3% |
| `pairwise_f64/1024` | 1.17 ms | 0.0% |  | -0.2% |
| `pairwise_f64/128` | 18.2 µs | 0.0% |  | -0.2% |
| `pairwise_f64/16` | 278 ns | 0.0% |  | -0.1% |
| `pairwise_f64/4096` | 18.71 ms | 0.0% |  | -0.2% |
| `piano_16_voices_x3_strings/128` | 62.8 µs | 0.0% |  | -0.2% |
| `piano_design_88_keys` | 164.78 ms | 0.0% |  | -0.4% |
| `sand_step/busy/1920x1080_chunks` | 15.13 ms | 0.1% | 137.0 Melem/s | -1.1% |
| `sand_step/busy/1920x1080_full` | 15.02 ms | 0.1% | 138.0 Melem/s | -0.3% |
| `sand_step/busy/640x360_chunks` | 1.65 ms | 0.1% | 139.9 Melem/s | -2.0% |
| `sand_step/busy/640x360_full` | 1.65 ms | 0.1% | 140.0 Melem/s | -1.1% |
| `sand_step/settled/1920x1080_chunks` | 19.7 µs | 0.1% | 105.2 Gelem/s | -0.3% |
| `sand_step/settled/1920x1080_full` | 5.16 ms | 0.1% | 401.6 Melem/s | -0.1% |
| `sand_step/settled/640x360_chunks` | 2.9 µs | 0.0% | 80.4 Gelem/s | +0.2% |
| `sand_step/settled/640x360_full` | 572.3 µs | 0.1% | 402.6 Melem/s | -0.2% |
| `spectrum_f32/4096` | 34.5 µs | 0.1% |  | +0.1% |
| `step_f32_symplectic/1024` | 838.6 µs | 0.0% |  | -25.5% |
| `step_f32_symplectic/128` | 13.2 µs | 0.0% |  | -18.8% |
| `step_f32_symplectic/16` | 225 ns | 0.1% |  | -1.0% |
| `step_f32_verlet/1024` | 1.68 ms | 0.1% |  | -25.5% |
| `step_f32_verlet/128` | 26.4 µs | 0.0% |  | -18.6% |
| `step_f32_verlet/16` | 439 ns | 0.0% |  | -0.6% |
| `step_f64_symplectic/1024` | 1.17 ms | 0.1% |  | -0.1% |
| `step_f64_symplectic/128` | 18.3 µs | 0.1% |  | -0.2% |
| `step_f64_symplectic/16` | 308 ns | 0.0% |  | +1.9% |
| `step_f64_verlet/1024` | 2.34 ms | 0.0% |  | -0.2% |
| `step_f64_verlet/128` | 36.6 µs | 0.0% |  | -0.2% |
| `step_f64_verlet/16` | 597 ns | 0.1% |  | +1.2% |
| `stiff_waveguide_new/21` | 1.28 ms | 0.1% |  | +0.1% |
| `stiff_waveguide_new/36` | 2.19 ms | 0.0% |  | +0.1% |
| `stiff_waveguide_new/60` | 1.67 ms | 0.0% |  | +0.0% |
| `stiff_waveguide_new/69` | 25.78 ms | 0.0% |  | +0.1% |
| `stiff_waveguide_new/84` | 2.53 ms | 0.1% |  | +0.6% |
| `swarm_models/ants/200x120_500` | 213.9 µs | 4.7% |  | -9.3% |
| `swarm_models/physarum/512_100k` | 4.13 ms | 0.7% |  | +0.1% |
| `swarm_models/vicsek/4000` | 1.23 ms | 6.1% |  | -0.8% |
| `swarm_step/Brute/1000` | 504.5 µs | 0.1% | 2.0 Melem/s | +0.0% |
| `swarm_step/Brute/10000` | 48.75 ms | 0.0% | 205.1 Kelem/s | +0.2% |
| `swarm_step/Brute/300` | 50.3 µs | 0.1% | 6.0 Melem/s | +0.1% |
| `swarm_step/Brute/3000` | 4.43 ms | 0.1% | 676.6 Kelem/s | +0.0% |
| `swarm_step/Grid/1000` | 615.4 µs | 3.6% | 1.6 Melem/s | -0.7% |
| `swarm_step/Grid/10000` | 6.38 ms | 9.0% | 1.6 Melem/s | -0.1% |
| `swarm_step/Grid/100000` | 43.21 ms | 1.5% | 2.3 Melem/s | +0.3% |
| `swarm_step/Grid/300` | 140.3 µs | 0.4% | 2.1 Melem/s | -0.3% |
| `swarm_step/Grid/3000` | 1.76 ms | 10.1% | 1.7 Melem/s | -0.5% |
| `swarm_step/Sorted/1000` | 143.0 µs | 4.3% | 7.0 Melem/s | -0.3% |
| `swarm_step/Sorted/10000` | 1.81 ms | 10.2% | 5.5 Melem/s | +0.0% |
| `swarm_step/Sorted/100000` | 14.15 ms | 2.0% | 7.1 Melem/s | +0.1% |
| `swarm_step/Sorted/300` | 41.7 µs | 2.6% | 7.2 Melem/s | -0.7% |
| `swarm_step/Sorted/3000` | 457.0 µs | 4.8% | 6.6 Melem/s | -0.1% |
