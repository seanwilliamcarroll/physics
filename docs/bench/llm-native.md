# Benchmarks, 2026-11-17, llm-native

- **Commit:** `8e2e7a2` (swarm: the grid's candidates through a branchless scalar add (Seen::add_masked; Grid −37% at 100k on the M4, −35% in V8); sorted's leftovers keep the branching add (the masked one was 20% slower at 1k in V8) (#320))
- **Machine:** Linux x86_64, 16 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** native (`-C target-cpu=native`)
- **Run:** `cargo xtask bench --level native`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `llm-native`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 652.2 µs | 0.0% |  | +0.0% |
| `barnes_hut_f32/theta_0.5/128` | 38.7 µs | 0.0% |  | +0.6% |
| `barnes_hut_f32/theta_0.5/4096` | 4.16 ms | 0.1% |  | -0.8% |
| `barnes_hut_f32/theta_1/1024` | 375.6 µs | 0.2% |  | +0.3% |
| `barnes_hut_f32/theta_1/128` | 31.2 µs | 0.0% |  | -0.8% |
| `barnes_hut_f32/theta_1/4096` | 2.12 ms | 0.1% |  | -0.1% |
| `barnes_hut_f64/theta_0.5/1024` | 633.4 µs | 0.1% |  | -0.5% |
| `barnes_hut_f64/theta_0.5/128` | 36.7 µs | 0.1% |  | +0.4% |
| `barnes_hut_f64/theta_0.5/4096` | 4.14 ms | 0.1% |  | -0.0% |
| `barnes_hut_f64/theta_1/1024` | 359.7 µs | 0.5% |  | +0.0% |
| `barnes_hut_f64/theta_1/128` | 29.6 µs | 0.0% |  | -0.1% |
| `barnes_hut_f64/theta_1/4096` | 2.06 ms | 0.1% |  | +0.1% |
| `bodyvec_f32/1024` | 112 ns | 0.1% |  | +12.8% |
| `bodyvec_f32/128` | 26 ns | 0.1% |  | +5.4% |
| `bodyvec_f32/16` | 6 ns | 0.1% |  | -6.3% |
| `bodyvec_f64/1024` | 242 ns | 0.1% |  | -4.2% |
| `bodyvec_f64/128` | 36 ns | 0.1% |  | -1.4% |
| `bodyvec_f64/16` | 7 ns | 0.1% |  | -20.1% |
| `broadphase_f64/1024` | 53.5 µs | 0.3% |  | +0.7% |
| `broadphase_f64/128` | 5.5 µs | 0.4% |  | +0.9% |
| `broadphase_f64/4096` | 345.5 µs | 0.2% |  | +0.5% |
| `fft_f32/1024` | 4.8 µs | 0.2% |  | +4.0% |
| `fft_f32/16384` | 128.5 µs | 0.1% |  | -0.2% |
| `fft_f32/4096` | 21.8 µs | 0.0% |  | +0.9% |
| `pairwise_f32/1024` | 96.6 µs | 0.1% |  | -11.3% |
| `pairwise_f32/128` | 4.5 µs | 0.1% |  | -22.6% |
| `pairwise_f32/16` | 200 ns | 0.1% |  | +0.2% |
| `pairwise_f32/4096` | 1.64 ms | 0.1% |  | +2.2% |
| `pairwise_f64/1024` | 207.5 µs | 0.1% |  | -5.8% |
| `pairwise_f64/128` | 5.9 µs | 0.1% |  | -19.9% |
| `pairwise_f64/16` | 278 ns | 0.3% |  | +0.3% |
| `pairwise_f64/4096` | 3.27 ms | 0.1% |  | +1.2% |
| `piano_16_voices_x3_strings/128` | 61.4 µs | 0.1% |  | -0.2% |
| `piano_design_88_keys` | 25.56 ms | 0.1% |  | +0.1% |
| `sand_step/busy/1920x1080_chunks` | 15.86 ms | 0.1% | 130.7 Melem/s | -0.4% |
| `sand_step/busy/1920x1080_full` | 15.71 ms | 0.0% | 132.0 Melem/s | -0.1% |
| `sand_step/busy/640x360_chunks` | 1.73 ms | 0.0% | 132.9 Melem/s | -0.3% |
| `sand_step/busy/640x360_full` | 1.72 ms | 0.1% | 134.1 Melem/s | -0.2% |
| `sand_step/settled/1920x1080_chunks` | 21.3 µs | 0.3% | 97.3 Gelem/s | +0.2% |
| `sand_step/settled/1920x1080_full` | 5.14 ms | 0.1% | 403.7 Melem/s | +0.1% |
| `sand_step/settled/640x360_chunks` | 3.0 µs | 0.1% | 75.9 Gelem/s | -0.3% |
| `sand_step/settled/640x360_full` | 573.7 µs | 0.0% | 401.6 Melem/s | -0.1% |
| `spectrum_f32/4096` | 24.3 µs | 0.1% |  | +0.7% |
| `step_f32_symplectic/1024` | 101.0 µs | 0.0% |  | +1.8% |
| `step_f32_symplectic/128` | 4.7 µs | 0.1% |  | -0.3% |
| `step_f32_symplectic/16` | 240 ns | 0.3% |  | +0.3% |
| `step_f32_verlet/1024` | 196.2 µs | 0.1% |  | -0.7% |
| `step_f32_verlet/128` | 9.3 µs | 0.1% |  | -5.1% |
| `step_f32_verlet/16` | 433 ns | 0.2% |  | -0.2% |
| `step_f64_symplectic/1024` | 206.7 µs | 0.1% |  | -1.2% |
| `step_f64_symplectic/128` | 6.4 µs | 0.1% |  | -1.0% |
| `step_f64_symplectic/16` | 306 ns | 0.0% |  | -0.0% |
| `step_f64_verlet/1024` | 416.1 µs | 0.1% |  | +3.5% |
| `step_f64_verlet/128` | 12.4 µs | 0.1% |  | -4.8% |
| `step_f64_verlet/16` | 587 ns | 0.0% |  | +0.4% |
| `stiff_waveguide_new/21` | 44.1 µs | 0.1% |  | +0.3% |
| `stiff_waveguide_new/36` | 426.9 µs | 0.1% |  | -0.1% |
| `stiff_waveguide_new/60` | 141.5 µs | 0.2% |  | +0.7% |
| `stiff_waveguide_new/69` | 3.12 ms | 0.2% |  | +0.7% |
| `stiff_waveguide_new/84` | 482.4 µs | 0.1% |  | -2.3% |
| `swarm_models/ants/200x120_500` | 182.9 µs | 0.1% |  | +0.3% |
| `swarm_models/physarum/512_100k` | 3.06 ms | 0.2% |  | +0.3% |
| `swarm_models/vicsek/4000` | 923.3 µs | 0.4% |  | +1.1% |
| `swarm_step/Brute/1000` | 157.2 µs | 0.0% | 6.4 Melem/s | +0.1% |
| `swarm_step/Brute/10000` | 13.08 ms | 0.0% | 764.5 Kelem/s | -0.1% |
| `swarm_step/Brute/300` | 19.3 µs | 0.1% | 15.6 Melem/s | -0.0% |
| `swarm_step/Brute/3000` | 1.25 ms | 0.0% | 2.4 Melem/s | -0.0% |
| `swarm_step/Grid/1000` | 232.0 µs | 0.0% | 4.3 Melem/s | -13.0% |
| `swarm_step/Grid/10000` | 3.19 ms | 0.0% | 3.1 Melem/s | -25.9% |
| `swarm_step/Grid/100000` | 42.87 ms | 0.0% | 2.3 Melem/s | -17.5% |
| `swarm_step/Grid/300` | 69.1 µs | 0.1% | 4.3 Melem/s | +77.8% |
| `swarm_step/Grid/3000` | 837.5 µs | 0.0% | 3.6 Melem/s | -23.5% |
| `swarm_step/Sorted/1000` | 58.5 µs | 0.1% | 17.1 Melem/s | +0.0% |
| `swarm_step/Sorted/10000` | 943.1 µs | 0.1% | 10.6 Melem/s | +0.2% |
| `swarm_step/Sorted/100000` | 10.34 ms | 0.1% | 9.7 Melem/s | -0.0% |
| `swarm_step/Sorted/300` | 16.9 µs | 0.1% | 17.8 Melem/s | +0.3% |
| `swarm_step/Sorted/3000` | 190.5 µs | 0.1% | 15.8 Melem/s | +0.3% |
