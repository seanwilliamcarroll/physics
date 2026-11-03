# 06 — Constraints and Solvers

Status: **Adopted** (M3.1). Depends on `01-solvers.md` (the two families),
`02-core-types.md` (`World`, `Particles`, forces), `type-invariants.md`.

M3 adds the first constraint (a rigid rod) and two ways to enforce it, so
the families in `01` can run side by side on the same world. This doc
fixes the seams: what a constraint is, what a solver is, how a step is
split between them, and where per-solver state lives. M4 (chains), M5
(springs) and M6 (contacts) extend these seams; none of them should need
to move.

## Constraints describe geometry

A constraint is a function of positions that should be zero, plus how
stiff it is. It says nothing about *how* to enforce it: both solvers read
the same three things.

```rust
pub trait Constraint<S: Scalar> {
    /// The two particles it joins.
    fn bodies(&self) -> [ParticleId; 2];
    /// C at positions `xa`, `xb`, and ∇C with respect to `xb` (with
    /// respect to `xa` it is the negation, for every two-body constraint
    /// here). The gradient is `None` where it's undefined (coincident
    /// bodies: no direction); C is always defined, so error readouts
    /// still see it (M3.3: first sketched as `Option<(C, ∇C)>`).
    fn evaluate(&self, xa: Vec2<S>, xb: Vec2<S>) -> (S, Option<Vec2<S>>);
    /// Compliance α = 1 / stiffness, in m/N; 0 is rigid.
    fn compliance(&self) -> S;
}
```

**Two bodies only, for now.** Every constraint on the roadmap through M7
joins two particles: rods, chain links, springs, contacts. An angle
constraint (three bodies) would need `bodies() -> &[ParticleId]` and a
gradient per body; nothing needs it yet.

**`DistanceConstraint`**, the only implementation in M3:

```
d = xb − xa,   C = |d| − L,   ∇_b C = d / |d| = n,   ∇_a C = −n
```

- **Rest length from the current positions:**
  `DistanceConstraint::between(&particles, a, b) -> Option<Self>` reads
  both positions and uses their distance as `L`. No length parameter means
  no invalid length (negative, NaN). `None` if either id is unknown, or
  `a == b`.
- **Rigid only in M3** (α = 0). A settable compliance is
  `type-invariants.md`'s `Compliance` (α ≥ 0), adopted with the spring
  slider in M5; until then there is no way to pass a bad α.
- **`n = d / |d|` is the first normalization in a constraint gradient**,
  which is half of `type-invariants.md` item 3's trigger (`UnitVec2`).
  `evaluate` returns `None` for `|d| = 0`, so the degenerate case is
  handled where it arises; the type waits for a second call site.
  `n = d / |d|` divides each component (correctly rounded), not
  `d · (1/|d|)`: a 3-4-5 test caught the extra rounding.

**No `PinConstraint`.** A pin is a distance constraint to a static particle
(`add_static`, `inv_mass = 0`). Both solvers weight every correction by
inverse mass, so the anchor never moves: no special case anywhere.

**Storage: concrete, not `dyn`.** `World` holds
`Vec<DistanceConstraint<S>>`, and the solver loops are generic over
`C: Constraint<S>`, so they monomorphize (no virtual call per constraint
per iteration). The trait is the interface the solvers are written
against, which keeps them honest about using geometry only. When a second
constraint type arrives, it gets its own `Vec` (or an enum), and the
solvers run over each. Contrast `dyn Force` (`02`): one call per force per
step, against a constraint loop that runs per constraint × iteration ×
substep.

**Adding one:** `World::add_constraint(c) -> Result<(), ConfigError>`
checks the ids against this world's particles
(`ConfigError::UnknownParticle`): a constraint built from another world's
`Particles` is caught here, not as a silent wrong body. Ids can't go stale
in M3: nothing is ever removed.

## Solvers: an enum, like `Integrator`

```rust
pub enum Solver { Xpbd, Impulse }
```

Two known solvers, a closed set: exhaustive `match`, no `dyn`, and a wire
code for `demo_set_solver`, exactly as `Integrator` works. `01`'s
`trait Solver` sketch predates that precedent; revisit if a third
solver appears.

**β is a separate setting**, `World::set_baumgarte(Baumgarte<S>)`, not a
field of `Solver::Impulse`. `Solver` stays non-generic (like `Integrator`),
and the value survives switching solvers back and forth. `Baumgarte<S>`
is a parameter type (`type-invariants.md` item 2; the β slider is its
trigger): `0 ≤ β ≤ 1`, NaN rejected. Above 1 the bias overshoots: it asks
for more than the whole error back in one step.

**Iterations** (Gauss–Seidel passes over the constraints per substep):
`World::set_iterations(NonZeroU32)`, default 1. One constraint is solved
exactly in one pass (below), so iterations only matter from M4's chains.
**Substeps become settable** too: `World::set_substeps(NonZeroU32)`. The
slider is `type-invariants.md` item 4's trigger, so the setter takes the
type; `World::new` keeps its `Result` (changing it is churn for no new
safety).

## Who steps: the solver owns the step when there are constraints

Each solver is a complete way of advancing a substep, not a pass bolted
onto an integrator: XPBD derives velocities from positions, the impulse
solver integrates positions from corrected velocities. So:

```
World::step(dt):
  h = dt / substeps
  repeat substeps times:
    a = Σ forces(x)
    if constraints.is_empty():  integrator.substep(h)        // as in M0–M2
    else match solver:
      Xpbd    => xpbd_substep(h)
      Impulse => impulse_substep(h)
```

- **No constraints, no change.** Every M0–M2 scene steps exactly as before,
  so every golden hash is unchanged. This isn't just convenient: XPBD with
  zero constraints is *not* bit-identical to symplectic Euler, because it
  re-derives `v = ((x + h v) − x) / h`, which rounds (badly in f32 far from
  the origin: a known cost of position-based velocities).
- **With constraints, the integrator setting is ignored.** Both solvers
  integrate the free motion with symplectic Euler, as `01` does. A test
  pins this down: changing the integrator of a constrained world changes
  nothing, so it can't half-apply.

### XPBD substep (Macklin et al. 2016)

```
for each dynamic particle:  v += h a;  x_prev = x;  x += h v      // predict
λ = 0 for every constraint
repeat iterations times, for each constraint (a, b):
    (C, n) = evaluate(x_a, x_b)        // skip if None
    α̃  = α / h²
    w  = w_a + w_b                     // skip if w + α̃ = 0 (both static, rigid)
    Δλ = (−C − α̃ λ) / (w + α̃)
    λ += Δλ
    x_a −= w_a n Δλ;   x_b += w_b n Δλ
for each dynamic particle:  v = (x − x_prev) / h                  // derive
```

For a rigid rod to a fixed pin (α = 0, `w_a = 0`): `Δλ = −C / w_b`, and the
bob moves exactly `−C n` back onto the circle. After the projection,
`C = 0` up to rounding, every substep: XPBD's "~0" column in `01`.

### Impulse substep (Catto 2005, 2006)

```
for each dynamic particle:  v += h a
warm start: for each constraint, apply last step's accumulated λ
repeat iterations times, for each constraint (a, b):
    (C, n) = evaluate(x_a, x_b)        // skip if None
    w  = w_a + w_b                     // skip if 0
    Jv = n · (v_b − v_a)               // the constraint's velocity, Ċ
    b  = (β / h) C                     // Baumgarte bias
    Δλ = −(Jv + b) / w
    λ += Δλ                            // accumulated (no clamp: equality)
    v_a −= w_a n Δλ;   v_b += w_b n Δλ
for each dynamic particle:  x += h v
```

With β = 0 the rod's radial velocity is zeroed, but the bob then moves
along the tangent and lands outside the circle: the stretch `01` measured
(47 cm over 10 s). β feeds the position error back as a velocity.

**Accumulated λ and warm starting** are in from the start, although one
constraint doesn't need them (one pass solves it exactly, so the warm
start only changes rounding). They are what make M4's chains converge,
and M6's contacts need the accumulated value to clamp (`λ ≥ 0`); getting
the storage right now is the point.

**As built (M3.3), XPBD against `01`'s table** (energy lost over 10 s,
60 Hz, f64, `tests/constraints.rs`): 8.791 / 1.454 / 0.312 J at 1 / 20 /
100 substeps, against `01`'s 8.8 / 1.46 / 0.31 J (its script used
g = 9.81, ours 9.80665). The rod error stays within 8 ulps of 1 m in
both scalars.

## Per-solver state: λ next to the constraints

`World` keeps `lambda: Vec<S>`, one per constraint, in the same order.

| | XPBD | Impulse |
|---|---|---|
| λ means | total position multiplier this substep | total impulse this step |
| Reset | every substep | never (warm start); on solver switch |

Switching solver (`set_solver`) zeroes λ: one solver's λ means nothing to
the other. Adding a constraint pushes a 0.

## Diagnostics

- **Constraint error:** `diagnostics::constraint_error(&particles,
  &constraints) -> Option<(S, S)>`, the max and RMS of `|C|` (`None` with
  no constraints). The rod-length error plot.
- **Uniform-gravity potential:** `Σ m (−g · x)`. `diagnostics` has had only
  the pairwise potential so far; the pendulum's energy needs this one.

## Extending (not M3)

- **M4 chains, mass ratios:** iterations and their order matter; a
  forward / reverse / alternating order setting goes on `World`. Nothing
  above moves.
- **M5 springs:** `DistanceConstraint` with compliance α > 0 (XPBD), via
  the `Compliance` type. The impulse solver gets the soft-constraint form
  (Catto's soft step) or is documented as rigid-only; decide then.
- **M6 contacts:** inequality constraints, generated each step from
  collision detection rather than stored by the user. They get their own
  storage and λ (cleared when a contact disappears), and both solvers
  clamp the *accumulated* λ to `≥ 0`. The trait gains a kind (equality or
  inequality) or contacts get their own type; decide with the contact
  solver.

## References

Full entries in `references.md`.

- Macklin, Müller, Chentanez (2016), *XPBD*: the compliance form and the
  Δλ update above.
- Macklin et al. (2019), *Small Steps in Physics Simulation*: substeps
  with one iteration each.
- Catto (2005), *Iterative Dynamics with Temporal Coherence*, and (2006),
  *Fast and Simple Physics using Sequential Impulses*: accumulated
  impulses, warm starting, Baumgarte.
- Catto (2024), *Solver2D*: the side-by-side comparison this milestone
  imitates.
