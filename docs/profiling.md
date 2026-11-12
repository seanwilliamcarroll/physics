# Profiling

A benchmark says how long something takes (`benchmarks.md`); a profile
says where inside it the time goes. This is how to take one here, how to
read it, and what the first round found.

## Taking a profile

```sh
cargo xtask profile -p swarm --example workload -- ants
cargo xtask profile -p engine --bench step -- 'broadphase_f64/4096$'
```

The first profiles an example (arguments after `--` are the example's);
the second a criterion bench (the argument is criterion's filter, a
regex: one case, or it profiles them all in turn, `--seconds` each).
`--top N` sets how much is listed. Needs
[samply](https://github.com/mstange/samply) (`setup.md`).

What it does, so it can be done by hand:

1. **Builds with `--profile profiling`** (`Cargo.toml`): the release
   profile plus debug info. Optimized, because the unoptimized build has
   different hot spots; debug info, because without it there are no
   function names or line numbers to report.
2. **Records with samply**, a sampling profiler: a thousand times a
   second it stops the program and writes down the call stack. A function
   that's on the stack in 30% of the samples took about 30% of the time.
   No instrumentation, so the program runs at full speed; the price is
   noise, a few percent on anything small.

   ```sh
   samply record --save-only --unstable-presymbolicate \
       -o target/profile/NAME.json.gz BINARY ARGS…
   ```

   `--save-only` skips opening the viewer; `--unstable-presymbolicate`
   writes the symbol names in a file beside the profile, so a script can
   read it.
3. **Prints the top of it** (`xtask/profile_top.mjs`), three ways:
   - **self**: the function itself was running (the top of the stack).
     This is where to look for something to fix.
   - **total**: it, or anything it called, was running. This says which
     part of the program the time belongs to.
   - **self, by source line**: see below.

The profile stays in `target/profile/`; `samply load FILE` opens it in
the Firefox Profiler's UI (flame graph, call tree, per-thread timeline),
served from a local port.

### Why the lines matter

In an optimized build, a hot loop's helpers are inlined into it, so
"self" often reads `96% Vicsek::step` and nothing more. The debug info
still records which source line each instruction came from, through
every level of inlining. `profile_top.mjs --lines BINARY` resolves each
sampled address (`atos -i` on macOS, `addr2line -i` elsewhere: that
path is written but hasn't been run) and charges it to the innermost
frame that's in this repo. So time spent inside an inlined
`core::iter::Flatten::next` shows as the line of ours that drove that
iterator, which is the line to change.

Line numbers are approximate: the optimizer moves and merges
instructions, and a slow instruction's cost is often charged to the next
one (a load that misses the cache shows on the line that uses the
value). `file.rs:0` is code the compiler couldn't attribute.

### Workloads

`crates/swarm/examples/workload.rs` runs one model alone for a few
seconds, at its page's size: `boids`, `vicsek`, `ants`, `slime`. The
criterion benches serve for the rest (`benchmarks.md` lists them); the
same sizes are criterion cases too (`swarm_models/*`), so a fix can be
measured with `cargo xtask bench --baseline`.

### In the browser

For a page: Chrome DevTools, Performance tab, record a few seconds. The
wasm functions appear by name (the release builds keep the name
section). That shows what native can't: the split between the step, the
render (filling the pixel buffer) and the canvas upload, and whether a
frame fits in 16.7 ms. The functions are the same code as native, so
find the hot spot natively, where the tools are better, and check the
page's frame time after.

### What a sampling profiler can't say

Why a line is slow. A random read into a large array is slow because of
cache misses, not instructions; samply shows the line and nothing else.
Hardware counters do: on Linux, `perf stat -e cache-misses,instructions
BINARY ARGS` (macOS has no unprivileged equivalent). The compute node is
the place for that.

## The first round (2026-11-12)

Native, Apple silicon, 4 s each at 1 kHz. Self time by source line.

| Workload | A step | Where it goes | Verdict |
|---|---|---|---|
| ants, 200 × 120, 500 ants | 527 µs | 96% `Field::diffuse`: a third recounting each cell's open neighbours through an iterator chain, the rest the scatter | fixable: the counts change only with the walls |
| Physarum, 512², 100k | 3.5 ms | 28% the sensors' field reads (random access); ~40% `fmod`, from `rem_euclid` in `Slime::cell` (four calls an agent) and the position wrap; 12% `diffuse_periodic` | the `fmod` is fixable; the reads are the model |
| Vicsek, N = 4000, grid | 0.94 ms | 76% the candidates iterator (nine cells chained into one iterator the compiler doesn't flatten); 14% the distance test | fixable: per-cell slices, as boids' `add_span` |
| broadphase, 4096 bodies | | 56% `cell_run`'s two binary searches over all keys, per neighbour cell; 22% sorting the keys; `sort_pairs` 2% | fixable: the second search |
| boids, 10k, sorted | 1.36 ms | 87% `Seen::add_span`, the lane loop | the work itself |
| pairwise gravity, N = 1024 | | 100% the pair loop | the work itself (Barnes–Hut is the answer) |
| Barnes–Hut, N = 4096 | | the walk in `accel_on`; build and sort 3% | nothing stands out |
| sand, busy, 640 × 360 | | `wake` 36%, `update_cell` 24%, `index` 9% | spread out; `wake` maybe |
| piano, 16 voices × 3 | | 33% the dispersion cascade (`bridge.rs`), 23% the delay lines | the filter itself |
| piano design, 88 keys | | 75% `libm`'s `atan`, `sin`, `cos` from `dispersion::refine` | only by fewer evaluations |

Two things this settled that weren't about speed: the ants' own logic
is 3% of a colony step (the fields are the cost, so more ants are nearly
free), and the broadphase's pair sort is 2% of it (dropping the sort, an
open M6 question, would buy nothing).

The fixes, each its own change with its numbers: see the "Fixed" notes
below as they land.
