# Benchmarks, 2026-11-17, llm

- **Commit:** `a56d0bc` (acoustic: the dispersion fit stops at convergence; short refits (piano design another −25%) (#304))
- **Machine:** Linux x86_64, 16 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Run:** `cargo xtask bench`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `llm`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 902.5 µs | 0.2% |  | +0.6% |
| `barnes_hut_f32/theta_0.5/128` | 23.3 µs | 0.1% |  | -0.3% |
| `barnes_hut_f32/theta_0.5/4096` | 5.12 ms | 0.1% |  | -1.1% |
| `barnes_hut_f32/theta_1/1024` | 610.2 µs | 0.1% |  | -1.2% |
| `barnes_hut_f32/theta_1/128` | 16.1 µs | 0.1% |  | +0.3% |
| `barnes_hut_f32/theta_1/4096` | 3.09 ms | 0.1% |  | +1.9% |
| `barnes_hut_f64/theta_0.5/1024` | 971.3 µs | 0.1% |  | -1.7% |
| `barnes_hut_f64/theta_0.5/128` | 21.5 µs | 0.1% |  | -1.2% |
| `barnes_hut_f64/theta_0.5/4096` | 5.55 ms | 0.1% |  | -0.2% |
| `barnes_hut_f64/theta_1/1024` | 686.5 µs | 0.1% |  | +0.3% |
| `barnes_hut_f64/theta_1/128` | 14.4 µs | 0.1% |  | -0.4% |
| `barnes_hut_f64/theta_1/4096` | 3.40 ms | 0.2% |  | +0.1% |
| `bodyvec_f32/1024` | 272 ns | 0.1% |  | +0.5% |
| `bodyvec_f32/128` | 42 ns | 0.3% |  | +0.8% |
| `bodyvec_f32/16` | 7 ns | 0.2% |  | +0.1% |
| `bodyvec_f64/1024` | 410 ns | 0.1% |  | -0.2% |
| `bodyvec_f64/128` | 56 ns | 0.0% |  | +0.0% |
| `bodyvec_f64/16` | 8 ns | 0.6% |  | -2.0% |
| `broadphase_f64/1024` | 60.7 µs | 0.2% |  | +1.4% |
| `broadphase_f64/128` | 6.2 µs | 0.3% |  | +1.8% |
| `broadphase_f64/4096` | 394.5 µs | 0.2% |  | +0.5% |
| `fft_f32/1024` | 5.1 µs | 0.2% |  | +0.2% |
| `fft_f32/16384` | 147.2 µs | 0.1% |  | +2.9% |
| `fft_f32/4096` | 24.3 µs | 0.2% |  | +0.1% |
| `pairwise_f32/1024` | 302.0 µs | 0.0% |  | +0.1% |
| `pairwise_f32/128` | 6.4 µs | 0.1% |  | -0.4% |
| `pairwise_f32/16` | 202 ns | 0.3% |  | +0.2% |
| `pairwise_f32/4096` | 4.68 ms | 0.0% |  | +0.1% |
| `pairwise_f64/1024` | 687.5 µs | 0.1% |  | -0.1% |
| `pairwise_f64/128` | 12.1 µs | 0.0% |  | -0.1% |
| `pairwise_f64/16` | 278 ns | 0.1% |  | +0.3% |
| `pairwise_f64/4096` | 10.87 ms | 0.0% |  | -0.1% |
| `piano_16_voices_x3_strings/128` | 62.3 µs | 0.0% |  | -1.2% |
| `piano_design_88_keys` | 49.02 ms | 0.1% |  | -70.2% |
| `sand_step/busy/1920x1080_chunks` | 15.18 ms | 0.1% | 136.6 Melem/s | -0.1% |
| `sand_step/busy/1920x1080_full` | 15.04 ms | 0.1% | 137.8 Melem/s | -0.2% |
| `sand_step/busy/640x360_chunks` | 1.65 ms | 0.1% | 139.7 Melem/s | -0.4% |
| `sand_step/busy/640x360_full` | 1.64 ms | 0.1% | 140.5 Melem/s | -0.4% |
| `sand_step/settled/1920x1080_chunks` | 20.1 µs | 0.5% | 103.2 Gelem/s | +1.6% |
| `sand_step/settled/1920x1080_full` | 5.17 ms | 0.1% | 401.2 Melem/s | +0.2% |
| `sand_step/settled/640x360_chunks` | 2.9 µs | 0.1% | 80.3 Gelem/s | +0.3% |
| `sand_step/settled/640x360_full` | 572.4 µs | 0.1% | 402.5 Melem/s | -0.4% |
| `spectrum_f32/4096` | 34.6 µs | 0.4% |  | +0.3% |
| `step_f32_symplectic/1024` | 303.5 µs | 0.1% |  | +0.2% |
| `step_f32_symplectic/128` | 6.7 µs | 0.1% |  | +1.2% |
| `step_f32_symplectic/16` | 226 ns | 0.0% |  | +1.1% |
| `step_f32_verlet/1024` | 605.3 µs | 0.0% |  | -0.0% |
| `step_f32_verlet/128` | 13.2 µs | 0.0% |  | +0.2% |
| `step_f32_verlet/16` | 438 ns | 0.1% |  | +0.2% |
| `step_f64_symplectic/1024` | 688.3 µs | 0.0% |  | -0.1% |
| `step_f64_symplectic/128` | 12.3 µs | 0.1% |  | -0.3% |
| `step_f64_symplectic/16` | 307 ns | 0.1% |  | +0.1% |
| `step_f64_verlet/1024` | 1.38 ms | 0.0% |  | +0.1% |
| `step_f64_verlet/128` | 24.6 µs | 0.0% |  | +0.3% |
| `step_f64_verlet/16` | 592 ns | 0.1% |  | -0.2% |
| `stiff_waveguide_new/21` | 70.5 µs | 0.1% |  | -94.5% |
| `stiff_waveguide_new/36` | 752.3 µs | 0.0% |  | -65.7% |
| `stiff_waveguide_new/60` | 263.4 µs | 0.1% |  | -84.2% |
| `stiff_waveguide_new/69` | 6.38 ms | 0.1% |  | -75.3% |
| `stiff_waveguide_new/84` | 872.1 µs | 0.1% |  | -65.4% |
| `swarm_models/ants/200x120_500` | 236.6 µs | 11.1% |  | +10.5% |
| `swarm_models/physarum/512_100k` | 4.14 ms | 0.7% |  | +0.1% |
| `swarm_models/vicsek/4000` | 1.28 ms | 5.4% |  | +3.2% |
| `swarm_step/Brute/1000` | 504.3 µs | 0.1% | 2.0 Melem/s | +0.1% |
| `swarm_step/Brute/10000` | 47.95 ms | 0.0% | 208.5 Kelem/s | -1.4% |
| `swarm_step/Brute/300` | 53.6 µs | 0.1% | 5.6 Melem/s | +6.7% |
| `swarm_step/Brute/3000` | 4.38 ms | 0.0% | 685.7 Kelem/s | -1.0% |
| `swarm_step/Grid/1000` | 608.2 µs | 2.6% | 1.6 Melem/s | -1.4% |
| `swarm_step/Grid/10000` | 5.82 ms | 15.4% | 1.7 Melem/s | -8.8% |
| `swarm_step/Grid/100000` | 43.58 ms | 1.3% | 2.3 Melem/s | +1.1% |
| `swarm_step/Grid/300` | 193.6 µs | 0.2% | 1.5 Melem/s | +37.8% |
| `swarm_step/Grid/3000` | 1.73 ms | 6.7% | 1.7 Melem/s | -1.7% |
| `swarm_step/Sorted/1000` | 188.4 µs | 1.3% | 5.3 Melem/s | +31.8% |
| `swarm_step/Sorted/10000` | 1.93 ms | 3.2% | 5.2 Melem/s | +6.5% |
| `swarm_step/Sorted/100000` | 17.88 ms | 0.4% | 5.6 Melem/s | +26.7% |
| `swarm_step/Sorted/300` | 56.7 µs | 0.0% | 5.3 Melem/s | +35.8% |
| `swarm_step/Sorted/3000` | 558.1 µs | 2.0% | 5.4 Melem/s | +22.2% |
