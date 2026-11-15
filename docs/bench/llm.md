# Benchmarks, 2026-11-15, llm

- **Commit:** `ee93fc1` (gravity loops (#277))
- **Machine:** Linux x86_64, 16 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Run:** `cargo xtask bench`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `llm`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 897.3 µs | 0.1% |  | -3.3% |
| `barnes_hut_f32/theta_0.5/128` | 23.3 µs | 0.1% |  | -0.9% |
| `barnes_hut_f32/theta_0.5/4096` | 5.17 ms | 0.1% |  | -2.3% |
| `barnes_hut_f32/theta_1/1024` | 617.5 µs | 0.1% |  | -2.2% |
| `barnes_hut_f32/theta_1/128` | 16.1 µs | 0.2% |  | -0.3% |
| `barnes_hut_f32/theta_1/4096` | 3.03 ms | 0.1% |  | -1.9% |
| `barnes_hut_f64/theta_0.5/1024` | 987.7 µs | 0.1% |  | +5.7% |
| `barnes_hut_f64/theta_0.5/128` | 21.8 µs | 0.0% |  | -1.3% |
| `barnes_hut_f64/theta_0.5/4096` | 5.57 ms | 0.1% |  | +4.4% |
| `barnes_hut_f64/theta_1/1024` | 684.3 µs | 0.1% |  | +4.3% |
| `barnes_hut_f64/theta_1/128` | 14.5 µs | 0.1% |  | -3.8% |
| `barnes_hut_f64/theta_1/4096` | 3.39 ms | 0.1% |  | +4.6% |
| `bodyvec_f32/1024` | 271 ns | 0.0% |  | +2.6% |
| `bodyvec_f32/128` | 42 ns | 0.1% |  | -9.6% |
| `bodyvec_f32/16` | 7 ns | 0.1% |  | +2.8% |
| `bodyvec_f64/1024` | 411 ns | 0.1% |  | -0.7% |
| `bodyvec_f64/128` | 56 ns | 0.1% |  | -0.2% |
| `bodyvec_f64/16` | 8 ns | 0.3% |  | -0.1% |
| `broadphase_f64/1024` | 59.8 µs | 0.0% |  | -2.7% |
| `broadphase_f64/128` | 6.1 µs | 0.1% |  | -4.1% |
| `broadphase_f64/4096` | 392.5 µs | 0.1% |  | +3.1% |
| `fft_f32/1024` | 5.1 µs | 0.2% |  | +0.2% |
| `fft_f32/16384` | 143.0 µs | 0.2% |  | +0.1% |
| `fft_f32/4096` | 24.3 µs | 0.1% |  | -0.1% |
| `pairwise_f32/1024` | 301.6 µs | 0.1% |  | -64.0% |
| `pairwise_f32/128` | 6.5 µs | 0.2% |  | -50.5% |
| `pairwise_f32/16` | 202 ns | 0.1% |  | -0.3% |
| `pairwise_f32/4096` | 4.67 ms | 0.0% |  | -65.1% |
| `pairwise_f64/1024` | 687.9 µs | 0.0% |  | -41.1% |
| `pairwise_f64/128` | 12.1 µs | 0.1% |  | -33.3% |
| `pairwise_f64/16` | 278 ns | 0.0% |  | -0.2% |
| `pairwise_f64/4096` | 10.88 ms | 0.0% |  | -41.9% |
| `piano_16_voices_x3_strings/128` | 63.1 µs | 0.1% |  | +0.5% |
| `piano_design_88_keys` | 164.75 ms | 0.1% |  | -0.0% |
| `sand_step/busy/1920x1080_chunks` | 15.19 ms | 0.1% | 136.5 Melem/s | +0.4% |
| `sand_step/busy/1920x1080_full` | 15.08 ms | 0.1% | 137.5 Melem/s | +0.4% |
| `sand_step/busy/640x360_chunks` | 1.66 ms | 0.1% | 139.1 Melem/s | +0.6% |
| `sand_step/busy/640x360_full` | 1.65 ms | 0.1% | 139.9 Melem/s | +0.1% |
| `sand_step/settled/1920x1080_chunks` | 19.8 µs | 0.2% | 104.8 Gelem/s | +0.4% |
| `sand_step/settled/1920x1080_full` | 5.16 ms | 0.1% | 402.0 Melem/s | -0.1% |
| `sand_step/settled/640x360_chunks` | 2.9 µs | 0.0% | 80.5 Gelem/s | -0.2% |
| `sand_step/settled/640x360_full` | 574.5 µs | 0.1% | 401.0 Melem/s | +0.4% |
| `spectrum_f32/4096` | 34.5 µs | 0.1% |  | +0.0% |
| `step_f32_symplectic/1024` | 302.9 µs | 0.0% |  | -63.9% |
| `step_f32_symplectic/128` | 6.6 µs | 0.1% |  | -50.2% |
| `step_f32_symplectic/16` | 223 ns | 0.1% |  | -0.8% |
| `step_f32_verlet/1024` | 605.6 µs | 0.1% |  | -63.9% |
| `step_f32_verlet/128` | 13.2 µs | 0.0% |  | -50.1% |
| `step_f32_verlet/16` | 437 ns | 0.1% |  | -0.4% |
| `step_f64_symplectic/1024` | 689.2 µs | 0.0% |  | -41.1% |
| `step_f64_symplectic/128` | 12.3 µs | 0.2% |  | -32.9% |
| `step_f64_symplectic/16` | 306 ns | 0.0% |  | -0.4% |
| `step_f64_verlet/1024` | 1.38 ms | 0.0% |  | -41.2% |
| `step_f64_verlet/128` | 24.5 µs | 0.0% |  | -33.0% |
| `step_f64_verlet/16` | 593 ns | 0.1% |  | -0.7% |
| `stiff_waveguide_new/21` | 1.27 ms | 0.1% |  | -0.1% |
| `stiff_waveguide_new/36` | 2.19 ms | 0.0% |  | -0.1% |
| `stiff_waveguide_new/60` | 1.67 ms | 0.1% |  | -0.0% |
| `stiff_waveguide_new/69` | 25.83 ms | 0.0% |  | +0.2% |
| `stiff_waveguide_new/84` | 2.52 ms | 0.0% |  | -0.5% |
| `swarm_models/ants/200x120_500` | 214.1 µs | 4.7% |  | +0.1% |
| `swarm_models/physarum/512_100k` | 4.13 ms | 0.8% |  | -0.0% |
| `swarm_models/vicsek/4000` | 1.24 ms | 6.0% |  | +0.8% |
| `swarm_step/Brute/1000` | 503.5 µs | 0.1% | 2.0 Melem/s | -0.2% |
| `swarm_step/Brute/10000` | 48.62 ms | 0.0% | 205.7 Kelem/s | -0.3% |
| `swarm_step/Brute/300` | 50.2 µs | 0.1% | 6.0 Melem/s | -0.1% |
| `swarm_step/Brute/3000` | 4.42 ms | 0.1% | 679.0 Kelem/s | -0.4% |
| `swarm_step/Grid/1000` | 617.0 µs | 3.6% | 1.6 Melem/s | +0.3% |
| `swarm_step/Grid/10000` | 6.38 ms | 9.0% | 1.6 Melem/s | +0.1% |
| `swarm_step/Grid/100000` | 43.10 ms | 1.5% | 2.3 Melem/s | -0.3% |
| `swarm_step/Grid/300` | 140.5 µs | 0.5% | 2.1 Melem/s | +0.2% |
| `swarm_step/Grid/3000` | 1.76 ms | 10.1% | 1.7 Melem/s | +0.1% |
| `swarm_step/Sorted/1000` | 143.0 µs | 4.3% | 7.0 Melem/s | +0.0% |
| `swarm_step/Sorted/10000` | 1.81 ms | 10.2% | 5.5 Melem/s | -0.0% |
| `swarm_step/Sorted/100000` | 14.11 ms | 2.0% | 7.1 Melem/s | -0.3% |
| `swarm_step/Sorted/300` | 41.7 µs | 2.6% | 7.2 Melem/s | -0.0% |
| `swarm_step/Sorted/3000` | 456.6 µs | 4.8% | 6.6 Melem/s | -0.1% |
