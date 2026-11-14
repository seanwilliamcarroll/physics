# Gravity-loop experiments

`PairwiseGravity::accumulate` rewritten a few ways to vectorize it. The
results so far (Apple M4) are in `docs/experiments.md`. This directory reruns
them on another machine, at several CPU levels, and keeps the assembly.

## What's here

| File | What |
|---|---|
| `run.py` | runs everything (stdlib Python 3) |
| `wasi-node.mjs` | runs the wasm bench in Node, for the `v8` levels |
| `patches/b-select.patch` | B: the `d_sq == 0` branch as a select |
| `patches/c-lanes.patch` | C: two passes; body i's sum in 4 lanes, `pass_one` not inlined |
| `patches/d-soa.patch` | D2: separate arrays throughout, blocks of 4 as whole-array steps (`sweep`) |

`base` is the commit the patches apply to, `ea2169b` (main after #273).
Experiment A's code was lost; its M4 result is in `docs/experiments.md`.
C and D change the order of the sums, so the golden-hash test fails on
them; nothing here runs the tests.

## Running

For each experiment, `run.py` makes a detached worktree of `ea2169b` in
`.work/` (ignored), applies the patch, runs criterion on the `pairwise_*`
benches, and dumps the hot functions' assembly. It does that once per CPU
level:

| Level | `RUSTFLAGS` | Widest vector (x86-64) |
|---|---|---|
| `default` | none | SSE2: 2 f64 / 4 f32 |
| `x86-64-v3` | `-C target-cpu=x86-64-v3` | AVX2: 4 f64 / 8 f32 |
| `native` | `-C target-cpu=native` | this CPU; AVX-512 if it has it: 8 f64 / 16 f32 |
| `wasm` | none, `--target wasm32-wasip1` | none: wasm without simd128 is scalar |
| `wasm-simd128` | `-C target-feature=+simd128`, wasm | 128-bit: 2 f64 / 4 f32 |
| `v8`, `v8-simd128` | the same two wasm builds, run in Node | as above |

A plain `cargo build` targets `default`, which is why it's the level that
matters for shipped code; the others show what wider vectors would buy.
On aarch64 the levels are `default` and `native`. The wasm levels are
added when `wasmtime` is installed: criterion runs inside wasmtime, which
compiles the wasm to this machine's code as it loads it, with its own
code generator (Cranelift) rather than LLVM's. That's close to what a
browser does (V8 has its own too), and it's what the demos run. Their
asm is wasm text (`f64x2.sqrt`, …), not the machine code wasmtime makes
from it. The `v8` levels, added when `node` is installed, run the same
`.wasm` files in Node (`node:wasi`), whose V8 is Chrome's engine: the
same wasm, compiled by a third code generator (TurboFan). Node warns
that WASI is experimental; that's expected.

On the compute node, in tmux. The `v8` levels need the repo's Node
(`.nvmrc`; `run.py` stops if `node` is another version), and a tmux
command runs in a non-interactive shell where nvm isn't loaded, hence
`. ~/.nvm/nvm.sh && nvm install` (reads `.nvmrc`, installs it if
missing, and uses it):

```sh
tmux new -s gv 'cd ~/physics && git fetch && git checkout experiments-gravity-package && git pull && . ~/.nvm/nvm.sh && nvm install && experiments/gravity-vectorize/run.py --perf 2>&1 | tee ~/gv.log; exec bash'
```

On a Mac, with `caffeinate` keeping it awake for as long as the run
lasts (`-i`: no idle sleep; `-s`: no system sleep on mains power; closing
the lid still sleeps it). Leave the machine alone meanwhile: anything
else running shows up in the times.

```sh
cd ~/physics && git fetch && git checkout experiments-gravity-package && git pull && . ~/.nvm/nvm.sh && nvm install && caffeinate -is experiments/gravity-vectorize/run.py --out experiments/gravity-vectorize/results/m4 2>&1 | tee ~/gv-m4.log
```

Each takes about an hour: 4 experiments × up to 7 levels, each build's
first compile from scratch. `--quick`, `--levels`, `--experiments` and `--filter`
narrow it (`run.py --help`).

`--perf` (Linux) adds hardware counters for `pairwise_f64/1024` and
`pairwise_f32/1024` (`--perf-benches`): `perf stat` for cycles,
instructions and branch misses, and `perf record` + `perf annotate` for
where the cycles go, instruction by instruction. Each bench runs under
criterion's `--profile-time` (no analysis, just the loop). Ubuntu stops
users using perf by default; `sudo sysctl kernel.perf_event_paranoid=1`
allows it until the next reboot. perf skips the wasm levels: it can't
name the code wasmtime generates.

Each run replaces its `--out` folder, so to add levels to an earlier
run, give the new one its own: e.g. `--levels v8,v8-simd128 --out
experiments/gravity-vectorize/results/llm-v8`.

## Results

In `results/<host>/`:

- `summary.md`: per level, a table of mean times with the change against
  `base`; `base` at each level against `default`; and the sqrt/div
  instructions in each dumped function, by width (scalar, xmm, ymm, zmm).
  Written after every experiment, so a stopped run still has a summary.
- `results.csv`: level, experiment, bench, mean in ns.
- `asm/<level>--<experiment>--<function>-<f64|f32>.s`: Intel syntax.
- With `--perf`: a perf table in `summary.md` (GHz, IPC, cycles and
  instructions per pair, branch misses), and in `perf/` each bench's
  `perf stat` output (`.stat.csv`) and annotated hot functions
  (`.annotate.txt`).
- `machine.txt`: CPU, SIMD flags, rustc.
- `<level>/<experiment>/criterion/`: criterion's raw data.

To bring them back to the Mac:

```sh
mkdir -p experiments/gravity-vectorize/results
scp -r llm:physics/experiments/gravity-vectorize/results/llm experiments/gravity-vectorize/results/
```
