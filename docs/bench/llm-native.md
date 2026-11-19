# Benchmarks, 2026-11-19, llm-native

- **Commit:** `24cb23b` (Health check: narrower APIs, ants.rs split, the workspace version, TASKS condensed (#334))
- **Machine:** Linux x86_64, 16 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** native (`-C target-cpu=native`)
- **Run:** `cargo xtask bench --level native`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `llm-native`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 654.6 µs | 0.1% |  | +0.4% |
| `barnes_hut_f32/theta_0.5/128` | 38.8 µs | 0.1% |  | +0.1% |
| `barnes_hut_f32/theta_0.5/4096` | 4.19 ms | 0.0% |  | +0.7% |
| `barnes_hut_f32/theta_1/1024` | 373.1 µs | 0.1% |  | -0.6% |
| `barnes_hut_f32/theta_1/128` | 31.2 µs | 0.1% |  | +0.1% |
| `barnes_hut_f32/theta_1/4096` | 2.13 ms | 0.0% |  | +0.4% |
| `barnes_hut_f64/theta_0.5/1024` | 633.7 µs | 0.0% |  | +0.0% |
| `barnes_hut_f64/theta_0.5/128` | 36.5 µs | 0.1% |  | -0.5% |
| `barnes_hut_f64/theta_0.5/4096` | 4.14 ms | 0.0% |  | +0.0% |
| `barnes_hut_f64/theta_1/1024` | 360.6 µs | 0.1% |  | +0.2% |
| `barnes_hut_f64/theta_1/128` | 29.7 µs | 0.0% |  | +0.1% |
| `barnes_hut_f64/theta_1/4096` | 2.06 ms | 0.0% |  | -0.0% |
| `bodyvec_f32/1024` | 106 ns | 0.1% |  | -5.1% |
| `bodyvec_f32/128` | 25 ns | 0.1% |  | -2.8% |
| `bodyvec_f32/16` | 6 ns | 0.2% |  | +2.0% |
| `bodyvec_f64/1024` | 247 ns | 0.1% |  | +2.2% |
| `bodyvec_f64/128` | 38 ns | 0.1% |  | +5.3% |
| `bodyvec_f64/16` | 8 ns | 0.5% |  | +24.2% |
| `broadphase_f64/1024` | 54.2 µs | 0.3% |  | +1.3% |
| `broadphase_f64/128` | 5.6 µs | 0.5% |  | +0.8% |
| `broadphase_f64/4096` | 344.0 µs | 0.2% |  | -0.4% |
| `fft_f32/1024` | 4.6 µs | 0.0% |  | -3.7% |
| `fft_f32/16384` | 129.5 µs | 0.0% |  | +0.8% |
| `fft_f32/4096` | 21.5 µs | 0.1% |  | -1.5% |
| `pairwise_f32/1024` | 97.8 µs | 0.1% |  | +1.2% |
| `pairwise_f32/128` | 4.5 µs | 0.1% |  | -1.3% |
| `pairwise_f32/16` | 196 ns | 0.1% |  | -1.8% |
| `pairwise_f32/4096` | 1.52 ms | 0.1% |  | -7.8% |
| `pairwise_f64/1024` | 199.6 µs | 0.1% |  | -3.8% |
| `pairwise_f64/128` | 6.0 µs | 0.1% |  | +0.5% |
| `pairwise_f64/16` | 277 ns | 0.0% |  | -0.1% |
| `pairwise_f64/4096` | 3.21 ms | 0.0% |  | -1.9% |
| `piano_16_voices_x3_strings/128` | 62.7 µs | 0.0% |  | +2.0% |
| `piano_design_88_keys` | 25.57 ms | 0.1% |  | +0.0% |
| `sand_step/busy/1920x1080_chunks` | 9.62 ms | 0.0% | 215.5 Melem/s | -39.4% |
| `sand_step/busy/1920x1080_full` | 9.46 ms | 0.1% | 219.1 Melem/s | -39.8% |
| `sand_step/busy/640x360_chunks` | 1.05 ms | 0.1% | 218.7 Melem/s | -39.2% |
| `sand_step/busy/640x360_full` | 1.03 ms | 0.1% | 223.1 Melem/s | -39.9% |
| `sand_step/settled/1920x1080_chunks` | 20.1 µs | 0.6% | 103.2 Gelem/s | -5.8% |
| `sand_step/settled/1920x1080_full` | 5.12 ms | 0.1% | 404.9 Melem/s | -0.3% |
| `sand_step/settled/640x360_chunks` | 2.5 µs | 1.0% | 91.2 Gelem/s | -16.8% |
| `sand_step/settled/640x360_full` | 575.9 µs | 0.1% | 400.1 Melem/s | +0.4% |
| `spectrum_f32/4096` | 24.2 µs | 0.0% |  | -0.4% |
| `step_f32_symplectic/1024` | 100.5 µs | 0.1% |  | -0.4% |
| `step_f32_symplectic/128` | 4.7 µs | 0.2% |  | +0.3% |
| `step_f32_symplectic/16` | 242 ns | 0.2% |  | +0.7% |
| `step_f32_verlet/1024` | 202.3 µs | 0.1% |  | +3.1% |
| `step_f32_verlet/128` | 9.4 µs | 0.1% |  | +1.8% |
| `step_f32_verlet/16` | 435 ns | 0.1% |  | +0.6% |
| `step_f64_symplectic/1024` | 206.4 µs | 0.1% |  | -0.1% |
| `step_f64_symplectic/128` | 6.3 µs | 0.1% |  | -0.5% |
| `step_f64_symplectic/16` | 316 ns | 0.1% |  | +3.0% |
| `step_f64_verlet/1024` | 400.4 µs | 0.1% |  | -3.8% |
| `step_f64_verlet/128` | 12.6 µs | 0.1% |  | +1.4% |
| `step_f64_verlet/16` | 585 ns | 0.1% |  | -0.4% |
| `stiff_waveguide_new/21` | 44.0 µs | 0.1% |  | -0.2% |
| `stiff_waveguide_new/36` | 426.8 µs | 0.0% |  | -0.0% |
| `stiff_waveguide_new/60` | 141.0 µs | 0.1% |  | -0.4% |
| `stiff_waveguide_new/69` | 3.15 ms | 0.2% |  | +0.8% |
| `stiff_waveguide_new/84` | 494.7 µs | 0.0% |  | +2.6% |
| `swarm_models/ants/200x120_500` | 182.5 µs | 0.1% |  | -0.2% |
| `swarm_models/physarum/512_100k` | 3.04 ms | 0.1% |  | -0.4% |
| `swarm_models/vicsek/4000` | 912.0 µs | 0.1% |  | -1.2% |
| `swarm_step/Brute/1000` | 155.6 µs | 0.1% | 6.4 Melem/s | -1.0% |
| `swarm_step/Brute/10000` | 13.10 ms | 0.0% | 763.1 Kelem/s | +0.2% |
| `swarm_step/Brute/300` | 20.0 µs | 0.2% | 15.0 Melem/s | +3.9% |
| `swarm_step/Brute/3000` | 1.25 ms | 0.0% | 2.4 Melem/s | +0.6% |
| `swarm_step/Grid/1000` | 237.0 µs | 0.1% | 4.2 Melem/s | +2.2% |
| `swarm_step/Grid/10000` | 2.99 ms | 0.0% | 3.3 Melem/s | -6.2% |
| `swarm_step/Grid/100000` | 33.28 ms | 0.0% | 3.0 Melem/s | -22.4% |
| `swarm_step/Grid/300` | 106.4 µs | 0.1% | 2.8 Melem/s | +54.0% |
| `swarm_step/Grid/3000` | 782.2 µs | 0.0% | 3.8 Melem/s | -6.6% |
| `swarm_step/Sorted/1000` | 51.2 µs | 0.1% | 19.5 Melem/s | -12.5% |
| `swarm_step/Sorted/10000` | 575.8 µs | 0.0% | 17.4 Melem/s | -38.9% |
| `swarm_step/Sorted/100000` | 6.36 ms | 0.0% | 15.7 Melem/s | -38.5% |
| `swarm_step/Sorted/300` | 18.6 µs | 0.1% | 16.2 Melem/s | +9.9% |
| `swarm_step/Sorted/3000` | 163.1 µs | 0.1% | 18.4 Melem/s | -14.4% |
