# Benchmarks, 2026-11-17, llm

- **Commit:** `ceb9064` (swarm bench: every case steps the same warmed state (a clone per iteration, untimed), not one model on and on (a moving target: ±9-16% where everything else was ±1%; now ±0.1%); developed warm-ups (flocks 1,000 steps, Vicsek 3,000, ants 1,000, Physarum 300) (#315))
- **Machine:** Linux x86_64, 16 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** baseline (the target's default: no `target-cpu`)
- **Run:** `cargo xtask bench swarm_`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `llm`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 893.2 µs | 0.1% |  |  |
| `barnes_hut_f32/theta_0.5/128` | 23.3 µs | 0.1% |  |  |
| `barnes_hut_f32/theta_0.5/4096` | 5.15 ms | 0.3% |  |  |
| `barnes_hut_f32/theta_1/1024` | 609.3 µs | 0.2% |  |  |
| `barnes_hut_f32/theta_1/128` | 15.7 µs | 0.0% |  |  |
| `barnes_hut_f32/theta_1/4096` | 3.08 ms | 0.1% |  |  |
| `barnes_hut_f64/theta_0.5/1024` | 967.4 µs | 0.1% |  |  |
| `barnes_hut_f64/theta_0.5/128` | 21.6 µs | 0.1% |  |  |
| `barnes_hut_f64/theta_0.5/4096` | 5.54 ms | 0.1% |  |  |
| `barnes_hut_f64/theta_1/1024` | 688.0 µs | 0.1% |  |  |
| `barnes_hut_f64/theta_1/128` | 14.5 µs | 0.0% |  |  |
| `barnes_hut_f64/theta_1/4096` | 3.41 ms | 0.2% |  |  |
| `bodyvec_f32/1024` | 267 ns | 0.3% |  |  |
| `bodyvec_f32/128` | 42 ns | 0.2% |  |  |
| `bodyvec_f32/16` | 7 ns | 0.4% |  |  |
| `bodyvec_f64/1024` | 409 ns | 0.0% |  |  |
| `bodyvec_f64/128` | 57 ns | 0.2% |  |  |
| `bodyvec_f64/16` | 8 ns | 0.6% |  |  |
| `broadphase_f64/1024` | 57.5 µs | 0.1% |  |  |
| `broadphase_f64/128` | 6.0 µs | 0.1% |  |  |
| `broadphase_f64/4096` | 360.4 µs | 0.1% |  |  |
| `fft_f32/1024` | 5.1 µs | 0.2% |  |  |
| `fft_f32/16384` | 146.5 µs | 0.1% |  |  |
| `fft_f32/4096` | 24.3 µs | 0.1% |  |  |
| `pairwise_f32/1024` | 304.4 µs | 0.0% |  |  |
| `pairwise_f32/128` | 6.5 µs | 0.1% |  |  |
| `pairwise_f32/16` | 204 ns | 0.2% |  |  |
| `pairwise_f32/4096` | 4.68 ms | 0.0% |  |  |
| `pairwise_f64/1024` | 649.0 µs | 0.0% |  |  |
| `pairwise_f64/128` | 13.3 µs | 0.1% |  |  |
| `pairwise_f64/16` | 278 ns | 0.0% |  |  |
| `pairwise_f64/4096` | 10.14 ms | 0.2% |  |  |
| `piano_16_voices_x3_strings/128` | 63.1 µs | 0.1% |  |  |
| `piano_design_88_keys` | 26.68 ms | 0.1% |  |  |
| `sand_step/busy/1920x1080_chunks` | 15.17 ms | 0.2% | 136.6 Melem/s |  |
| `sand_step/busy/1920x1080_full` | 15.11 ms | 0.1% | 137.2 Melem/s |  |
| `sand_step/busy/640x360_chunks` | 1.67 ms | 0.1% | 138.1 Melem/s |  |
| `sand_step/busy/640x360_full` | 1.66 ms | 0.1% | 138.8 Melem/s |  |
| `sand_step/settled/1920x1080_chunks` | 19.8 µs | 0.2% | 104.5 Gelem/s |  |
| `sand_step/settled/1920x1080_full` | 5.16 ms | 0.0% | 401.8 Melem/s |  |
| `sand_step/settled/640x360_chunks` | 2.9 µs | 0.1% | 80.5 Gelem/s |  |
| `sand_step/settled/640x360_full` | 573.3 µs | 0.1% | 401.9 Melem/s |  |
| `spectrum_f32/4096` | 34.5 µs | 0.0% |  |  |
| `step_f32_symplectic/1024` | 306.4 µs | 0.2% |  |  |
| `step_f32_symplectic/128` | 6.6 µs | 0.2% |  |  |
| `step_f32_symplectic/16` | 224 ns | 0.1% |  |  |
| `step_f32_verlet/1024` | 610.8 µs | 0.1% |  |  |
| `step_f32_verlet/128` | 13.3 µs | 0.0% |  |  |
| `step_f32_verlet/16` | 436 ns | 0.1% |  |  |
| `step_f64_symplectic/1024` | 648.5 µs | 0.0% |  |  |
| `step_f64_symplectic/128` | 13.5 µs | 0.1% |  |  |
| `step_f64_symplectic/16` | 301 ns | 0.0% |  |  |
| `step_f64_verlet/1024` | 1.31 ms | 0.0% |  |  |
| `step_f64_verlet/128` | 26.9 µs | 0.1% |  |  |
| `step_f64_verlet/16` | 596 ns | 0.1% |  |  |
| `stiff_waveguide_new/21` | 46.3 µs | 0.1% |  |  |
| `stiff_waveguide_new/36` | 445.3 µs | 0.0% |  |  |
| `stiff_waveguide_new/60` | 145.7 µs | 0.0% |  |  |
| `stiff_waveguide_new/69` | 3.27 ms | 0.2% |  |  |
| `stiff_waveguide_new/84` | 482.0 µs | 0.2% |  |  |
| `swarm_models/ants/200x120_500` | 191.6 µs | 0.1% |  | -19.0% |
| `swarm_models/physarum/512_100k` | 4.29 ms | 0.2% |  | +2.6% |
| `swarm_models/vicsek/4000` | 1.18 ms | 0.2% |  | -8.3% |
| `swarm_step/Brute/1000` | 495.7 µs | 0.1% | 2.0 Melem/s | -0.6% |
| `swarm_step/Brute/10000` | 47.49 ms | 0.0% | 210.6 Kelem/s | -0.0% |
| `swarm_step/Brute/300` | 48.3 µs | 0.0% | 6.2 Melem/s | -4.9% |
| `swarm_step/Brute/3000` | 4.32 ms | 0.1% | 694.1 Kelem/s | -0.1% |
| `swarm_step/Grid/1000` | 324.7 µs | 0.1% | 3.1 Melem/s | -48.2% |
| `swarm_step/Grid/10000` | 4.85 ms | 0.1% | 2.1 Melem/s | -26.0% |
| `swarm_step/Grid/100000` | 59.91 ms | 0.1% | 1.7 Melem/s | +36.5% |
| `swarm_step/Grid/300` | 61.0 µs | 0.3% | 4.9 Melem/s | -56.7% |
| `swarm_step/Grid/3000` | 1.26 ms | 0.1% | 2.4 Melem/s | -29.2% |
| `swarm_step/Sorted/1000` | 97.8 µs | 0.2% | 10.2 Melem/s | -29.6% |
| `swarm_step/Sorted/10000` | 1.45 ms | 0.1% | 6.9 Melem/s | -18.1% |
| `swarm_step/Sorted/100000` | 17.03 ms | 0.0% | 5.9 Melem/s | +24.3% |
| `swarm_step/Sorted/300` | 28.6 µs | 0.2% | 10.5 Melem/s | -29.3% |
| `swarm_step/Sorted/3000` | 326.6 µs | 0.1% | 9.2 Melem/s | -26.3% |
