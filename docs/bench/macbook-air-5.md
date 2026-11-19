# Benchmarks, 2026-11-19, macbook-air-5

- **Commit:** `2646727` (acoustic: every key's dispersion design tested, at both rates, against what limits it (with its room: 2 cents; room-limited: 3; one biquad for three partials: 12, a known gap) (#336))
- **Machine:** Darwin arm64, 10 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** baseline (the target's default: no `target-cpu`)
- **Run:** `cargo xtask bench`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `macbook-air-5`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 434.8 µs | 0.1% |  | +0.3% |
| `barnes_hut_f32/theta_0.5/128` | 27.6 µs | 0.1% |  | +0.3% |
| `barnes_hut_f32/theta_0.5/4096` | 3.83 ms | 0.4% |  | +0.3% |
| `barnes_hut_f32/theta_1/1024` | 208.2 µs | 0.2% |  | -1.0% |
| `barnes_hut_f32/theta_1/128` | 17.5 µs | 0.1% |  | +0.1% |
| `barnes_hut_f32/theta_1/4096` | 1.69 ms | 1.1% |  | +3.2% |
| `barnes_hut_f64/theta_0.5/1024` | 436.6 µs | 0.2% |  | +0.2% |
| `barnes_hut_f64/theta_0.5/128` | 27.5 µs | 0.1% |  | -0.8% |
| `barnes_hut_f64/theta_0.5/4096` | 4.02 ms | 0.7% |  | +2.2% |
| `barnes_hut_f64/theta_1/1024` | 207.4 µs | 0.1% |  | -0.1% |
| `barnes_hut_f64/theta_1/128` | 17.4 µs | 0.1% |  | -0.2% |
| `barnes_hut_f64/theta_1/4096` | 1.67 ms | 0.7% |  | -0.1% |
| `bodyvec_f32/1024` | 258 ns | 1.5% |  | +3.1% |
| `bodyvec_f32/128` | 40 ns | 0.2% |  | -0.1% |
| `bodyvec_f32/16` | 11 ns | 0.2% |  | +1.1% |
| `bodyvec_f64/1024` | 583 ns | 1.3% |  | +8.0% |
| `bodyvec_f64/128` | 70 ns | 0.4% |  | +0.2% |
| `bodyvec_f64/16` | 23 ns | 0.2% |  | +1.0% |
| `broadphase_f64/1024` | 69.9 µs | 0.1% |  | -0.4% |
| `broadphase_f64/128` | 6.8 µs | 0.1% |  | -0.3% |
| `broadphase_f64/4096` | 324.7 µs | 0.1% |  | +0.0% |
| `fft_f32/1024` | 4.4 µs | 0.1% |  | -0.3% |
| `fft_f32/16384` | 97.6 µs | 0.1% |  | -0.2% |
| `fft_f32/4096` | 20.1 µs | 0.1% |  | -0.6% |
| `pairwise_f32/1024` | 272.0 µs | 0.1% |  | +0.9% |
| `pairwise_f32/128` | 5.6 µs | 0.1% |  | -0.1% |
| `pairwise_f32/16` | 147 ns | 0.1% |  | +0.2% |
| `pairwise_f32/4096` | 4.32 ms | 0.0% |  | +1.1% |
| `pairwise_f64/1024` | 491.7 µs | 0.1% |  | -0.5% |
| `pairwise_f64/128` | 8.3 µs | 0.2% |  | +0.5% |
| `pairwise_f64/16` | 165 ns | 0.1% |  | -0.4% |
| `pairwise_f64/4096` | 7.92 ms | 0.0% |  | -1.1% |
| `piano_16_voices_x3_strings/128` | 50.7 µs | 0.0% |  | -0.2% |
| `piano_design_88_keys` | 30.00 ms | 0.1% |  | +0.5% |
| `sand_step/busy/1920x1080_chunks` | 8.21 ms | 0.1% | 252.4 Melem/s | -43.9% |
| `sand_step/busy/1920x1080_full` | 8.09 ms | 0.1% | 256.2 Melem/s | -44.4% |
| `sand_step/busy/640x360_chunks` | 777.1 µs | 0.2% | 296.5 Melem/s | -48.8% |
| `sand_step/busy/640x360_full` | 790.6 µs | 0.5% | 291.4 Melem/s | -48.2% |
| `sand_step/settled/1920x1080_chunks` | 27.7 µs | 0.5% | 74.9 Gelem/s | -1.8% |
| `sand_step/settled/1920x1080_full` | 5.40 ms | 0.1% | 384.3 Melem/s | +2.8% |
| `sand_step/settled/640x360_chunks` | 3.2 µs | 0.6% | 73.1 Gelem/s | -4.9% |
| `sand_step/settled/640x360_full` | 596.7 µs | 0.1% | 386.1 Melem/s | +2.5% |
| `spectrum_f32/4096` | 25.7 µs | 0.1% |  | -0.5% |
| `step_f32_symplectic/1024` | 272.5 µs | 0.1% |  | +0.9% |
| `step_f32_symplectic/128` | 5.7 µs | 0.1% |  | -0.0% |
| `step_f32_symplectic/16` | 162 ns | 0.1% |  | +3.5% |
| `step_f32_verlet/1024` | 543.3 µs | 0.1% |  | +0.5% |
| `step_f32_verlet/128` | 11.4 µs | 0.1% |  | -0.1% |
| `step_f32_verlet/16` | 319 ns | 0.2% |  | +2.3% |
| `step_f64_symplectic/1024` | 492.4 µs | 0.1% |  | -0.4% |
| `step_f64_symplectic/128` | 8.4 µs | 0.1% |  | +0.2% |
| `step_f64_symplectic/16` | 178 ns | 0.1% |  | -0.2% |
| `step_f64_verlet/1024` | 985.2 µs | 0.0% |  | -0.5% |
| `step_f64_verlet/128` | 16.8 µs | 0.1% |  | +0.2% |
| `step_f64_verlet/16` | 355 ns | 0.1% |  | +0.1% |
| `stiff_waveguide_new/21` | 51.4 µs | 0.2% |  | +0.4% |
| `stiff_waveguide_new/36` | 498.2 µs | 0.2% |  | -0.9% |
| `stiff_waveguide_new/60` | 162.2 µs | 0.1% |  | -1.6% |
| `stiff_waveguide_new/69` | 3.47 ms | 0.2% |  | -0.4% |
| `stiff_waveguide_new/84` | 586.9 µs | 0.1% |  | -0.5% |
| `swarm_models/ants/200x120_500` | 189.3 µs | 0.3% |  | +1.5% |
| `swarm_models/physarum/512_100k` | 2.89 ms | 0.2% |  | +4.4% |
| `swarm_models/vicsek/4000` | 991.8 µs | 0.1% |  | +1.7% |
| `swarm_step/Brute/1000` | 451.8 µs | 0.3% | 2.2 Melem/s | +0.3% |
| `swarm_step/Brute/10000` | 44.12 ms | 0.2% | 226.6 Kelem/s | +1.4% |
| `swarm_step/Brute/300` | 43.6 µs | 0.2% | 6.9 Melem/s | +0.8% |
| `swarm_step/Brute/3000` | 3.98 ms | 0.4% | 754.3 Kelem/s | +1.1% |
| `swarm_step/Grid/1000` | 209.1 µs | 0.1% | 4.8 Melem/s | +9.7% |
| `swarm_step/Grid/10000` | 2.62 ms | 0.2% | 3.8 Melem/s | +2.6% |
| `swarm_step/Grid/100000` | 29.09 ms | 0.1% | 3.4 Melem/s | -14.7% |
| `swarm_step/Grid/300` | 93.3 µs | 0.2% | 3.2 Melem/s | +66.1% |
| `swarm_step/Grid/3000` | 690.1 µs | 0.0% | 4.3 Melem/s | +1.1% |
| `swarm_step/Sorted/1000` | 81.9 µs | 1.5% | 12.2 Melem/s | -1.7% |
| `swarm_step/Sorted/10000` | 969.0 µs | 1.4% | 10.3 Melem/s | -7.6% |
| `swarm_step/Sorted/100000` | 10.58 ms | 1.3% | 9.5 Melem/s | -30.1% |
| `swarm_step/Sorted/300` | 32.8 µs | 1.3% | 9.2 Melem/s | +34.2% |
| `swarm_step/Sorted/3000` | 266.5 µs | 1.8% | 11.3 Melem/s | -5.1% |
