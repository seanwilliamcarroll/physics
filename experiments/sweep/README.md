# Sweep

The machinery the vectorizing experiments share: it benchmarks build
settings (knobs, environment variables a crate reads at compile time) at
several CPU levels and in two WebAssembly engines, and keeps the
assembly. Stdlib Python 3. It knows no experiment: each experiment's
folder has a short driver, `run.py`, that describes it and runs it.

| Experiment | What it varies |
|---|---|
| `experiments/gravity-vectorize/` | pairwise gravity: `GRAVITY_LOOP`, `GRAVITY_LANES`, `GRAVITY_PLAIN_BELOW` (`crates/engine/src/force/pairwise/knobs.rs`) |
| `experiments/swarm-lanes/` | the boids' lane loop: `SWARM_LANES`, `SWARM_SUM` (`crates/swarm/src/rules/knobs.rs`) |
| `experiments/swarm-mask/` | the grid's candidate masks: `SWARM_MASK`; also captures V8's machine code |

| File | What |
|---|---|
| `sweep.py` | the library: `Suite`, `Experiment`, `main(suite)` |
| `wasi-node.mjs` | runs the wasm bench in Node, for the `v8` levels |

## A new experiment

A folder with a `run.py` that puts `experiments/sweep` on `sys.path`,
builds a `Suite` and calls `main` (copy `swarm-lanes/run.py`):

```python
SUITE = Suite(
    title="…",                  # summary.md's heading
    package="swarm",            # a package with a `step` criterion bench
    knobs=("SWARM_LANES", …),   # every knob it reads (unset unless an experiment sets it)
    experiments={"lanes-8": Experiment({"SWARM_LANES": "8"}), …},
    reference="lanes-8",        # what the tables compare against
    results=HERE / "results",   # --out defaults to results/<host>
    functions=(("add_span", "<swarm::rules::Seen>::add_span"),),  # asm to dump
    filter="^swarm_step/…",     # criterion's default filter
    perf_benches="…",           # for --perf
)
```

Optional: `v8_functions` and `v8_filter` (V8's optimized machine code
for those wasm functions at the v8 levels, from a short run of the
filter's benches with `node --print-wasm-code`: `<level>--<name>--<short>.v8.s`),
a third element in a `functions` entry (which copy, when cargo asm finds
several), `presets` (named lists for `--experiments`), `scalars` (what
`{s}` in a symbol becomes, e.g. `("f64", "f32")`), `pairs` (bench sizes
are body counts: per-pair perf columns). Give it a `.gitignore` like
the others' (only summaries are committed) and a README with the
question and the experiments.

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
tmux new -s sweep 'cd ~/physics && git pull && . ~/.nvm/nvm.sh && nvm install && experiments/EXPERIMENT/run.py --perf --experiments sweep --out ~/sweep-results/EXPERIMENT/llm 2>&1 | tee ~/sweep.log; exec bash'
```

On a Mac, with `caffeinate` keeping it awake (`-i`: no idle sleep; `-s`:
no system sleep on mains power; closing the lid still sleeps it). Leave
the machine alone meanwhile:

```sh
cd ~/physics && git pull && . ~/.nvm/nvm.sh && nvm install && caffeinate -is experiments/EXPERIMENT/run.py --experiments sweep --out ~/sweep-results/EXPERIMENT/m4 2>&1 | tee ~/sweep.log
```

To line several runs up for a night or a day, see `experiments/queue/`.

Results go **outside the repository** (`~/sweep-results/`), then are
copied into `experiments/EXPERIMENT/results/<machine>/` and committed
(`rsync -a llm:sweep-results/EXPERIMENT/llm/ experiments/EXPERIMENT/results/llm/`).
Written into the checkout, they'd be untracked files there, and the
next `git pull` that brings the committed copies refuses to overwrite
them.

`--quick`, `--levels`, `--experiments` and `--filter` narrow a run
(`run.py --help` shows the experiment's defaults). Each run
replaces its `--out` folder.

`--perf` (Linux) adds hardware counters for the experiment's perf benches:
`perf stat` (cycles, instructions, branch misses) and `perf record` +
`perf annotate` (where the cycles go). Ubuntu stops users using perf by
default; `sudo sysctl kernel.perf_event_paranoid=1` allows it until the
next reboot. perf skips the wasm levels.

`--from-log LOG --out DIR` rebuilds a summary from a run's log.

## Results

Each run writes to its `--out` folder:

- `summary.md`: per level, mean times with the change against the
  reference experiment; the reference at each level against
  `default`; sqrt/div instructions in each dumped function by width; with
  `--perf`, IPC (and for gravity, cycles and instructions per pair).
- `results.csv`: level, experiment, bench, mean in ns.
- `machine.txt`: CPU, SIMD flags, wasmtime, Node, rustc.
- `asm/`, `perf/`, `<level>/<experiment>/criterion/`: listings, perf
  output, criterion's data.

**Committed:** each run's `summary.md` only, with the experiment's
scripts and its README (the findings): enough to see what was measured
and to rerun it at its commit. Everything else (`results.csv`,
`machine.txt`, the asm, perf output, logs, criterion's data) is
git-ignored (`experiments/.gitignore`) and stays on the machine that ran
it. Pass `--out` outside the repo (`~/sweep-results/...`) anyway: a run
writing into a checkout blocks the next `git pull` there.

To bring results back from the compute node:

```sh
rsync -a llm:physics/experiments/EXPERIMENT/results/llm experiments/EXPERIMENT/results/
```
