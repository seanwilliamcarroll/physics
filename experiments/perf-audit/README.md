# Performance audit: profiles

Phase 1 of `docs/perf-audit.md`: where each bench group spends its time,
natively (samply, through `cargo xtask profile`) and in V8 (the same
bench built for wasm32-wasip1 with `simd128`, under `node --cpu-prof`).
A profile measures shares of a run, so the machine needn't be idle.

```sh
experiments/perf-audit/profile.py --out experiments/perf-audit/results/<machine>
experiments/perf-audit/profile.py --only swarm     # a subset
```

Needs samply (`cargo install --locked samply`; on Linux also
`kernel.perf_event_paranoid` <= 1) and the repo's Node (`.nvmrc`).
About 10 minutes. Committed: each run's `summary.md`; the per-case
reports (`native/`, `v8/`) stay on the machine.

V8's function names come from the wasm's name section, where inlining
differs from the native build's; a demangler (`rustfilt`) is used if
installed, else the path's segments are read out.
