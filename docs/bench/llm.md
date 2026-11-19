# Benchmarks, 2026-11-19, llm

- **Commit:** `24cb23b` (Health check: narrower APIs, ants.rs split, the workspace version, TASKS condensed (#334))
- **Machine:** Linux x86_64, 16 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** baseline (the target's default: no `target-cpu`)
- **Run:** `cargo xtask bench`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `llm`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 897.3 µs | 0.1% |  | -1.1% |
| `barnes_hut_f32/theta_0.5/128` | 23.3 µs | 0.1% |  | +0.3% |
| `barnes_hut_f32/theta_0.5/4096` | 5.15 ms | 0.1% |  | -0.5% |
| `barnes_hut_f32/theta_1/1024` | 612.5 µs | 0.2% |  | -1.2% |
| `barnes_hut_f32/theta_1/128` | 16.1 µs | 0.1% |  | +0.2% |
| `barnes_hut_f32/theta_1/4096` | 3.07 ms | 0.1% |  | -0.0% |
| `barnes_hut_f64/theta_0.5/1024` | 969.3 µs | 0.1% |  | -0.6% |
| `barnes_hut_f64/theta_0.5/128` | 21.8 µs | 0.1% |  | +0.4% |
| `barnes_hut_f64/theta_0.5/4096` | 5.54 ms | 0.1% |  | -0.3% |
| `barnes_hut_f64/theta_1/1024` | 680.8 µs | 0.1% |  | -0.4% |
| `barnes_hut_f64/theta_1/128` | 14.5 µs | 0.1% |  | +0.2% |
| `barnes_hut_f64/theta_1/4096` | 3.39 ms | 0.1% |  | +0.2% |
| `bodyvec_f32/1024` | 272 ns | 0.1% |  | +0.3% |
| `bodyvec_f32/128` | 42 ns | 0.2% |  | +0.0% |
| `bodyvec_f32/16` | 7 ns | 0.2% |  | -0.1% |
| `bodyvec_f64/1024` | 409 ns | 0.0% |  | -0.1% |
| `bodyvec_f64/128` | 56 ns | 0.0% |  | -0.2% |
| `bodyvec_f64/16` | 8 ns | 0.5% |  | -1.5% |
| `broadphase_f64/1024` | 57.2 µs | 0.0% |  | -0.9% |
| `broadphase_f64/128` | 6.0 µs | 0.0% |  | -0.1% |
| `broadphase_f64/4096` | 362.5 µs | 0.0% |  | +0.4% |
| `fft_f32/1024` | 5.1 µs | 0.2% |  | +0.3% |
| `fft_f32/16384` | 140.9 µs | 0.1% |  | +0.1% |
| `fft_f32/4096` | 24.3 µs | 0.1% |  | +0.2% |
| `pairwise_f32/1024` | 301.1 µs | 0.0% |  | -1.1% |
| `pairwise_f32/128` | 6.4 µs | 0.0% |  | -0.2% |
| `pairwise_f32/16` | 207 ns | 0.2% |  | +2.2% |
| `pairwise_f32/4096` | 4.68 ms | 0.0% |  | -0.1% |
| `pairwise_f64/1024` | 650.0 µs | 0.1% |  | -0.1% |
| `pairwise_f64/128` | 13.3 µs | 0.1% |  | +0.2% |
| `pairwise_f64/16` | 280 ns | 0.1% |  | +1.0% |
| `pairwise_f64/4096` | 10.11 ms | 0.1% |  | +0.4% |
| `piano_16_voices_x3_strings/128` | 62.4 µs | 0.1% |  | -1.3% |
| `piano_design_88_keys` | 26.52 ms | 0.1% |  | -0.4% |
| `sand_step/busy/1920x1080_chunks` | 9.70 ms | 0.3% | 213.8 Melem/s | -36.2% |
| `sand_step/busy/1920x1080_full` | 9.49 ms | 0.3% | 218.4 Melem/s | -36.9% |
| `sand_step/busy/640x360_chunks` | 1.04 ms | 0.3% | 222.5 Melem/s | -37.3% |
| `sand_step/busy/640x360_full` | 1.04 ms | 0.3% | 221.7 Melem/s | -36.8% |
| `sand_step/settled/1920x1080_chunks` | 17.9 µs | 0.2% | 115.6 Gelem/s | -9.1% |
| `sand_step/settled/1920x1080_full` | 5.13 ms | 0.1% | 404.2 Melem/s | -0.7% |
| `sand_step/settled/640x360_chunks` | 2.3 µs | 0.1% | 100.4 Gelem/s | -19.9% |
| `sand_step/settled/640x360_full` | 564.3 µs | 0.0% | 408.3 Melem/s | -1.5% |
| `spectrum_f32/4096` | 34.6 µs | 0.2% |  | -0.1% |
| `step_f32_symplectic/1024` | 303.5 µs | 0.0% |  | -0.6% |
| `step_f32_symplectic/128` | 6.6 µs | 0.0% |  | +0.5% |
| `step_f32_symplectic/16` | 225 ns | 0.1% |  | -0.5% |
| `step_f32_verlet/1024` | 606.0 µs | 0.1% |  | -0.8% |
| `step_f32_verlet/128` | 13.2 µs | 0.0% |  | -0.4% |
| `step_f32_verlet/16` | 436 ns | 0.1% |  | -0.3% |
| `step_f64_symplectic/1024` | 647.0 µs | 0.0% |  | -0.1% |
| `step_f64_symplectic/128` | 13.4 µs | 0.3% |  | +0.1% |
| `step_f64_symplectic/16` | 304 ns | 0.0% |  | +1.0% |
| `step_f64_verlet/1024` | 1.30 ms | 0.1% |  | -0.2% |
| `step_f64_verlet/128` | 26.8 µs | 0.1% |  | -0.0% |
| `step_f64_verlet/16` | 592 ns | 0.1% |  | -0.9% |
| `stiff_waveguide_new/21` | 46.7 µs | 0.1% |  | +1.1% |
| `stiff_waveguide_new/36` | 443.0 µs | 0.0% |  | -0.1% |
| `stiff_waveguide_new/60` | 147.7 µs | 0.1% |  | +0.6% |
| `stiff_waveguide_new/69` | 3.33 ms | 0.2% |  | +2.2% |
| `stiff_waveguide_new/84` | 501.2 µs | 0.1% |  | +5.0% |
| `swarm_models/ants/200x120_500` | 191.3 µs | 0.1% |  | +0.0% |
| `swarm_models/physarum/512_100k` | 4.29 ms | 0.1% |  | +0.3% |
| `swarm_models/vicsek/4000` | 1.10 ms | 0.1% |  | -6.5% |
| `swarm_step/Brute/1000` | 492.9 µs | 0.0% | 2.0 Melem/s | -0.5% |
| `swarm_step/Brute/10000` | 47.43 ms | 0.0% | 210.8 Kelem/s | -0.1% |
| `swarm_step/Brute/300` | 48.4 µs | 0.0% | 6.2 Melem/s | +0.3% |
| `swarm_step/Brute/3000` | 4.33 ms | 0.0% | 693.2 Kelem/s | +0.3% |
| `swarm_step/Grid/1000` | 205.9 µs | 0.1% | 4.9 Melem/s | -9.2% |
| `swarm_step/Grid/10000` | 2.61 ms | 0.1% | 3.8 Melem/s | -11.4% |
| `swarm_step/Grid/100000` | 28.79 ms | 0.0% | 3.5 Melem/s | -25.6% |
| `swarm_step/Grid/300` | 91.1 µs | 0.1% | 3.3 Melem/s | +36.9% |
| `swarm_step/Grid/3000` | 683.6 µs | 0.0% | 4.4 Melem/s | -13.0% |
| `swarm_step/Sorted/1000` | 94.3 µs | 0.1% | 10.6 Melem/s | -3.4% |
| `swarm_step/Sorted/10000` | 1.10 ms | 0.0% | 9.1 Melem/s | -23.9% |
| `swarm_step/Sorted/100000` | 12.15 ms | 0.0% | 8.2 Melem/s | -28.6% |
| `swarm_step/Sorted/300` | 37.2 µs | 0.1% | 8.1 Melem/s | +30.1% |
| `swarm_step/Sorted/3000` | 304.1 µs | 0.1% | 9.9 Melem/s | -6.9% |
