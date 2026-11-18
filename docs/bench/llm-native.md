# Benchmarks, 2026-11-17, llm-native

- **Commit:** `ceb9064` (swarm bench: every case steps the same warmed state (a clone per iteration, untimed), not one model on and on (a moving target: ±9-16% where everything else was ±1%; now ±0.1%); developed warm-ups (flocks 1,000 steps, Vicsek 3,000, ants 1,000, Physarum 300) (#315))
- **Machine:** Linux x86_64, 16 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** native (`-C target-cpu=native`)
- **Run:** `cargo xtask bench --level native swarm_`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `llm-native`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 652.1 µs | 0.1% |  |  |
| `barnes_hut_f32/theta_0.5/128` | 38.5 µs | 0.2% |  |  |
| `barnes_hut_f32/theta_0.5/4096` | 4.20 ms | 0.2% |  |  |
| `barnes_hut_f32/theta_1/1024` | 374.4 µs | 0.2% |  |  |
| `barnes_hut_f32/theta_1/128` | 31.4 µs | 0.0% |  |  |
| `barnes_hut_f32/theta_1/4096` | 2.12 ms | 0.0% |  |  |
| `barnes_hut_f64/theta_0.5/1024` | 636.4 µs | 0.1% |  |  |
| `barnes_hut_f64/theta_0.5/128` | 36.5 µs | 0.1% |  |  |
| `barnes_hut_f64/theta_0.5/4096` | 4.14 ms | 0.0% |  |  |
| `barnes_hut_f64/theta_1/1024` | 359.7 µs | 0.2% |  |  |
| `barnes_hut_f64/theta_1/128` | 29.7 µs | 0.0% |  |  |
| `barnes_hut_f64/theta_1/4096` | 2.06 ms | 0.1% |  |  |
| `bodyvec_f32/1024` | 99 ns | 0.1% |  |  |
| `bodyvec_f32/128` | 25 ns | 0.4% |  |  |
| `bodyvec_f32/16` | 6 ns | 0.3% |  |  |
| `bodyvec_f64/1024` | 253 ns | 0.2% |  |  |
| `bodyvec_f64/128` | 37 ns | 0.1% |  |  |
| `bodyvec_f64/16` | 8 ns | 0.1% |  |  |
| `broadphase_f64/1024` | 53.2 µs | 0.3% |  |  |
| `broadphase_f64/128` | 5.5 µs | 0.4% |  |  |
| `broadphase_f64/4096` | 343.6 µs | 0.2% |  |  |
| `fft_f32/1024` | 4.6 µs | 0.0% |  |  |
| `fft_f32/16384` | 128.8 µs | 0.0% |  |  |
| `fft_f32/4096` | 21.6 µs | 0.1% |  |  |
| `pairwise_f32/1024` | 109.0 µs | 2.3% |  |  |
| `pairwise_f32/128` | 5.8 µs | 4.9% |  |  |
| `pairwise_f32/16` | 200 ns | 0.1% |  |  |
| `pairwise_f32/4096` | 1.61 ms | 0.6% |  |  |
| `pairwise_f64/1024` | 220.3 µs | 1.1% |  |  |
| `pairwise_f64/128` | 7.4 µs | 3.0% |  |  |
| `pairwise_f64/16` | 277 ns | 0.1% |  |  |
| `pairwise_f64/4096` | 3.23 ms | 0.1% |  |  |
| `piano_16_voices_x3_strings/128` | 61.6 µs | 0.1% |  |  |
| `piano_design_88_keys` | 25.52 ms | 0.1% |  |  |
| `sand_step/busy/1920x1080_chunks` | 15.93 ms | 0.1% | 130.1 Melem/s |  |
| `sand_step/busy/1920x1080_full` | 15.73 ms | 0.0% | 131.8 Melem/s |  |
| `sand_step/busy/640x360_chunks` | 1.74 ms | 0.1% | 132.5 Melem/s |  |
| `sand_step/busy/640x360_full` | 1.72 ms | 0.1% | 133.9 Melem/s |  |
| `sand_step/settled/1920x1080_chunks` | 21.3 µs | 0.2% | 97.4 Gelem/s |  |
| `sand_step/settled/1920x1080_full` | 5.13 ms | 0.1% | 403.9 Melem/s |  |
| `sand_step/settled/640x360_chunks` | 3.0 µs | 0.2% | 75.6 Gelem/s |  |
| `sand_step/settled/640x360_full` | 574.0 µs | 0.1% | 401.4 Melem/s |  |
| `spectrum_f32/4096` | 24.1 µs | 0.0% |  |  |
| `step_f32_symplectic/1024` | 99.2 µs | 0.1% |  |  |
| `step_f32_symplectic/128` | 4.7 µs | 0.1% |  |  |
| `step_f32_symplectic/16` | 239 ns | 0.1% |  |  |
| `step_f32_verlet/1024` | 197.6 µs | 0.1% |  |  |
| `step_f32_verlet/128` | 9.8 µs | 0.1% |  |  |
| `step_f32_verlet/16` | 433 ns | 0.1% |  |  |
| `step_f64_symplectic/1024` | 209.2 µs | 0.1% |  |  |
| `step_f64_symplectic/128` | 6.4 µs | 0.1% |  |  |
| `step_f64_symplectic/16` | 307 ns | 0.0% |  |  |
| `step_f64_verlet/1024` | 401.9 µs | 0.1% |  |  |
| `step_f64_verlet/128` | 13.0 µs | 0.1% |  |  |
| `step_f64_verlet/16` | 585 ns | 0.0% |  |  |
| `stiff_waveguide_new/21` | 43.9 µs | 0.1% |  |  |
| `stiff_waveguide_new/36` | 427.2 µs | 0.0% |  |  |
| `stiff_waveguide_new/60` | 140.6 µs | 0.1% |  |  |
| `stiff_waveguide_new/69` | 3.10 ms | 0.2% |  |  |
| `stiff_waveguide_new/84` | 493.5 µs | 0.1% |  |  |
| `swarm_models/ants/200x120_500` | 182.4 µs | 0.1% |  | -14.0% |
| `swarm_models/physarum/512_100k` | 3.05 ms | 0.0% |  | +5.3% |
| `swarm_models/vicsek/4000` | 913.4 µs | 0.0% |  | -11.9% |
| `swarm_step/Brute/1000` | 157.1 µs | 0.0% | 6.4 Melem/s | -2.8% |
| `swarm_step/Brute/10000` | 13.09 ms | 0.0% | 763.7 Kelem/s | -0.3% |
| `swarm_step/Brute/300` | 19.3 µs | 0.4% | 15.6 Melem/s | -19.1% |
| `swarm_step/Brute/3000` | 1.25 ms | 0.0% | 2.4 Melem/s | -0.7% |
| `swarm_step/Grid/1000` | 266.7 µs | 0.1% | 3.7 Melem/s | -54.6% |
| `swarm_step/Grid/10000` | 4.30 ms | 0.1% | 2.3 Melem/s | -28.7% |
| `swarm_step/Grid/100000` | 51.96 ms | 0.1% | 1.9 Melem/s | +28.4% |
| `swarm_step/Grid/300` | 38.9 µs | 0.1% | 7.7 Melem/s | -70.7% |
| `swarm_step/Grid/3000` | 1.09 ms | 0.0% | 2.7 Melem/s | -33.7% |
| `swarm_step/Sorted/1000` | 58.5 µs | 0.1% | 17.1 Melem/s | -38.0% |
| `swarm_step/Sorted/10000` | 940.9 µs | 0.0% | 10.6 Melem/s | -3.9% |
| `swarm_step/Sorted/100000` | 10.34 ms | 0.1% | 9.7 Melem/s | +6.2% |
| `swarm_step/Sorted/300` | 16.8 µs | 0.1% | 17.8 Melem/s | -37.3% |
| `swarm_step/Sorted/3000` | 190.0 µs | 0.1% | 15.8 Melem/s | -33.0% |
