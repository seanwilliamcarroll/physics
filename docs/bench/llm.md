# Benchmarks, 2026-11-19, llm

- **Commit:** `7137084` (swarm: Sorted's lane loop out of line in wasm (V8 Sorted/10k 2.26 → 1.69 ms on the M4): inlined into step_sorted as shipped, the function was too big for V8 (#340))
- **Machine:** Linux x86_64, 16 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** baseline (the target's default: no `target-cpu`)
- **Run:** `cargo xtask bench`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `llm`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 895.0 µs | 0.1% |  | -0.3% |
| `barnes_hut_f32/theta_0.5/128` | 23.3 µs | 0.1% |  | -0.1% |
| `barnes_hut_f32/theta_0.5/4096` | 5.16 ms | 0.1% |  | +0.3% |
| `barnes_hut_f32/theta_1/1024` | 606.4 µs | 0.1% |  | -1.0% |
| `barnes_hut_f32/theta_1/128` | 16.1 µs | 0.1% |  | -0.1% |
| `barnes_hut_f32/theta_1/4096` | 3.03 ms | 0.1% |  | -1.1% |
| `barnes_hut_f64/theta_0.5/1024` | 980.9 µs | 0.1% |  | +1.2% |
| `barnes_hut_f64/theta_0.5/128` | 21.9 µs | 0.2% |  | +0.4% |
| `barnes_hut_f64/theta_0.5/4096` | 5.59 ms | 0.1% |  | +0.9% |
| `barnes_hut_f64/theta_1/1024` | 680.2 µs | 0.1% |  | -0.1% |
| `barnes_hut_f64/theta_1/128` | 14.6 µs | 0.3% |  | +0.7% |
| `barnes_hut_f64/theta_1/4096` | 3.37 ms | 0.1% |  | -0.5% |
| `bodyvec_f32/1024` | 271 ns | 0.2% |  | -0.5% |
| `bodyvec_f32/128` | 42 ns | 0.2% |  | -0.1% |
| `bodyvec_f32/16` | 7 ns | 0.3% |  | +0.0% |
| `bodyvec_f64/1024` | 414 ns | 0.1% |  | +1.2% |
| `bodyvec_f64/128` | 56 ns | 0.0% |  | +0.0% |
| `bodyvec_f64/16` | 8 ns | 0.2% |  | +0.4% |
| `broadphase_f64/1024` | 57.3 µs | 0.1% |  | +0.2% |
| `broadphase_f64/128` | 6.0 µs | 0.0% |  | -0.4% |
| `broadphase_f64/4096` | 361.4 µs | 0.0% |  | -0.3% |
| `fft_f32/1024` | 5.1 µs | 0.1% |  | -0.5% |
| `fft_f32/16384` | 140.8 µs | 0.1% |  | -0.1% |
| `fft_f32/4096` | 24.2 µs | 0.1% |  | -0.2% |
| `pairwise_f32/1024` | 302.5 µs | 0.0% |  | +0.5% |
| `pairwise_f32/128` | 6.4 µs | 0.1% |  | +0.0% |
| `pairwise_f32/16` | 202 ns | 0.0% |  | -2.1% |
| `pairwise_f32/4096` | 4.69 ms | 0.0% |  | +0.2% |
| `pairwise_f64/1024` | 646.3 µs | 0.0% |  | -0.6% |
| `pairwise_f64/128` | 13.3 µs | 0.1% |  | -0.0% |
| `pairwise_f64/16` | 277 ns | 0.0% |  | -1.0% |
| `pairwise_f64/4096` | 10.12 ms | 0.1% |  | +0.0% |
| `piano_16_voices_x3_strings/128` | 62.8 µs | 0.1% |  | +0.7% |
| `piano_design_88_keys` | 26.47 ms | 0.1% |  | -0.2% |
| `sand_step/busy/1920x1080_chunks` | 9.62 ms | 0.0% | 215.5 Melem/s | -0.8% |
| `sand_step/busy/1920x1080_full` | 9.49 ms | 0.0% | 218.5 Melem/s | -0.0% |
| `sand_step/busy/640x360_chunks` | 1.04 ms | 0.1% | 221.8 Melem/s | +0.3% |
| `sand_step/busy/640x360_full` | 1.03 ms | 0.0% | 224.2 Melem/s | -1.1% |
| `sand_step/settled/1920x1080_chunks` | 17.9 µs | 0.2% | 115.7 Gelem/s | -0.1% |
| `sand_step/settled/1920x1080_full` | 5.11 ms | 0.0% | 405.6 Melem/s | -0.3% |
| `sand_step/settled/640x360_chunks` | 2.3 µs | 0.1% | 100.5 Gelem/s | -0.2% |
| `sand_step/settled/640x360_full` | 566.5 µs | 0.1% | 406.7 Melem/s | +0.4% |
| `spectrum_f32/4096` | 34.5 µs | 0.1% |  | -0.2% |
| `step_f32_symplectic/1024` | 303.5 µs | 0.0% |  | +0.0% |
| `step_f32_symplectic/128` | 6.6 µs | 0.0% |  | -0.7% |
| `step_f32_symplectic/16` | 223 ns | 0.1% |  | -0.7% |
| `step_f32_verlet/1024` | 606.4 µs | 0.0% |  | +0.1% |
| `step_f32_verlet/128` | 13.2 µs | 0.0% |  | -0.1% |
| `step_f32_verlet/16` | 437 ns | 0.0% |  | +0.1% |
| `step_f64_symplectic/1024` | 648.7 µs | 0.3% |  | +0.3% |
| `step_f64_symplectic/128` | 13.5 µs | 0.1% |  | +0.0% |
| `step_f64_symplectic/16` | 304 ns | 0.1% |  | -0.2% |
| `step_f64_verlet/1024` | 1.30 ms | 0.1% |  | -0.0% |
| `step_f64_verlet/128` | 26.9 µs | 0.1% |  | +0.2% |
| `step_f64_verlet/16` | 598 ns | 0.1% |  | +1.0% |
| `stiff_waveguide_new/21` | 46.8 µs | 0.1% |  | +0.2% |
| `stiff_waveguide_new/36` | 440.3 µs | 0.1% |  | -0.6% |
| `stiff_waveguide_new/60` | 147.3 µs | 0.1% |  | -0.3% |
| `stiff_waveguide_new/69` | 3.31 ms | 0.1% |  | -0.5% |
| `stiff_waveguide_new/84` | 500.8 µs | 0.1% |  | -0.1% |
| `swarm_models/ants/200x120_500` | 191.6 µs | 0.1% |  | +0.1% |
| `swarm_models/physarum/512_100k` | 4.31 ms | 0.1% |  | +0.4% |
| `swarm_models/vicsek/4000` | 1.11 ms | 0.0% |  | +0.7% |
| `swarm_step/Brute/1000` | 493.1 µs | 0.0% | 2.0 Melem/s | +0.0% |
| `swarm_step/Brute/10000` | 47.46 ms | 0.0% | 210.7 Kelem/s | +0.1% |
| `swarm_step/Brute/300` | 48.5 µs | 0.1% | 6.2 Melem/s | +0.1% |
| `swarm_step/Brute/3000` | 4.33 ms | 0.0% | 693.6 Kelem/s | -0.1% |
| `swarm_step/Grid/1000` | 205.5 µs | 0.0% | 4.9 Melem/s | -0.2% |
| `swarm_step/Grid/10000` | 2.61 ms | 0.0% | 3.8 Melem/s | -0.1% |
| `swarm_step/Grid/100000` | 28.81 ms | 0.1% | 3.5 Melem/s | +0.1% |
| `swarm_step/Grid/300` | 91.1 µs | 0.1% | 3.3 Melem/s | -0.0% |
| `swarm_step/Grid/3000` | 684.8 µs | 0.1% | 4.4 Melem/s | +0.2% |
| `swarm_step/Sorted/1000` | 94.4 µs | 0.1% | 10.6 Melem/s | +0.2% |
| `swarm_step/Sorted/10000` | 1.10 ms | 0.0% | 9.1 Melem/s | +0.0% |
| `swarm_step/Sorted/100000` | 12.18 ms | 0.1% | 8.2 Melem/s | +0.3% |
| `swarm_step/Sorted/300` | 37.2 µs | 0.1% | 8.1 Melem/s | -0.1% |
| `swarm_step/Sorted/3000` | 304.6 µs | 0.1% | 9.8 Melem/s | +0.2% |
