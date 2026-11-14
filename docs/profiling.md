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
| Vicsek, N = 4000, grid | 0.91 ms | 76% charged to the candidates loop's line (nine cells chained into one iterator); 14% the distance test | partly: see "Fixed" (most of that line was the loads, not the iterator) |
| broadphase, 4096 bodies | 903 µs | 56% `cell_run`'s two binary searches over all keys, per neighbour cell; about 30% sorting (the cell keys, then the pairs: `sort_pairs` is 19% with what it calls) | fixable: the searches |
| boids, 10k, sorted | 1.36 ms | 87% `Seen::add_span`, the lane loop | the work itself |
| pairwise gravity, N = 1024 | | 100% the pair loop | the work itself (Barnes–Hut is the answer) |
| Barnes–Hut, N = 4096 | | the walk in `accel_on`; build and sort 3% | nothing stands out |
| sand, busy, 640 × 360 | | `wake` 36%, `update_cell` 24%, `index` 9% | spread out; `wake` maybe |
| piano, 16 voices × 3 | | 33% the dispersion cascade (`bridge.rs`), 23% the delay lines | the filter itself |
| piano design, 88 keys | | 75% `libm`'s `atan`, `sin`, `cos` from `dispersion::refine` | only by fewer evaluations |

One thing this settled that wasn't about speed: the ants' own logic is
3% of a colony step (the fields are the cost, so more ants are nearly
free). And one it sharpened: the broadphase's pair sort, which M6 left
as an open question (drop it?; kept, 2026-11-14: `TASKS.md`), was 19% of the broadphase before the fix
below and is over half of what remains after it. `sort_pairs` showed as
2% under "self": the sorting it calls is charged to the sort routine,
and only "total" adds them up.

## Fixed

Each with the same results bit for bit (the goldens didn't move), and
measured with `cargo xtask bench` against a baseline from before.

**The ants' diffusion: 538 → 188 µs a step (−65%).** Two changes to
`Field::diffuse`, now `diffuse_counted` underneath. The colony keeps
each cell's open-neighbour count and recounts only when walls are
painted or erased (538 → 350 µs). And a cell whose count is eight is an
interior cell with nothing to test: its nine targets are three slices of
three, with no per-neighbour wall or bounds check (350 → 188 µs). What's
left is a scatter: each cell writes to its neighbours. A gather (each
cell reads its neighbours, as `diffuse_periodic` does, at a quarter of
the cost per cell) would be faster again but adds in a different order,
so every ant result would shift in its last bits and the evolved
constants would need re-scoring; not done.

**Physarum's wraps: 3.40 → 2.54 ms a step (−25%).** `Slime::cell`
wrapped each coordinate with `rem_euclid`, which is a call to `fmod`,
four lookups an agent (three sensors and the deposit), and the position
wrap two more. A sensor or a step lands at most one world-width outside,
where wrapping is one add or subtract: `wrap_cell` and `wrap_position`
take that path and keep `rem_euclid` for anything further. Exactly the
same values (tested against the general form at every branch boundary).
What's left is mostly the sensors' reads, three random accesses into a
1 MB field per agent: sorting agents by cell would make them local, at
the cost of the agents' order (and so the random stream's); not done.

**Vicsek's candidates: 910 → 795 µs a step (−13%), and a lesson in
reading lines.** The first profile charged 76% to the line `for j in
candidates`, over a nine-cell iterator built with two `flat_map`s, and
the adapters' names (`flatten`, `fuse`) were all over the inlined
frames: it read as iterator overhead. `Grid::cells_wrapped` now hands
back nine slices and the sum runs a plain loop over each, in the same
order. That removed the adapters and 13% of the time, not 76%: the line
of a loop is also charged for what the loop waits on, here the four
loads per candidate through an index (`State::get(j)`), which are the
work itself. After the change the samples sit on the loads, the
distance test and the adds, about evenly. Going further means storing
the particles in cell order and scanning lanes, as boids' `Sorted` does
(1.7× there); not done, the page runs N = 4000 in under a millisecond.

**The broadphase's neighbor cells: 903 → 303 µs at 4096 circles
(−66%; −55% at 128).** Each occupied cell looked up four neighbor cells,
each by two binary searches over every circle's key: about 100
unpredictable branches a cell. Now the occupied cells are listed once,
in order, and because cells are visited in that order each neighbor's
place in the list only moves forward: a cursor per offset finds it in a
step or two. A first attempt, one binary search over the cells instead
of two over the circles, gained 23%: the branches, not the count of
searches, were the cost. The pairs come out sorted as before, so every
engine golden is unchanged; the old algorithm is kept in the tests as a
reference.
