# 02 — Core Types

Status: **Draft**
Depends on: `00-scope.md`, `01-solvers.md`
Target: everything needed for the first demo (N-body gravity, phase 1)

## Crates

Two library crates, std only, no rendering or browser code
(full tree: `repo-layout.md`). Math types live in their own crate so the
acoustic track can share them without depending on the physics engine.

```
crates/math/         // shared by engine, acoustic, sand
  src/
    lib.rs
    scalar.rs        // Scalar trait + f32/f64 impls (Fixed comes later)
    vec2.rs          // Vec2<S>

crates/engine/       // depends on math
  src/
    lib.rs
    particles.rs     // Particles<S> storage
    force.rs         // Force<S> trait + UniformGravity, PairwiseGravity
    barnes_hut.rs    // BarnesHut: O(n log n) gravity (docs/barnes-hut.md)
    integrate.rs     // integrators
    world.rs         // World<S>, stepping, substeps
```

---

## `Scalar`

Swapped at **compile time** via generics (monomorphization). Runtime choice
happens one level up, in the wasm shell (see `03-wasm-shell.md`).

```rust
use core::ops::{Add, Sub, Mul, Div, Neg, AddAssign, SubAssign};

pub trait Scalar:
    Copy + PartialOrd + core::fmt::Debug
    + Add<Output = Self> + Sub<Output = Self>
    + Mul<Output = Self> + Div<Output = Self> + Neg<Output = Self>
    + AddAssign + SubAssign
{
    const ZERO: Self;
    const ONE: Self;

    fn from_f64(v: f64) -> Self;   // literals and configuration
    fn to_f64(self) -> f64;         // diagnostics, tests, rendering (via `as f32`)
    fn sqrt(self) -> Self;
    fn abs(self) -> Self;
}
```

Design rules:

- **Driven by usage.** Add a method only when a solver or force needs it.
  Every method is something `Fixed` must implement.
- **No `NaN`/infinity assumptions.** Fixed point has neither. Code must not
  rely on `is_nan` checks or on division by zero producing infinity.
- **`from_f64` is for setup, not hot loops.** Precompute constants
  (`G`, `dt`, softening) once, outside the step.
- **`to_f64` is a readout, not a computation path.** Used by tests,
  diagnostics plots, and the render buffer (`to_f64() as f32`). See `04-testing.md`.

Implementations: `f64` (reference), `f32`. `Fixed` (Q16.16) gets its own
doc when we reach it.

### Open questions

- Is `PartialOrd` enough, or do we want a `min`/`max`/`clamp` helper set?
  (Needed for contact clamping in phase 3, not phase 1.)
- `sqrt` on fixed point: integer Newton vs CORDIC. Defer to the `Fixed` doc.

---

## `Vec2<S>`

A 2-component math vector. Not `Vec<T>` (heap array), not a matrix.

```rust
#[derive(Copy, Clone, Debug, PartialEq, Default)]
pub struct Vec2<S> { pub x: S, pub y: S }

impl<S: Scalar> Vec2<S> {
    pub const ZERO: Self = Vec2 { x: S::ZERO, y: S::ZERO };
    pub fn new(x: S, y: S) -> Self;
    pub fn dot(self, o: Self) -> S;
    pub fn cross(self, o: Self) -> S;    // z of the 3D cross: x1*y2 - y1*x2
    pub fn perp(self) -> Self;           // rotate +90°
    pub fn length_sq(self) -> S;
    pub fn length(self) -> S;            // sqrt — avoid in hot paths when possible
}
// Operators: Add, Sub, Neg, AddAssign, SubAssign,
//            Mul<S> (scale), Div<S>, and S * Vec2 via a helper (orphan rule)
```

Note on `S * Vec2<S>`: Rust can't implement `Mul<Vec2<S>> for S` generically
(orphan rule). Either implement it per concrete scalar, or always write
`v * s`. **Decision: always `v * s`.**

Exercise: `length()` hides a `sqrt`. Count the `sqrt` calls per step in each
force and solver. It's the main cost on fixed point.

---

## `Particles<S>`

Storage for point masses. **Struct of arrays** of `Vec2` fields:

```rust
pub struct Particles<S> {
    pos: Vec<Vec2<S>>,        // private: all three Vecs must stay the same length
    vel: Vec<Vec2<S>>,
    inv_mass: Vec<S>,         // 0 = static / pinned
}

impl<S: Scalar> Particles<S> {
    pub fn add(&mut self, pos: Vec2<S>, vel: Vec2<S>, mass: Mass<S>) -> ParticleId;  // M3: Mass
    pub fn add_static(&mut self, pos: Vec2<S>) -> ParticleId;    // inv_mass = 0, vel = 0
    pub fn len(&self) -> usize;
    pub fn pos(&self) -> &[Vec2<S>];          // slices: readable and mutable
    pub fn vel(&self) -> &[Vec2<S>];          // element-wise, but the length
    pub fn inv_mass(&self) -> &[S];           // can't change
    pub fn vel_mut(&mut self) -> &mut [Vec2<S>];
}
```

**Decision (M0): two constructors, not one.** `add_static` exists so that
`inv_mass = 0` never comes from `1 / 0`: that would be infinity on floats
and has no representation on fixed point.
`add` still trusts `mass > 0`; `type-invariants.md` records why that's
not a type yet and when it should become one (M3).

**Decision (M0): the acceleration scratch buffer lives in `World`, not
`Particles`.** `Force::accumulate(&self, p: &Particles<S>, acc: &mut [..])`
borrows `p` immutably and `acc` mutably at once; if `acc` were a field of
`p`, the borrow checker would reject every call.

**`ParticleId` (M3).** Nothing in M0 referred to an individual particle;
constraints (M3) do. `add` and `add_static` return a `ParticleId`, a plain
index: particles can't be removed, so it can't go stale. A generational
handle waits for removal (`type-invariants.md`, item 5).

Why `inv_mass`: every solver formula uses `w = 1/m`, and `w = 0` gives an
immovable pin for free. That's needed for the pendulum in phase 2.

Why SoA: the force and integration loops each touch one or two fields.
This is a first guess, recorded as an open question in `00-scope.md`.
Fully split (`pos_x: Vec<S>, pos_y: Vec<S>`) is the SIMD-friendly variant
to benchmark later.

---

## Forces

```rust
pub trait Force<S: Scalar> {
    /// Add this force's acceleration into `acc` (already zeroed by the world).
    fn accumulate(&self, p: &Particles<S>, acc: &mut [Vec2<S>]);
}
```

Phase 1 implementations:

- `UniformGravity { g: Vec2<S> }` — the same acceleration for every non-static particle.
- `PairwiseGravity { g_const: S, softening_sq: S }` — O(n²), each pair once
  (`i < j`), equal and opposite, so momentum is conserved.

**Softening** is mandatory, not optional:

```
a_i += G * m_j * r / (|r|² + ε²)^(3/2)
```

Without `ε`, two close bodies produce an enormous acceleration, blow up
in one step, and fling apart. That's the N-body version of the stiff-spring
lesson. On fixed point, `1/r²` dynamic range is a known hard case.
Expect N-body to be a *demo of fixed-point failure* before it's a success.

Accelerations, not forces: storing `a = F/m` means static particles
(`inv_mass = 0`) are skipped naturally, with no division by zero.

**As built (M2.4):** `PairwiseGravity::new(g_const, softening: Softening<S>)`.
`Softening` is checked once (`≥ 0`, not NaN; `docs/type-invariants.md`), so
the force stores ε² and trusts it. Changing ε on a running world is
`World::clear_forces` + `add_force(scenarios::gravity(ε))`, rather than a
setter on `Box<dyn Force>` (which would need downcasting).

**As built (M1.2):** each pair computes one force vector and applies it
`+F·wᵢ` / `−F·wⱼ`, so forces are equal and opposite by construction
(momentum drift is at rounding level). Static particles have no defined
mass: they neither pull nor are pulled. `new(g, ε)` stores ε², so a
negative ε is harmless; ε = 0 is allowed, and a coincident pair with
ε = 0 is skipped rather than producing `0/0`. Masses are computed once
per call (n divisions, not n²). The `i < j` loop walks slices with
`split_first_mut` (no indexing).

---

## Integrators

```rust
pub enum Integrator {
    ExplicitEuler,       // x += v dt; v += a dt   (the cautionary tale)
    SymplecticEuler,     // v += a dt; x += v dt   (default)
    VelocityVerlet,      // second order, needs a second force evaluation
}
```

An enum rather than a trait: the set is small and closed, and the world
needs to know whether an integrator requires a second force pass.

Planned side-by-side: one orbit, three integrators. Explicit Euler spirals
outward, symplectic Euler stays bounded with small wobble, Verlet is tighter.
Plot total energy over time.

**As built (M1.3):** `Integrator::substep` takes the forces and two
`World`-owned scratch buffers; velocity Verlet evaluates forces a second
time into the second buffer (no cached acceleration, so teleports like
the fountain's respawn can't leave it stale). `Integrator::ALL` drives
tests and demos. Measured on the M1 orbit (ωh = 0.035): symplectic
Euler's max |ΔE/E| ≈ (ωh)², velocity Verlet's ≈ (ωh)⁴/4, and explicit
Euler gains energy every orbit and escapes. Details in `04-testing.md`.

---

## `World<S>`

```rust
pub struct World<S: Scalar> {
    pub particles: Particles<S>,
    forces: Vec<Box<dyn Force<S>>>,
    integrator: Integrator,
    substeps: u32,
    acc: Vec<Vec2<S>>,        // scratch, reused every substep
}

impl<S: Scalar> World<S> {
    pub fn new(integrator: Integrator, substeps: u32) -> Result<Self, ConfigError>;
    pub fn add_force(&mut self, f: impl Force<S> + 'static);  // boxed internally
    pub fn step(&mut self, dt: S);   // one fixed step = `substeps` substeps
}
```

**Decision (M0): `new` returns `Result`.** `substeps = 0` is rejected with
`ConfigError::ZeroSubsteps` rather than a panic (library code may not
panic; see `lint-policy.md`). Considered: `NonZeroU32`, which moves the
check into the type at the cost of clunkier call sites.
**Revised (M3/M4 audit):** `World::new(integrator, substeps: NonZeroU32)`
returns `World` directly. The `Result` had spread to every scene for an
error none could hit, and M3 had already given `set_substeps` the type.
Scene constants are `const` items (`NonZeroU32::MIN`); tests write
`nonzero(4)` (`test-support`).

**Decision: `dyn Force<S>`** (for now). Dispatch happens once per force per
substep, and each call does O(n) or O(n²) work, so the indirect call is
negligible and each impl's inner loop is still fully optimized. Contrast
with `Scalar`, where dispatch would be per arithmetic op.

Rejected: `World<S, F: Force<S>>`. Multiple forces need tuple types, and each
scalar × force-set combination becomes a distinct type, multiplying
`AnyWorld` variants and wasm binary size.

Alternative kept in reserve: `enum ForceKind<S>` (static dispatch, no heap,
closed set). Revisit if the `criterion` benchmark shows measurable dispatch cost.

Phase 2 adds constraints and the `Solver` trait from `01-solvers.md`.
`step` will become: accumulate forces → solver steps → done.

---

## Testing

See `04-testing.md`. Adds `engine::diagnostics` (momentum, energy, center
of mass), shared by tests and demo plots.
