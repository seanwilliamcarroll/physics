# Benchmarks, 2026-11-19, llm-v8

- **Commit:** `7137084` (swarm: Sorted's lane loop out of line in wasm (V8 Sorted/10k 2.26 → 1.69 ms on the M4): inlined into step_sorted as shipped, the function was too big for V8 (#340))
- **Machine:** Linux x86_64, 16 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Level:** v8 (wasm32-wasip1 with `simd128`, in Node)
- **Run:** `cargo xtask bench --level v8`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from the record for `llm-v8`. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `barnes_hut_f32/theta_0.5/1024` | 1.01 ms | 0.1% |  | -0.2% |
| `barnes_hut_f32/theta_0.5/128` | 25.9 µs | 0.1% |  | -0.1% |
| `barnes_hut_f32/theta_0.5/4096` | 5.68 ms | 0.0% |  | -0.1% |
| `barnes_hut_f32/theta_1/1024` | 671.7 µs | 0.1% |  | -0.0% |
| `barnes_hut_f32/theta_1/128` | 17.3 µs | 0.0% |  | -0.1% |
| `barnes_hut_f32/theta_1/4096` | 3.42 ms | 0.1% |  | +0.3% |
| `barnes_hut_f64/theta_0.5/1024` | 1.13 ms | 0.1% |  | -0.8% |
| `barnes_hut_f64/theta_0.5/128` | 26.1 µs | 0.0% |  | -0.0% |
| `barnes_hut_f64/theta_0.5/4096` | 6.29 ms | 0.0% |  | -0.4% |
| `barnes_hut_f64/theta_1/1024` | 766.4 µs | 0.1% |  | -0.5% |
| `barnes_hut_f64/theta_1/128` | 17.5 µs | 0.1% |  | +0.0% |
| `barnes_hut_f64/theta_1/4096` | 3.84 ms | 0.1% |  | -0.6% |
| `bodyvec_f32/1024` | 361 ns | 0.0% |  | +0.1% |
| `bodyvec_f32/128` | 62 ns | 0.1% |  | -0.2% |
| `bodyvec_f32/16` | 22 ns | 0.1% |  | -1.3% |
| `bodyvec_f64/1024` | 762 ns | 0.0% |  | -0.1% |
| `bodyvec_f64/128` | 110 ns | 0.0% |  | +1.4% |
| `bodyvec_f64/16` | 27 ns | 0.1% |  | +0.0% |
| `broadphase_f64/1024` | 70.1 µs | 0.1% |  | -0.6% |
| `broadphase_f64/128` | 7.1 µs | 0.1% |  | -0.9% |
| `broadphase_f64/4096` | 442.1 µs | 0.1% |  | -0.1% |
| `fft_f32/1024` | 6.1 µs | 0.1% |  | +0.2% |
| `fft_f32/16384` | 159.9 µs | 0.1% |  | +0.1% |
| `fft_f32/4096` | 28.8 µs | 0.1% |  | +0.9% |
| `pairwise_f32/1024` | 308.4 µs | 0.0% |  | +0.3% |
| `pairwise_f32/128` | 7.1 µs | 0.1% |  | -0.3% |
| `pairwise_f32/16` | 221 ns | 0.1% |  | -0.2% |
| `pairwise_f32/4096` | 4.68 ms | 0.0% |  | -0.3% |
| `pairwise_f64/1024` | 623.6 µs | 0.1% |  | +0.0% |
| `pairwise_f64/128` | 10.8 µs | 0.2% |  | -0.1% |
| `pairwise_f64/16` | 296 ns | 0.0% |  | -0.1% |
| `pairwise_f64/4096` | 9.85 ms | 0.0% |  | -0.0% |
| `piano_16_voices_x3_strings/128` | 75.2 µs | 0.0% |  | +1.5% |
| `piano_design_88_keys` | 38.38 ms | 0.0% |  | -0.0% |
| `sand_step/busy/1920x1080_chunks` | 11.31 ms | 0.0% | 183.4 Melem/s | -0.5% |
| `sand_step/busy/1920x1080_full` | 11.22 ms | 0.0% | 184.8 Melem/s | +0.2% |
| `sand_step/busy/640x360_chunks` | 1.24 ms | 0.1% | 185.8 Melem/s | -0.0% |
| `sand_step/busy/640x360_full` | 1.22 ms | 0.1% | 188.8 Melem/s | -0.0% |
| `sand_step/settled/1920x1080_chunks` | 20.5 µs | 0.0% | 101.1 Gelem/s | -0.3% |
| `sand_step/settled/1920x1080_full` | 6.10 ms | 0.0% | 340.1 Melem/s | -0.4% |
| `sand_step/settled/640x360_chunks` | 2.5 µs | 0.0% | 92.7 Gelem/s | -0.0% |
| `sand_step/settled/640x360_full` | 665.2 µs | 0.0% | 346.4 Melem/s | -0.2% |
| `spectrum_f32/4096` | 39.4 µs | 0.1% |  | -0.0% |
| `step_f32_symplectic/1024` | 308.2 µs | 0.0% |  | -0.1% |
| `step_f32_symplectic/128` | 7.2 µs | 0.0% |  | +0.5% |
| `step_f32_symplectic/16` | 238 ns | 0.1% |  | -0.7% |
| `step_f32_verlet/1024` | 617.1 µs | 0.3% |  | +0.0% |
| `step_f32_verlet/128` | 14.3 µs | 0.0% |  | -0.7% |
| `step_f32_verlet/16` | 470 ns | 0.0% |  | -0.3% |
| `step_f64_symplectic/1024` | 624.8 µs | 0.0% |  | -0.3% |
| `step_f64_symplectic/128` | 10.9 µs | 0.0% |  | +0.1% |
| `step_f64_symplectic/16` | 314 ns | 0.1% |  | +0.3% |
| `step_f64_verlet/1024` | 1.26 ms | 0.1% |  | +0.2% |
| `step_f64_verlet/128` | 21.8 µs | 0.0% |  | -0.0% |
| `step_f64_verlet/16` | 616 ns | 0.0% |  | -0.5% |
| `stiff_waveguide_new/21` | 71.0 µs | 0.0% |  | +0.5% |
| `stiff_waveguide_new/36` | 677.7 µs | 0.0% |  | -0.4% |
| `stiff_waveguide_new/60` | 219.0 µs | 0.0% |  | +0.1% |
| `stiff_waveguide_new/69` | 4.50 ms | 0.0% |  | -0.1% |
| `stiff_waveguide_new/84` | 722.8 µs | 0.1% |  | -0.2% |
| `swarm_models/ants/200x120_500` | 178.3 µs | 0.1% |  | -0.3% |
| `swarm_models/physarum/512_100k` | 3.58 ms | 0.0% |  | +0.0% |
| `swarm_models/vicsek/4000` | 2.28 ms | 0.1% |  | +0.6% |
| `swarm_step/Brute/1000` | 528.0 µs | 0.1% | 1.9 Melem/s | +0.1% |
| `swarm_step/Brute/10000` | 50.56 ms | 0.1% | 197.8 Kelem/s | -0.1% |
| `swarm_step/Brute/300` | 53.2 µs | 0.1% | 5.6 Melem/s | +0.7% |
| `swarm_step/Brute/3000` | 4.61 ms | 0.1% | 650.9 Kelem/s | -0.4% |
| `swarm_step/Grid/1000` | 376.3 µs | 0.0% | 2.7 Melem/s | -0.3% |
| `swarm_step/Grid/10000` | 4.53 ms | 0.0% | 2.2 Melem/s | +0.1% |
| `swarm_step/Grid/100000` | 49.56 ms | 0.0% | 2.0 Melem/s | +0.2% |
| `swarm_step/Grid/300` | 159.5 µs | 0.1% | 1.9 Melem/s | -0.1% |
| `swarm_step/Grid/3000` | 1.20 ms | 0.0% | 2.5 Melem/s | +0.2% |
| `swarm_step/Sorted/1000` | 130.1 µs | 0.1% | 7.7 Melem/s | -30.0% |
| `swarm_step/Sorted/10000` | 1.53 ms | 0.0% | 6.5 Melem/s | -31.8% |
| `swarm_step/Sorted/100000` | 16.61 ms | 0.0% | 6.0 Melem/s | -32.9% |
| `swarm_step/Sorted/300` | 51.7 µs | 0.1% | 5.8 Melem/s | -33.9% |
| `swarm_step/Sorted/3000` | 420.1 µs | 0.0% | 7.1 Melem/s | -30.1% |
