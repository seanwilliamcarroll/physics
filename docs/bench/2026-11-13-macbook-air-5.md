# Benchmarks, 2026-11-13, macbook-air-5

- **Commit:** `11af580` (docs: the fourth full mutation run, triaged crate by crate (#255)), with uncommitted changes
- **Machine:** Darwin arm64, 10 CPUs; rustc 1.99.1 (58cf8f9c3 2026-10-13)
- **Run:** `cargo xtask bench sand_step/settled/640x360_chunks`

Time: the mean per iteration; ±: half its 95% confidence interval; Change: from each benchmark's previous run. Recorded by `cargo xtask bench --record` (`docs/benchmarks.md`).

| Benchmark | Time | ± | Throughput | Change |
|---|---:|---:|---:|---:|
| `sand_step/settled/640x360_chunks` | 3.3 µs | 0.5% | 69.6 Gelem/s | +1.1% |
