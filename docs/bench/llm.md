# Benchmarks, 2026-11-17, llm

- **Commit:** `8e2e7a2` (swarm: the grid's candidates through a branchless scalar add (Seen::add_masked; Grid −37% at 100k on the M4, −35% in V8); sorted's leftovers keep the branching add (the masked one was 20% slower at 1k in V8) (#320))
- **Machine:** Linux x86_64, 16 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** baseline (the target's default: no `target-cpu`)
- **Run:** `cargo xtask bench`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `llm`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 906.9 µs | 0.1% |  | +1.5% |
| `barnes_hut_f32/theta_0.5/128` | 23.2 µs | 0.2% |  | -0.3% |
| `barnes_hut_f32/theta_0.5/4096` | 5.17 ms | 0.1% |  | +0.4% |
| `barnes_hut_f32/theta_1/1024` | 620.0 µs | 0.1% |  | +1.8% |
| `barnes_hut_f32/theta_1/128` | 16.1 µs | 0.1% |  | +2.3% |
| `barnes_hut_f32/theta_1/4096` | 3.07 ms | 0.1% |  | -0.4% |
| `barnes_hut_f64/theta_0.5/1024` | 975.1 µs | 0.1% |  | +0.8% |
| `barnes_hut_f64/theta_0.5/128` | 21.7 µs | 0.1% |  | +0.3% |
| `barnes_hut_f64/theta_0.5/4096` | 5.55 ms | 0.1% |  | +0.2% |
| `barnes_hut_f64/theta_1/1024` | 683.6 µs | 0.1% |  | -0.6% |
| `barnes_hut_f64/theta_1/128` | 14.5 µs | 0.0% |  | -0.1% |
| `barnes_hut_f64/theta_1/4096` | 3.38 ms | 0.1% |  | -1.0% |
| `bodyvec_f32/1024` | 271 ns | 0.1% |  | +1.4% |
| `bodyvec_f32/128` | 42 ns | 0.2% |  | +1.3% |
| `bodyvec_f32/16` | 7 ns | 0.3% |  | +0.3% |
| `bodyvec_f64/1024` | 409 ns | 0.1% |  | +0.0% |
| `bodyvec_f64/128` | 56 ns | 0.2% |  | -1.5% |
| `bodyvec_f64/16` | 8 ns | 0.3% |  | +0.9% |
| `broadphase_f64/1024` | 57.7 µs | 0.4% |  | +0.2% |
| `broadphase_f64/128` | 6.0 µs | 0.1% |  | -0.2% |
| `broadphase_f64/4096` | 361.1 µs | 0.2% |  | +0.2% |
| `fft_f32/1024` | 5.1 µs | 0.2% |  | -0.5% |
| `fft_f32/16384` | 140.8 µs | 0.1% |  | -3.9% |
| `fft_f32/4096` | 24.2 µs | 0.2% |  | -0.1% |
| `pairwise_f32/1024` | 304.6 µs | 0.0% |  | +0.1% |
| `pairwise_f32/128` | 6.5 µs | 0.3% |  | -0.9% |
| `pairwise_f32/16` | 202 ns | 0.0% |  | -0.8% |
| `pairwise_f32/4096` | 4.68 ms | 0.0% |  | -0.0% |
| `pairwise_f64/1024` | 650.9 µs | 0.1% |  | +0.3% |
| `pairwise_f64/128` | 13.3 µs | 0.1% |  | -0.2% |
| `pairwise_f64/16` | 277 ns | 0.0% |  | -0.2% |
| `pairwise_f64/4096` | 10.07 ms | 0.1% |  | -0.7% |
| `piano_16_voices_x3_strings/128` | 63.2 µs | 0.2% |  | +0.3% |
| `piano_design_88_keys` | 26.63 ms | 0.1% |  | -0.2% |
| `sand_step/busy/1920x1080_chunks` | 15.20 ms | 0.1% | 136.5 Melem/s | +0.1% |
| `sand_step/busy/1920x1080_full` | 15.05 ms | 0.1% | 137.8 Melem/s | -0.4% |
| `sand_step/busy/640x360_chunks` | 1.65 ms | 0.1% | 139.4 Melem/s | -0.9% |
| `sand_step/busy/640x360_full` | 1.64 ms | 0.1% | 140.1 Melem/s | -0.9% |
| `sand_step/settled/1920x1080_chunks` | 19.7 µs | 0.2% | 105.1 Gelem/s | -0.6% |
| `sand_step/settled/1920x1080_full` | 5.17 ms | 0.1% | 401.4 Melem/s | +0.1% |
| `sand_step/settled/640x360_chunks` | 2.9 µs | 0.1% | 80.4 Gelem/s | +0.1% |
| `sand_step/settled/640x360_full` | 573.0 µs | 0.1% | 402.1 Melem/s | -0.1% |
| `spectrum_f32/4096` | 34.6 µs | 0.2% |  | +0.2% |
| `step_f32_symplectic/1024` | 305.4 µs | 0.0% |  | -0.3% |
| `step_f32_symplectic/128` | 6.6 µs | 0.0% |  | -0.3% |
| `step_f32_symplectic/16` | 226 ns | 0.1% |  | +1.1% |
| `step_f32_verlet/1024` | 610.8 µs | 0.1% |  | +0.0% |
| `step_f32_verlet/128` | 13.2 µs | 0.1% |  | -0.2% |
| `step_f32_verlet/16` | 438 ns | 0.1% |  | +0.3% |
| `step_f64_symplectic/1024` | 647.4 µs | 0.0% |  | -0.2% |
| `step_f64_symplectic/128` | 13.4 µs | 0.1% |  | -0.2% |
| `step_f64_symplectic/16` | 301 ns | 0.0% |  | -0.1% |
| `step_f64_verlet/1024` | 1.30 ms | 0.0% |  | -0.2% |
| `step_f64_verlet/128` | 26.8 µs | 0.1% |  | -0.2% |
| `step_f64_verlet/16` | 598 ns | 0.0% |  | +0.2% |
| `stiff_waveguide_new/21` | 46.2 µs | 0.1% |  | -0.3% |
| `stiff_waveguide_new/36` | 443.5 µs | 0.0% |  | -0.4% |
| `stiff_waveguide_new/60` | 146.8 µs | 0.1% |  | +0.8% |
| `stiff_waveguide_new/69` | 3.25 ms | 0.1% |  | -0.4% |
| `stiff_waveguide_new/84` | 477.4 µs | 0.4% |  | -1.0% |
| `swarm_models/ants/200x120_500` | 191.3 µs | 0.1% |  | -0.2% |
| `swarm_models/physarum/512_100k` | 4.28 ms | 0.0% |  | -0.3% |
| `swarm_models/vicsek/4000` | 1.18 ms | 0.0% |  | -0.6% |
| `swarm_step/Brute/1000` | 495.2 µs | 0.0% | 2.0 Melem/s | -0.1% |
| `swarm_step/Brute/10000` | 47.48 ms | 0.1% | 210.6 Kelem/s | -0.0% |
| `swarm_step/Brute/300` | 48.3 µs | 0.0% | 6.2 Melem/s | -0.0% |
| `swarm_step/Brute/3000` | 4.32 ms | 0.0% | 695.0 Kelem/s | -0.1% |
| `swarm_step/Grid/1000` | 226.9 µs | 0.1% | 4.4 Melem/s | -30.1% |
| `swarm_step/Grid/10000` | 2.95 ms | 0.1% | 3.4 Melem/s | -39.2% |
| `swarm_step/Grid/100000` | 38.68 ms | 0.1% | 2.6 Melem/s | -35.4% |
| `swarm_step/Grid/300` | 66.6 µs | 0.2% | 4.5 Melem/s | +9.0% |
| `swarm_step/Grid/3000` | 785.6 µs | 0.1% | 3.8 Melem/s | -37.9% |
| `swarm_step/Sorted/1000` | 97.6 µs | 0.1% | 10.3 Melem/s | -0.2% |
| `swarm_step/Sorted/10000` | 1.45 ms | 0.1% | 6.9 Melem/s | -0.0% |
| `swarm_step/Sorted/100000` | 17.00 ms | 0.1% | 5.9 Melem/s | -0.2% |
| `swarm_step/Sorted/300` | 28.6 µs | 0.1% | 10.5 Melem/s | -0.1% |
| `swarm_step/Sorted/3000` | 326.6 µs | 0.0% | 9.2 Melem/s | +0.0% |
