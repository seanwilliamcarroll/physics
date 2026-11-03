# 00 — Scope

Status: **Draft**
Dimension: **2D only** (committed)

## Purpose

A 2D physics engine in Rust, compiled to WebAssembly, that drives a set of
interactive demos on a personal website. The engine is a learning vehicle
first and a showcase second: clarity and correctness of the core matter
more than feature breadth.

## Demo targets

| Demo | Bodies | Interactions | Core features exercised |
|---|---|---|---|
| N-body gravity | Point masses | Pairwise gravity (no contact, or optional merging) | Force fields, symplectic integration, O(n²) vs Barnes–Hut |
| Spring–mass | Particles | Springs (soft distance constraints) | Compliance, stiffness vs stability |
| Chain / pendulum | Particles, static pins | Rigid distance constraints | Constraint solving, drift, energy behavior |
| Colliding masses | Circles | Contacts with restitution | Momentum conservation, impulse/velocity resolution |
| Billiards | Circles, static segments (cushions) | Contacts, friction, restitution | Broadphase, tunneling, rolling vs sliding |
| Falling sand | Grid cells | Cellular automaton rules | **Separate crate** — shares only the wasm/render shell |
| Struck string (piano) | 1D field / delay line | Waveguide or finite-difference string, hammer excitation | **Acoustic track** — audio-rate, fixed grid |
| Drum | 2D field | Finite-difference wave equation on a mesh | **Acoustic track** — audio-rate, fixed grid |

## Unifying model

Every demo except falling sand reduces to:

- **Bodies** — position, velocity, inverse mass, and (for colliders) a shape.
  Initial shapes: point, circle. Static geometry: segment, half-plane.
- **Force generators** — produce accelerations each step (uniform gravity,
  pairwise gravity, drag).
- **Constraints** — either *persistent* (springs, rods, pins) or *transient*
  (contacts generated each step by collision detection).
- **A stepper** — advances the world by a fixed `dt`, with substeps.

## Goals

1. One core crate (`no_std`-friendly where practical) with no rendering or
   browser dependencies.
2. Deterministic stepping given identical inputs and step counts.
3. Linear momentum conserved by contact and constraint resolution
   (mass-weighted corrections).
4. Stable at interactive rates (60 Hz render, configurable physics substeps).
5. Data layout chosen deliberately and benchmarked (SoA vs AoS is an open
   question, not a default).
6. A thin wasm binding layer plus a simple canvas renderer for demos.
7. Two solver families (XPBD and substepped sequential impulses) behind a
   common interface, so demos can run the same scene side by side.
   See `01-solvers.md`.

## Scalar policy

The engine is generic over its scalar type via an in-house `Scalar` trait
(no `num-traits`, per the dependency policy). Target implementations:

- `f64` — reference implementation; orbits, accuracy baselines.
- `f32` — wasm SIMD, memory bandwidth, audio throughput.
- **Fixed point** (e.g. Q16.16, Q1.15 for audio) — in-house type.
  Motivations: bit-exact determinism across platforms, and revisiting the
  microcontroller techniques from Cornell ECE 4760/5760.

Fixed point forces explicit answers to things floats hide:
`sqrt` (integer Newton or CORDIC), normalization (`x / |x|` in every
constraint gradient), overflow in squared distances, and range/precision
per quantity (positions vs velocities vs compliance). The `Scalar` trait
must therefore not assume `sqrt`, `recip`, or constants are free or exact.

## Dependency policy

- Core crate: **std only** (math types such as `Vec2` written in-house).
- A third-party crate is allowed only where it's necessary (e.g. the wasm
  boundary) and has broad community adoption plus an active maintenance record.
- Each dependency gets a short justification in the design doc that introduces it.
- Dev-dependencies (benchmarking, property testing) follow the same bar.
- Approved so far: `proptest`, `criterion` (dev-only; see `04-testing.md`),
  pinned once in the root `Cargo.toml` (`[workspace.dependencies]`).
  `proptest` 1.12.0 (re-checked M2: `proptest-rs` org, active) without
  default features: its `fork`/`timeout` need subprocesses, which WASI
  lacks.
- `typescript` (npm, dev-only, M1): type-checks `site/`'s plain `.js`
  through JSDoc annotations and `site/js/engine.d.ts` (`tsc --noEmit`).
  Nothing it produces ships to browsers. Microsoft-maintained, very widely
  used; pinned exactly in `package.json` / `package-lock.json`. See
  `type-invariants.md` (item 8).

## Non-goals (v1)

- 3D, or abstracting over dimension.
- General rigid bodies with full rotational dynamics and convex polygons
  (candidate for phase 2).
- Continuous collision detection (substepping is the v1 answer to tunneling).
- Fluid, cloth, or soft-body meshes beyond spring networks.
- Being a general-purpose engine for other users.

## Phasing (tentative)

Detailed milestones, per-demo showcases, and implementation lists: `05-roadmap.md`.

1. **Particles + integration** — N-body demo. Compare integrators.
2. **Persistent constraints** — springs, rods, pins. Chain/pendulum demo.
3. **Circle contacts** — broadphase, narrowphase, restitution. Colliding-masses demo.
4. **Static geometry + friction** — segments, cushions. Billiards demo.
5. **Falling sand** — separate crate, shared shell. Candidate side-by-side:
   cellular-automaton sand vs a discrete-element (DEM) sand pile built from
   the circle-contact engine, comparing how the angle of repose arises
   (rule choice vs friction).
6. **Phase 2 candidates** — rotation, polygons, Barnes–Hut, CCD.
7. **Acoustic track** — separate crate, shared math types (see below).

## Acoustic track (later phase)

Physical modeling synthesis, run in a Web Audio `AudioWorklet` at 44.1–48 kHz.
It differs from the core engine in regime, not in physics: a string is the
chain demo at high node count, and a finite-difference drum is a spring–mass
lattice. Its stability limit (Courant number; ρ < 0.5 in Land's lab) is the same
lesson as the stiff-spring demo.

Starting point: the author's 2015 ECE 4760 "Piano Gloves" project
(Karplus–Strong on a PIC32 at 11,025 Hz; triangle-wave hammer excitation
placed near one end of the delay line; three detuned strings per key;
re-strike to mimic the second hammer contact; echo buffer for body resonance).
Known limits of that design are the roadmap:

- Low notes sounded wrong → model **string stiffness / dispersion**
  (allpass dispersion filters, or a stiff-string finite-difference scheme).
- Hammer was a fixed initial shape → model a **nonlinear felt hammer**
  as a dynamic interaction (Chaigne & Askenfelt).
- Sample rate and polyphony were memory/cycle-bound → no longer a constraint
  in wasm; becomes a throughput benchmark instead.

Steps:

1. Karplus–Strong string with fractional-delay tuning (Jaffe & Smith 1983).
2. Digital waveguide string with pickup and excitation position (J.O. Smith, *PASP*).
3. Piano voice: detuned string groups, stiffness, nonlinear hammer.
4. Drum: finite-difference 2D wave equation (Land, ECE 5760 lab), then
   tension-modulated nonlinearity; compare against the 2D waveguide mesh
   (Van Duyne & Smith 1993).
5. Visualize the field (string displacement, membrane height map) alongside audio.
6. Benchmark nodes × sample rate in wasm (scalar vs SIMD).

References (full entries and links in `references.md`):

- Piano Gloves (2015): https://people.ece.cornell.edu/land/courses/ece4760/FinalProjects/f2015/swc63_ncm42_jmt329/swc63_ncm42_jmt329/webpage/
- Land, ECE 4760 Karplus–Strong: https://people.ece.cornell.edu/land/courses/ece4760/RP2040/C_SDK_DSP/index_KS_synth.html
- Land, ECE 5760 drum lab: https://people.ece.cornell.edu/land/courses/ece5760/LABS/s2016/lab3.html
- Jaffe & Smith (1983): https://doi.org/10.2307/3680063
- Smith, *Physical Audio Signal Processing*: https://ccrma.stanford.edu/~jos/pasp/
- Van Duyne & Smith (1993): https://ccrma.stanford.edu/~jos/pdf/mesh.pdf
- Chaigne & Askenfelt (1994): https://doi.org/10.1121/1.408459
- Bilbao, *Numerical Sound Synthesis* (2009): ISBN 978-0-470-51046-9
- Adib, FD wave-equation study notes (2000): https://arxiv.org/abs/physics/0009068

## Open questions

- ~~**Solver family**~~ — decided: both, see `01-solvers.md`.
- **Restitution:** how is it handled in the chosen solver (velocity pass)?
- **Simultaneous collisions:** do we care that a sequential solver gets
  Newton's cradle "wrong"? Is it a test case?
- **Billiards spin:** top-down 2D cannot represent topspin/backspin directly.
  Model a sliding→rolling transition only, or carry an extra spin state?
- ~~**Units**~~ — decided (M0): SI throughout (meters, kg, seconds);
  the renderer applies a pixels-per-meter scale.
- ~~**Scalar type**~~ — decided: generic. See "Scalar policy" below.
- **Body handles:** indices, generational arenas, or something else?
