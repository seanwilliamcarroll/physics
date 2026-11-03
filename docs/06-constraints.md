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
- **Rigid only in M3** (α = 0). **M4 adds compliance** (the drag needs a
  soft constraint): `Compliance<S>` (α ≥ 0, m/N, a `params/` type) and a
  constructor taking it plus an explicit rest length
  (`with_length(p, a, b, length, compliance)`; length ≥ 0, checked), for
  the drag's rest length of 0. See "Compliance in both solvers" below.
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
type. (`World::new` followed in the M3/M4 audit: it takes `NonZeroU32`
and can no longer fail.)

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

**As built (M3.4), the whole table** (f64, `tests/solver_table.rs`; f32
matches to the digits shown except where noted):

| Row | `01` rod error | ours | `01` energy lost | ours |
|---|---|---|---|---|
| Impulse, β = 0 | 47 cm | 47.5 cm | 8.4 J | 8.39 J |
| Impulse, β = 0.2 | 1.3 cm | 1.27 cm | 0.98 J | 0.986 J |
| Impulse, β = 0.2, 20 substeps | 0.03 mm | 0.034 mm | 0.005 J | 0.0056 J |
| XPBD, 1 substep | ~0 | 2.2e-16 m | 8.8 J | 8.79 J |
| XPBD, 20 substeps | ~0 | 2.2e-16 m | 1.46 J | 1.45 J |
| XPBD, 100 substeps | ~0 | 2.2e-16 m | 0.31 J | 0.31 J (f32: **gains** 0.11 J) |

**The f32 row `01` doesn't have:** XPBD derives `v = (x − x_prev) / h`.
At 100 substeps the bob moves ~0.4 mm per substep at radius 1 m, where
f32's spacing is ~0.1 µm, so every derived velocity carries ~1e-4
relative rounding noise, and the energy wanders (here, upward). More
substeps make f32 XPBD *worse*, the reverse of "substeps are the great
equalizer". The impulse solver integrates velocities directly and doesn't
have this problem. A known failure now
(`xpbd_f32_substeps_derive_noisy_velocities`); worth showing on the page.

**As built (M4.4), the 1:100 chain** (`scenarios::chain`: 10 links,
1 m, 10 g link particles, 1 kg bob, released level with the pin; 10 s
at 60 Hz, f64, `tests/chains.rs`). Max link error / max total stretch:

| Solver | Substeps | Iterations 1 | Iterations 10 |
|---|---|---|---|
| XPBD | 1 | 65 cm / 5.7 m | 8.1 cm / 71 cm |
| XPBD | 20 | 3.2 mm / 2.8 cm | 0.46 mm / 4.0 mm |
| Impulse (β = 0.2) | 1 | 1.19 m / 5.6 m | 1.10 m / 5.4 m |
| Impulse (β = 0.2) | 20 | 42 cm / 1.65 m | 3.7 cm / 14 cm |

At one substep both fail; at 20, XPBD's chain is ~130x tighter than the
impulse solver's, and iterations help both (~7x XPBD, ~11x impulse). The
mass ratio is the cause: at 1:1 the same 20-substep chain holds to 0.51
mm (XPBD) and 4.1 mm (impulse). f32 is within ~30% of each.

**As built (M4.4), the double pendulum** (`scenarios::double_pendulum`:
two 1 m rods, 1 kg bobs, released horizontal; impulse, 20 substeps).
Copies 1e-9 m apart reach 1 cm tip separation at **23.8 s**, not "a few
seconds": this start stays nearly regular for ~10 s (tips 3e-9 m apart
at 10 s, 1e-4 m at 20 s). f32 against f64 separates at 14.9 s. Energy
stays within 0.039 J (0.4% of m g L) over 30 s. XPBD at 20 substeps
loses ~10 J in 20 s, and its 1e-9 copies never reach 1 cm in 120 s:
its damping kills the chaos, which is why the page defaults to impulse.

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

## M4: compliance, iteration order, dragging

### Compliance in both solvers

XPBD already has the compliant form (`α̃ = α / h²` above). The impulse
solver gets Catto's soft constraint (GDC 2011, "Soft Constraints"), which
lands in the same shape. For a spring of stiffness `k` and damper `c`,
Catto defines `γ = 1 / (h (c + h k))` and a bias factor `β' = h k / (c + h k)`;
with no damper (`c = 0`) that is `γ = 1/(h² k) = α / h² = α̃` and `β' = 1`:

```
Δλ = −(Jv + b + α̃ λ) / (w + α̃)
b  = (β / h) C     rigid rod (α = 0): today's Baumgarte, the β setting
b  = C / h         compliant (α > 0): the spring's own bias (β' = 1)
```

So α = 0 is exactly today's rigid update (goldens unchanged), and a
compliant rod means the same physical stiffness `k = 1/α` in both
solvers. Check: a bob on a compliant rod oscillates with period
`2π √(m α)` (small amplitude) under either. **As built (M4.2):** k =
100 N/m, m = 1 kg: 0.62857 s measured in both solvers against 0.62832 s
(`tests/compliance.rs`). No damping in M4; M5's springs
decide whether to add `c`.

### Iteration order

Gauss–Seidel uses each constraint's correction immediately, so the order
constraints are visited is part of the method: along a chain, forward
order propagates a correction down the chain within one pass, reverse up
it. `Order::{Forward, Reverse, Alternating}` lives on `Constraints` (with
the other solver settings), default `Forward` (goldens unchanged).
`Alternating` flips every iteration, a cheap way to cancel the directional
bias.

**Consequence for the permutation property** (`tests/properties.rs`):
shuffling bodies changes only rounding *without* constraints, and that
property stays. *With* constraints, a shuffle reorders the Gauss–Seidel
sweep, a genuinely different (but valid) solve, so exact invariance is
gone; the constrained version asserts a bounded difference instead (both
runs keep every constraint within the solver's error bound).
**As built (M4.3,** `tests/constrained_properties.rs`**):** random 2–6 link
chains, 8 substeps × 4 iterations: max rod error over 1 s 3.9 mm (XPBD) /
10.4 mm (impulse); the two orders 52 µm / 4.9 µm apart after 0.1 s. Over a
full second the gap grows to centimeters, which is the chain's sensitivity,
not the ordering, so the comparison uses the short horizon.

### Dragging

A grab is two temporary additions, a release removes them:

1. **Grab** at a world point: pick the nearest dynamic particle within a
   radius; add a **static anchor** particle at the point and a compliant
   rod of **rest length 0** from anchor to particle.
2. **Drag:** move the anchor (`Particles::set_static_position`, static
   particles only, checked). The rod's compliance makes the pull soft, so
   a fast flick doesn't yank the chain or (impulse) inject energy.
3. **Release:** pop the rod and the anchor (`Constraints::pop`,
   `Particles::pop`: the last-added only). That's not general removal, so
   `ParticleId` stays a plain index: ids of everything else are unchanged.

Rest length 0 makes the gradient undefined exactly when `C = 0` (anchor
on the particle): `evaluate` returns `None` there and the solvers skip,
which is the right answer (no pull needed).

**As built (M4.5):** `World::grab(point, radius, softness) -> Option<Grab>`,
`drag(&Grab, point)`, `release(Grab) -> Result<(), Grab>` (the token comes
back if something was added after the grab, so the caller can retry).
Flicking the 1:100 chain's bob 1.1 m in 0.2 s and holding (k = 1000 N/m,
20 substeps, `tests/drag.rs`): XPBD's links stretch at most 8.1 mm, the
impulse solver's 18.3 cm, with its bob 42 cm behind the cursor. A slow
drag hides most of it: the chain has to accelerate.

## Extending (not M4)

- **M5 springs:** compliant `DistanceConstraint`s exist since M4; M5 adds
  the force-based `SpringForce` baseline and decides on damping.
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
- Catto (2011), *Soft Constraints*: the soft form of the impulse update
  (M4).
- Catto (2024), *Solver2D*: the side-by-side comparison this milestone
  imitates.
