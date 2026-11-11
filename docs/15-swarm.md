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
