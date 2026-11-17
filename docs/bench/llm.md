# Benchmarks, 2026-11-17, llm

- **Commit:** `ac13749` (xtask bench --record: the pull request leads with what moved past the threshold against the previous record, every level, slower first (#311))
- **Machine:** Linux x86_64, 16 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** baseline (the target's default: no `target-cpu`)
- **Run:** `cargo xtask bench`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `llm`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 893.2 µs | 0.1% |  | -0.3% |
| `barnes_hut_f32/theta_0.5/128` | 23.3 µs | 0.1% |  | -0.1% |
| `barnes_hut_f32/theta_0.5/4096` | 5.15 ms | 0.3% |  | -0.1% |
| `barnes_hut_f32/theta_1/1024` | 609.3 µs | 0.2% |  | +1.4% |
| `barnes_hut_f32/theta_1/128` | 15.7 µs | 0.0% |  | -2.7% |
| `barnes_hut_f32/theta_1/4096` | 3.08 ms | 0.1% |  | +1.4% |
| `barnes_hut_f64/theta_0.5/1024` | 967.4 µs | 0.1% |  | -1.2% |
| `barnes_hut_f64/theta_0.5/128` | 21.6 µs | 0.1% |  | -0.1% |
| `barnes_hut_f64/theta_0.5/4096` | 5.54 ms | 0.1% |  | -0.3% |
| `barnes_hut_f64/theta_1/1024` | 688.0 µs | 0.1% |  | +2.4% |
| `barnes_hut_f64/theta_1/128` | 14.5 µs | 0.0% |  | -0.0% |
| `barnes_hut_f64/theta_1/4096` | 3.41 ms | 0.2% |  | +1.0% |
| `bodyvec_f32/1024` | 267 ns | 0.3% |  | +0.2% |
| `bodyvec_f32/128` | 42 ns | 0.2% |  | -3.3% |
| `bodyvec_f32/16` | 7 ns | 0.4% |  | -5.1% |
| `bodyvec_f64/1024` | 409 ns | 0.0% |  | -1.3% |
| `bodyvec_f64/128` | 57 ns | 0.2% |  | -0.7% |
| `bodyvec_f64/16` | 8 ns | 0.6% |  | -7.9% |
| `broadphase_f64/1024` | 57.5 µs | 0.1% |  | -0.0% |
| `broadphase_f64/128` | 6.0 µs | 0.1% |  | +0.4% |
| `broadphase_f64/4096` | 360.4 µs | 0.1% |  | -0.1% |
| `fft_f32/1024` | 5.1 µs | 0.2% |  | +0.5% |
| `fft_f32/16384` | 146.5 µs | 0.1% |  | +0.3% |
| `fft_f32/4096` | 24.3 µs | 0.1% |  | +0.1% |
| `pairwise_f32/1024` | 304.4 µs | 0.0% |  | +0.0% |
| `pairwise_f32/128` | 6.5 µs | 0.1% |  | +0.6% |
| `pairwise_f32/16` | 204 ns | 0.2% |  | -0.8% |
| `pairwise_f32/4096` | 4.68 ms | 0.0% |  | -0.1% |
| `pairwise_f64/1024` | 649.0 µs | 0.0% |  | +0.5% |
| `pairwise_f64/128` | 13.3 µs | 0.1% |  | +0.1% |
| `pairwise_f64/16` | 278 ns | 0.0% |  | +0.3% |
| `pairwise_f64/4096` | 10.14 ms | 0.2% |  | +1.2% |
| `piano_16_voices_x3_strings/128` | 63.1 µs | 0.1% |  | -0.6% |
| `piano_design_88_keys` | 26.68 ms | 0.1% |  | +0.6% |
| `sand_step/busy/1920x1080_chunks` | 15.17 ms | 0.2% | 136.6 Melem/s | +0.2% |
| `sand_step/busy/1920x1080_full` | 15.11 ms | 0.1% | 137.2 Melem/s | +0.7% |
| `sand_step/busy/640x360_chunks` | 1.67 ms | 0.1% | 138.1 Melem/s | -0.0% |
| `sand_step/busy/640x360_full` | 1.66 ms | 0.1% | 138.8 Melem/s | +0.2% |
| `sand_step/settled/1920x1080_chunks` | 19.8 µs | 0.2% | 104.5 Gelem/s | +0.4% |
| `sand_step/settled/1920x1080_full` | 5.16 ms | 0.0% | 401.8 Melem/s | +0.1% |
| `sand_step/settled/640x360_chunks` | 2.9 µs | 0.1% | 80.5 Gelem/s | +0.2% |
| `sand_step/settled/640x360_full` | 573.3 µs | 0.1% | 401.9 Melem/s | +0.1% |
| `spectrum_f32/4096` | 34.5 µs | 0.0% |  | +0.0% |
| `step_f32_symplectic/1024` | 306.4 µs | 0.2% |  | +0.0% |
| `step_f32_symplectic/128` | 6.6 µs | 0.2% |  | +0.7% |
| `step_f32_symplectic/16` | 224 ns | 0.1% |  | -0.9% |
| `step_f32_verlet/1024` | 610.8 µs | 0.1% |  | +0.0% |
| `step_f32_verlet/128` | 13.3 µs | 0.0% |  | +0.6% |
| `step_f32_verlet/16` | 436 ns | 0.1% |  | +0.2% |
| `step_f64_symplectic/1024` | 648.5 µs | 0.0% |  | +0.2% |
| `step_f64_symplectic/128` | 13.5 µs | 0.1% |  | +0.3% |
| `step_f64_symplectic/16` | 301 ns | 0.0% |  | -0.3% |
| `step_f64_verlet/1024` | 1.31 ms | 0.0% |  | +0.1% |
| `step_f64_verlet/128` | 26.9 µs | 0.1% |  | +0.3% |
| `step_f64_verlet/16` | 596 ns | 0.1% |  | +0.2% |
| `stiff_waveguide_new/21` | 46.3 µs | 0.1% |  | +0.0% |
| `stiff_waveguide_new/36` | 445.3 µs | 0.0% |  | +0.9% |
| `stiff_waveguide_new/60` | 145.7 µs | 0.0% |  | -0.3% |
| `stiff_waveguide_new/69` | 3.27 ms | 0.2% |  | -0.6% |
| `stiff_waveguide_new/84` | 482.0 µs | 0.2% |  | -2.7% |
| `swarm_models/ants/200x120_500` | 236.6 µs | 11.0% |  | +10.7% |
| `swarm_models/physarum/512_100k` | 4.18 ms | 1.0% |  | +1.4% |
| `swarm_models/vicsek/4000` | 1.29 ms | 5.4% |  | +1.0% |
| `swarm_step/Brute/1000` | 498.6 µs | 0.1% | 2.0 Melem/s | -1.1% |
| `swarm_step/Brute/10000` | 47.51 ms | 0.1% | 210.5 Kelem/s | -1.0% |
| `swarm_step/Brute/300` | 50.8 µs | 0.1% | 5.9 Melem/s | -5.0% |
| `swarm_step/Brute/3000` | 4.33 ms | 0.1% | 693.4 Kelem/s | -1.1% |
| `swarm_step/Grid/1000` | 626.2 µs | 3.8% | 1.6 Melem/s | +2.9% |
| `swarm_step/Grid/10000` | 6.55 ms | 9.1% | 1.5 Melem/s | +12.2% |
| `swarm_step/Grid/100000` | 43.88 ms | 1.5% | 2.3 Melem/s | +0.6% |
| `swarm_step/Grid/300` | 140.8 µs | 0.6% | 2.1 Melem/s | -27.4% |
| `swarm_step/Grid/3000` | 1.79 ms | 10.3% | 1.7 Melem/s | +3.5% |
| `swarm_step/Sorted/1000` | 138.9 µs | 4.5% | 7.2 Melem/s | -26.9% |
| `swarm_step/Sorted/10000` | 1.77 ms | 10.5% | 5.7 Melem/s | -8.4% |
| `swarm_step/Sorted/100000` | 13.70 ms | 2.0% | 7.3 Melem/s | -22.7% |
| `swarm_step/Sorted/300` | 40.5 µs | 2.9% | 7.4 Melem/s | -28.6% |
| `swarm_step/Sorted/3000` | 443.3 µs | 4.7% | 6.8 Melem/s | -20.4% |
