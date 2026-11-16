# Sweep

The runner the vectorizing experiments share: it benchmarks a suite's
build settings (knobs read at compile time) at several CPU levels and in
two WebAssembly engines, and keeps the assembly. Stdlib Python 3.

| Suite | Experiment folder | What it varies |
|---|---|---|
| `gravity` (default) | `experiments/gravity-vectorize/` | pairwise gravity: `GRAVITY_LOOP`, `GRAVITY_LANES`, `GRAVITY_PLAIN_BELOW` (`crates/engine/src/force/pairwise/knobs.rs`) |
| `swarm` | `experiments/swarm-lanes/` | the boids' lane loop: `SWARM_LANES`, `SWARM_SUM` (`crates/swarm/src/rules/knobs.rs`) |

Each experiment folder's README lists its experiments; results go to
`<experiment folder>/results/<host>` unless `--out` says otherwise.

| File | What |
|---|---|
| `run.py` | runs a suite on the current checkout |
| `wasi-node.mjs` | runs the wasm bench in Node, for the `v8` levels |

## Levels

| Level | `RUSTFLAGS` | Widest vector (x86-64) |
|---|---|---|
| `default` | none | SSE2: 2 f64 / 4 f32 |
| `x86-64-v3` | `-C target-cpu=x86-64-v3` | AVX2: 4 f64 / 8 f32 |
| `native` | `-C target-cpu=native` | this CPU; AVX-512 if it has it: 8 f64 / 16 f32 |
| `wasm` | none, `--target wasm32-wasip1` | none: wasm without simd128 is scalar |
| `wasm-simd128` | `-C target-feature=+simd128`, wasm | 128-bit: 2 f64 / 4 f32 |
| `v8`, `v8-simd128` | the same two wasm builds, run in Node | as above |

`RUSTFLAGS` replaces `.cargo/config.toml`'s flags, so `wasm` really is
without SIMD. On aarch64 the native levels are `default` and `native`.
The wasm levels need `wasmtime` (Cranelift compiles the wasm), the `v8`
levels the repo's Node (`.nvmrc`; V8's TurboFan compiles it; Node warns
that WASI is experimental, which is expected). Their asm is wasm text.

## Running

On the compute node, in tmux (a tmux command runs in a non-interactive
shell, so nvm is loaded by hand; `nvm install` reads `.nvmrc`):

```sh
tmux new -s sweep 'cd ~/physics && git pull && . ~/.nvm/nvm.sh && nvm install && experiments/sweep/run.py --suite SUITE --perf --experiments sweep 2>&1 | tee ~/sweep.log; exec bash'
```

On a Mac, with `caffeinate` keeping it awake (`-i`: no idle sleep; `-s`:
no system sleep on mains power; closing the lid still sleeps it). Leave
the machine alone meanwhile:

```sh
cd ~/physics && git pull && . ~/.nvm/nvm.sh && nvm install && caffeinate -is experiments/sweep/run.py --suite SUITE --experiments sweep 2>&1 | tee ~/sweep.log
```

`--quick`, `--levels`, `--experiments` and `--filter` narrow a run
(`run.py --suite SUITE --help` shows the suite's defaults). Each run
replaces its `--out` folder.

`--perf` (Linux) adds hardware counters for the suite's perf benches:
`perf stat` (cycles, instructions, branch misses) and `perf record` +
`perf annotate` (where the cycles go). Ubuntu stops users using perf by
default; `sudo sysctl kernel.perf_event_paranoid=1` allows it until the
next reboot. perf skips the wasm levels.

`--from-log LOG --out DIR` rebuilds a summary from a run's log.

## Results

Each run writes to its `--out` folder:

- `summary.md`: per level, mean times with the change against the
  suite's reference experiment; the reference at each level against
  `default`; sqrt/div instructions in each dumped function by width; with
  `--perf`, IPC (and for gravity, cycles and instructions per pair).
- `results.csv`: level, experiment, bench, mean in ns.
- `machine.txt`: CPU, SIMD flags, wasmtime, Node, rustc.
- `asm/`, `perf/`, `<level>/<experiment>/criterion/`: listings, perf
  output, criterion's data.

**Committed:** `summary.md`, `results.csv` and `machine.txt` only. The
asm, perf output, logs and criterion's data are git-ignored and stay on
the machine that ran it.

To bring results back from the compute node:

```sh
rsync -a llm:physics/experiments/EXPERIMENT/results/llm experiments/EXPERIMENT/results/
```
