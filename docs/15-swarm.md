# 15 — Swarms

Status: **Draft** (S1.1). Decisions: TASKS.md, S1. Depends on `math`
(`Vec2`, `SplitMix64`) and `web-common`; nothing in the engine.

The swarm track simulates **agents that follow rules**, not bodies that
feel forces. A boid steers by what it sees within a radius; nothing is
integrated accurately, and nothing is conserved: no energy, no momentum.
So the tests change kind. They check invariants the rules promise
(speeds stay in their band), agreement between two implementations of
one rule (brute force and the grid find the same neighbours), and a
**measured emergent order**: a flock forms, and a published order
parameter says how much. The cost story is the other half: every boid
looks at its neighbours, which is O(n²) done naively and O(n) with a
grid, and the crossover is the first result.

S1 is boids. S2 (Vicsek), S3 (ants) and S4 (Physarum) follow
(`05-roadmap.md`, "Swarm track").

## S1: Boids

### The model

Reynolds' three rules (Reynolds 1987), each from local perception
only: **separation** (steer away from crowding neighbours), **alignment**
(match their heading), **cohesion** (steer toward their centre). Couzin
et al. (2002) give the same idea a zone structure: repulsion within an
inner radius, orientation and attraction beyond it, and nothing past
the outer one. The concrete form here is the ECE 4760 boids algorithm
(Hunter Adams, read directly 2026-11-11), which is that structure with
constant gains:

For each boid, over every other boid with `|dx|, |dy|` inside the
**visual range** and squared distance below its square:

- inside the **protected range**: add the offset away from it to
  `close` (separation); it counts toward nothing else;
- otherwise: add its position and velocity to the sums, and count it.

Then, in this order:

1. If any neighbours: `v += (mean position − x) · centering` and
   `v += (mean velocity − v) · matching`.
2. `v += close · avoid`.
3. **Edge turning:** past a margin from any side of the arena,
   `v += turn` back inward on that axis (a box with soft walls).
4. **Speed clamp:** if `|v| < min`, scale to `min`; if `> max`, to `max`.
5. `x += v`.

The defaults are the course's published values: visual range 40,
protected 8, centering 0.0005, avoid 0.05, matching 0.05, turn 0.2, speed
3 to 6, a margin of 100, all in pixels and pixels per frame. They're a
course's tuning, chosen to look like a flock, not measurements of birds;
the page lets every one change. The course's "scout bias" (two groups
pulled left and right) is left out.

**The clamp at zero speed.** The source divides by the speed without a
guard. Speed exactly 0 (a boid whose terms cancelled it) has no
direction to scale; it keeps the direction it had before the step's
changes, at `min`. Tested.

### A map, Δt = 1

The published parameters are per frame: velocity in pixels per frame,
the gains dimensionless per frame. So a step is a **map** from one state
to the next, like M9's automaton, not a time step of an ODE: there are
no forces, and nothing to integrate accurately. World units are the
arena's pixels, 1:1. The rate (`FixedStep`, 60 steps a second by
default) sets how fast the flock moves on screen, not how it behaves.

The alternative, velocities per second and a `dt`, would make the rate a
numerical choice (the result would depend on it) and every published
number need converting, for nothing in return.

### Double buffering

Each step reads the current state and writes the next, then swaps.
Updated in place, boid 7 would see boid 3's new velocity and boid 9's
old one, and the result would depend on the order boids are stored in.
That is M9's problem from the other side: there, the in-place scan
*was* the model (two grains wanting one cell need an order), and the
order was chosen with care; here, every boid should see the same
instant, and double buffering gives that for free. It is also the shape
a GPU compute pass needs (S4). The course's C updates in place; this
doesn't.

The state is **structure of arrays**: `x`, `y`, `vx`, `vy` as separate
`f32` vectors, so the inner loop reads contiguous floats.

**f32 only.** The engine is generic over its scalar; here that would
build a second copy of the module for a comparison nobody needs. Fixed
point is the comparison worth having, and it belongs to M8. Goldens
still match on native and wasm: the rules use `+ − × ÷` and `sqrt`,
all correctly rounded in IEEE 754, and Rust doesn't contract `a × b + c`
into a fused multiply-add on its own.

### Finding neighbours

**Brute force** checks every pair: n(n − 1) distance tests a step. It's
the reference: simple enough to trust.

**A uniform grid** with the cell side equal to the visual range puts
every neighbour of a boid in the 3 × 3 block of cells around its own.
This is the molecular-dynamics **cell list** (Allen & Tildesley 2017,
on neighbour lists; after Hockney & Eastwood's chaining mesh): bin the particles by
cell, then search only adjacent cells. Built here by **counting sort**,
O(n), every step:

1. histogram: count boids per cell (shifted by one);
2. prefix sum: each cell's first slot in the sorted order;
3. scatter: write each boid's index into its cell's next slot.

A cell's boids are then one contiguous run of indices. No comparison
sort (and so no sort's generic code instantiated in the `.wasm`, the
lesson from M2 and M6).

**Why not the engine's broadphase?** It sorts a list of occupied cells
because its world is unbounded: a dense array of cells there would grow
with the farthest particle. The arena here is bounded and known, so a
dense array of `cols × rows` cells is small and needs no sort. Different
bounds, different query (`05-roadmap.md` made the same call).

**The two must agree exactly on who neighbours whom** (a property test
over random flocks). They needn't agree on trajectories bit for bit:
the sums over neighbours run in a different order, and float addition
isn't associative. How far they drift apart is measured, not assumed.

### What's tested, with nothing conserved

- **Speed** within `[min, max]` after every step (the clamp's promise).
- **Confinement, such as it is:** edge turning is soft. Alone, a boid
  at `max` reverses within `max² / 2 turn` = 90 px, inside the margin;
  in a flock, alignment holds its velocity within `turn / matching`
  (4 px/step) of its neighbours', so the flock turns as a body and its
  leaders overshoot, past the arena's edge (measured below).
- **Order independence:** permuting the boids permutes the result, to
  rounding (double buffering's promise).
- **It flocks.** The **polarization**, `|Σ vᵢ / |vᵢ|| / n` (Couzin et
  al.'s group polarization; Vicsek et al.'s `v_a` for constant speed),
  is 1 when every boid heads the same way and about `1/√n` for random
  headings. From a random start it must rise past a measured bound. S2
  sweeps the same number against noise.
- **Goldens:** a hash of the state after a scripted run, the same on
  wasm.

### What's measured

ns per boid-step, native (criterion) and wasm (Node, as `bench-wasm`),
for brute force and the grid at 1k, 10k and 100k boids: the crossover.
Then two changes, each measured alone and kept only if it wins:

- **Reordering by cell:** after the counting sort, physically permute
  the arrays into cell order, so a 3 × 3 search reads a few contiguous
  runs instead of jumping through an index list (the cache experiment);
- **`simd128`** for `swarm.wasm`: autovectorization of the SoA loops,
  no intrinsics and no `unsafe`.

### Rendering

Splatted by Rust into an RGBA buffer (`site/js/pixels.ts`, M9's), each
boid a few pixels **coloured by heading** on a hue wheel, so a group
moving together shows as one colour. The hue comes from a pseudo-angle
(no trig): it's drawing, not physics, and not in the goldens.

### As built (S1.2, `crates/swarm`)

`Params` (checked once: `0 ≤ protected < visual`, gains `≥ 0`, `0 < min
≤ max`), `Arena`, `Flock` (SoA, double-buffered, up to `MAX_BOIDS` =
2¹⁸, random starts inside the margins or exact ones), brute-force
`step`, `polarization`. Measured (`tests/boids.rs`, 300 boids in 640 ×
480, four seeds, 2,000 steps):

- **Speeds** stay in `[3, 6]` to f32 rounding, every boid, every step.
- **Boids leave the arena**, 2–3.4% of boid-steps, up to 330 px out
  (395 px for 2,000 boids at 1280 × 720), and come back: alignment, not
  separation (with `avoid` = 0 they still do). The page draws the arena
  as the canvas, so a few boids are briefly off screen; that's the
  model as published.
- **Order independence:** reversed storage gives identical results
  after a step, 6.1e-5 px apart after 10, 0.046 after 50: rounding,
  amplified by chaos.
- **Alignment makes the flock.** Mean polarization over steps
  500–2,000: 0.49–0.77 (peaks 0.87–0.99) from a random start's
  0.03–0.09; with `matching` = 0, 0.03–0.08. No steady value: flocks
  merge, split and turn at the walls.
- **Golden** (200 boids, 300 steps), the same on wasm32.

### The grid as built (S1.3)

`Grid` in `crates/swarm/src/grid.rs`; `Neighbours::{Brute, Grid}` on the
flock, the grid by default.

- **Exact, after one fix.** The property test (random flocks, ranges,
  arenas, boids far outside; and clumps on cell edges) found two boids
  exactly a range apart (8r, 9r) that round to just inside it while
  binning `y × (1/r)` puts them in cells 7 and 9. Cells are now 1/1024
  wider than the range: binning is off by at most ~1e-4 of a cell with
  1024 cells a side, so that covers it. Passes at 2,000 cases.
- **Trajectories:** 3.1e-5 px from brute force after a step, 6.1e-5
  after 10, 0.99 after 50 (summation order, then chaos). Two goldens.
- **Cost** (`cargo bench -p swarm`, native, Apple silicon, at the page's
  density: 10k boids in 1280 × 720, the arena scaled with n, warmed up
  300 steps):

  | n | Brute force | Grid |
  |---|---|---|
  | 300 | 312 µs (1.04 µs/boid) | 253 µs (0.84) |
  | 1,000 | 2.24 ms (2.2) | 1.35 ms (1.35) |
  | 3,000 | 10.1 ms (3.4) | 5.1 ms (1.7) |
  | 10,000 | 72.7 ms (7.3) | 13.6 ms (1.36) |
  | 100,000 | — | 157 ms (1.57) |

  **No crossover at this density:** the grid wins from 300, where the
  whole arena is barely 3 × 3 cells; at constant density the grid's cost
  per boid is flat and brute force's grows with n. But the grid is slow
  per candidate: each boid checks 250–400 candidates (85–155 are
  neighbours, more as flocks clump), **~4.5 ns each, against brute
  force's 0.73 ns per pair**, which streams through the arrays in order.
  The grid's candidates are scattered, fetched through an index list.
  10k boids at 13.6 ms natively doesn't leave room for 60 Hz in wasm.
  That is section 4's question: reordering by cell.

### Sorted, lanes and SIMD as built (S1.4)

**Reordering by cell alone did nothing.** `Neighbours::Sorted` copies
the boids into cell order every step (a gather through the counting
sort's order), so a 3 × 3 block's candidates are three contiguous runs.
With the same branchy per-candidate code it was *slower* (10k: 15.4 ms
against the grid's 13.7): 10k boids are 160 KB, in cache either way.
The hypothesis was wrong about the cost. Brute force's 0.73 ns "per
pair" is mostly cheap, well-predicted rejections (`|dx| ≥ range`); the
grid's candidates are the hard ones, a third of them real neighbours,
the protected/visual branches unpredictable.

**The page's density was 10× the course's** (10k boids in 1280 × 720
against ~300 on 640 × 480: 85–155 neighbours each). The page now flies
the flock in a 2560 × 1440 world drawn at half scale; the benches use
that density. It helps less than density predicts, since flocks pack
themselves to about the protected spacing whatever the arena.

**What did work: contiguous runs make a branchless lane loop possible.**
`Seen::add_span` takes a run of the four arrays in chunks of 8, computes
0/1 masks instead of branching (protected; visual and not protected
and not distance 0), and accumulates every term times its mask into 8
independent partial sums. Float addition isn't associative, so a
compiler won't split one running sum into lanes by itself; written as
lanes, LLVM vectorizes them. The rule at distance 0 (adds nothing) lets
the boid itself sit in its own block unskipped. Results differ from the
grid's by rounding: 3.1e-5 after a step, 1.2e-4 after 10.

| ns per boid-step, 10k boids at 2560 × 1440 | Grid | Sorted + lanes |
|---|---|---|
| native (criterion, Apple silicon) | 727 | **142** (1.42 ms a step) |
| native (`examples/timing.rs`) | 378 | 122 |
| wasm, wasmtime | 426 | 350; **206 with `simd128`** |
| wasm, Node 22 (V8) | 450 | 310; **242 with `simd128`** |

(criterion's grid includes the flock it warmed up with the grid;
`timing.rs` warms every case the same way. 100k boids: 12.4 ms native,
24 ms in V8 with `simd128`.)

**Adopted:** Sorted is the default (`Grid` and `Brute` stay, for the
page's comparison and the tests); `swarm.wasm` builds with `simd128`
(every browser has had it since Safari 16.4, 2023). The goldens are the
same with and without it: each lane does the same IEEE operations, and
lanes are added in a fixed order (checked under wasmtime). 10k boids in
about 2.4 ms a step in V8 leaves most of a 60 Hz frame for drawing.

### The wasm module as built (S1.5, `crates/swarm-web` → `swarm.wasm`)

48.5 KB, built with `simd128` in its own target dir (`target/simd`:
cargo rebuilds everything when `RUSTFLAGS` changes, and the other
modules build without it). Exports: `swarm_new(n, width, height, scale,
seed)` (a world in pixels, drawn at one pixel per `scale`: the page's
2560 × 1440 at 2), `advance`, `set_rate`, `set_step_cap`,
`set_neighbours` (brute force refused past `MAX_BRUTE` = 16,384),
`set_param`/`param` (one code per rule constant, so the page reads its
defaults from Rust rather than mirroring ECE 4760's numbers), the
predator, `render` (2 × 2 dots coloured by heading: a 256-hue wheel
indexed by the *diamond angle*, `|x| + |y|` arithmetic, monotone in the
true angle, no trig), the view size, `len`, `polarization`. A
call-sequence property test (hostile values; the count fixed, every
constant finite, polarization in [0, 1] after every call).

**The predator** is Reynolds' (1999) flee, in the crate so every mode
has it: within 100 px, steer a tenth of the way toward "directly away at
top speed" each step (both our choices).

**Found building it: `simd128` made the scalar brute-force loop 20×
slower** (2,000 boids: 3.8 → 81 ms a step in wasmtime, 4.8 → 79 in V8),
while the grid's scalar loop didn't change and the lane loop gained.
LLVM vectorized brute force's branchy loop in a way that lost badly.
Brute force now runs the lane loop over the whole arrays (they're one
run, and the boid itself adds nothing at distance 0): 1.65 ns a pair in
V8, 0.53 natively (it was 1.17). The page's brute force and sorted then
share an inner loop and differ only in their candidates, which is the
comparison worth showing. Its golden moved (lane order); `cargo xtask
test-wasm` now also runs `swarm`'s tests built with `simd128`, and every
golden holds.

Through the real exports in Node 22, the page's world (10k boids in
2560 × 1440, drawn 1280 × 720): **a step 2.37 ms sorted, 4.54 grid;
drawing 0.26 ms.** 100k: 23.6 ms a step, 2.0 ms to draw.

### The page as built (S1.6, `site/demos/s1-boids`)

The world, 2560 × 1440 at half scale (`pixels.ts`, M9's), the predator
on the pointer, a slider per rule constant (defaults read from Rust; a
refused value snaps back), the neighbour mode, a polarization plot and
a HUD with ns per boid-step. **A cost table measured in the browser**,
one case per task so the page stays live: every mode at 300 to 100k
boids at the page's density (`swarm-cost.ts`, unit-tested), brute force
to 10k. Smoke: 10k sorted, 2,000 brute force, 100k.

Order at the page's default (through the module, Node): polarization
0.22 after 10 s, 0.52 after 50, 0.84 after a minute. Each flock orders
within seconds; the sky-wide number waits for them to merge.

### Out of scope for S1

Periodic boundaries and noise (S2); fields (S3, S4); the GPU (S4
decides); threads (`workers.md`); fixed point (M8); 3D; obstacles.

## References

Papers (DOIs checked on Crossref):

- Reynolds, C. W. (1987), *Flocks, herds and schools: a distributed
  behavioral model*, SIGGRAPH Computer Graphics 21(4), 25–34.
  doi:10.1145/37402.37406
- Couzin, I. D., Krause, J., James, R., Ruxton, G. D. & Franks, N. R.
  (2002), *Collective memory and spatial sorting in animal groups*,
  J. Theor. Biol. 218(1), 1–11. doi:10.1006/jtbi.2002.3065
- Vicsek, T., Czirók, A., Ben-Jacob, E., Cohen, I. & Shochet, O. (1995),
  *Novel type of phase transition in a system of self-driven
  particles*, Phys. Rev. Lett. 75(6), 1226–1229.
  doi:10.1103/PhysRevLett.75.1226
- Allen, M. P. & Tildesley, D. J. (2017), *Computer Simulation of
  Liquids*, 2nd ed., Oxford University Press.
  doi:10.1093/oso/9780198803195.001.0001
- Hockney, R. W. & Eastwood, J. W., *Computer Simulation Using
  Particles* (1981; CRC Press reprint 2021). doi:10.1201/9780367806934

Secondary (values and practice, not claims):

- Adams, V. H., *Boids algorithm*, ECE 4760, Cornell:
  https://vanhunteradams.com/Pico/Animal_Movement/Boids-algorithm.html
  (the parameter values and update order; read 2026-11-11).
- Reynolds, C. W. (1999), *Steering behaviors for autonomous
  characters*, GDC: http://www.red3d.com/cwr/steer/gdc99/ (flee: the
  page's predator).
- Le Grand, S. (2007), *Broad-phase collision detection with CUDA*,
  GPU Gems 3, ch. 32 (grids by sorting on the GPU; S4).
