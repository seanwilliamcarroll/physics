# 07 — Springs and Soft Bodies

Status: **Adopted** (M5.1). Depends on `06-constraints.md` (compliance in
both solvers, M4) and `02-core-types.md` (forces, the integrator).

M5's showcase is stiffness against stability: a force-based spring
explodes past a critical stiffness, while a compliant constraint stays
stable at any stiffness, up to rigid. This doc derives the threshold,
then fixes the pieces: two parameter types, a spring force, damping in
every stepper, the jelly's network, the ground, and the energy terms.

## Why force-based springs explode: the threshold

One spring of stiffness `k` on a mass `m` (no gravity, no damping) is
`x'' = −ω² x` with `ω = √(k/m)`. Symplectic Euler with substep `h`:

```
v' = v − h ω² x
x' = x + h v'  = (1 − h² ω²) x + h v
```

As a matrix on `(x, v)`: `[[1 − h²ω², h], [−h ω², 1]]`. Its determinant
is 1 (symplectic: phase-space area is kept), and its trace is
`2 − h² ω²`. Eigenvalues `λ` satisfy `λ² − (2 − h²ω²) λ + 1 = 0`; they
stay on the unit circle (bounded motion) exactly while
`|2 − h² ω²| ≤ 2`, that is **`ω h ≤ 2`**. Past it, one eigenvalue has
`|λ| > 1` and the amplitude grows by that factor every substep. So:

```
k_crit = 4 m / h²
```

That's a sharp threshold, so it's a test: stable at `0.9 k_crit`,
divergent at `1.1 k_crit` (`explicit_spring_diverges_above_critical_stiffness`).
Substeps raise it as `1/h²`: twice the substeps, four times the
stiffness.

**As built (M5.2,** `tests/springs.rs`**):** 1 kg, one 1/60 s substep
(`k_crit` = 14 400 N/m): max energy over 10 s is 2.0e2× the start at
0.99 `k_crit` and 5.9e71× at 1.01. And below the threshold the *true*
energy still swings (3× at 0.5 `k_crit`, 19× at 0.9): symplectic Euler
conserves a nearby "shadow" energy that drifts far from the true one near
`ωh = 2`. Bounded is not the same as accurate.

**A network fails earlier.** Coupled springs have vibration modes, and the
fastest decides stability: `ω_max = √(λ_max(M⁻¹ K))`. For a chain of
equal masses and springs, `λ_max → 4k/m`, so `ω_max = 2ω` and the chain
explodes at a quarter of one spring's `k_crit`. The jelly's grid, with
shear and bend springs adding stiffness per particle, goes lower still;
its threshold is measured (M5.5, below) and shown on the page.

**Compliant constraints don't have a threshold.** XPBD's update
`Δλ = (−C − α̃λ) / (w + α̃)` divides by `w + α̃`, which stays positive and
bounded for any `α ≥ 0`: a stiffer spring only means a smaller `α̃`, down
to `α = 0` (rigid, a projection). It's an implicit method in disguise:
the correction is solved for the end of the step, not extrapolated from
its start. Catto's soft form for the impulse solver is the same in
velocity space. The cost is damping (`06`, "Stabilization"): the
constraint panels lose energy that the force panel keeps, until it
explodes.

## Parameters

Two new types in `params/` (`checked_param!`):

- **`Stiffness<S>`**: `k > 0` and finite, N/m. A force-based spring can't
  be rigid (`k = ∞` is no force law), so rigid has no representation
  here; the page's slider reaches "rigid" only for the constraint panels.
- **`Damping<S>`**: `c ≥ 0`, N·s/m.

Compliant constraints keep `Compliance` (`α = 1/k`, `α = 0` rigid). The
page's single stiffness slider is logarithmic in `k` and maps to
`Stiffness` (force panel) and `Compliance` (constraint panels).

## `SpringForce`

A `Force` over springs `(a, b, rest, k, c)`:

```
d = x_b − x_a,  n = d / |d|
F = (k (|d| − rest) + c (v_b − v_a) · n) n      on a; −F on b
```

Equal and opposite, so momentum is conserved to rounding (as
`PairwiseGravity`). Coincident bodies (`|d| = 0`) have no direction and
are skipped. Stepped by the integrator like every force, so the
explosion is the integrator's, exactly as derived above.

## Damping in all three steppers

An undamped jelly wobbles forever, and a damped force spring against
undamped constraints would compare damping, not stability. So every
stepper gets the same physical damper `c`:

- **Force:** the `c (v_b − v_a) · n` term above.
- **XPBD** (Macklin et al. 2016, eq. 26): with `β̃ = h² β` and
  `γ = α̃ β̃ / h`,
  `Δλ = (−C − α̃λ − γ ∇C · (x − x_n)) / ((1 + γ) w + α̃)`, where
  `x − x_n` is the motion since the start of the substep. In our
  parameters `β = c` (so `γ = α c / h`).
- **Impulse** (Catto 2011): `γ = 1 / (h (c + h k))`, bias factor
  `h k / (c + h k)`. With `c = 0` these are M4's `α̃` and `1`, so
  undamped constraints stay **bit-identical** (goldens).

Check, in all three: a damped bob's amplitude decays as `e^(−c t / 2m)`.

**As built (M5.3,** `tests/compliance.rs`**):** k = 100 N/m, c = 0.4,
m = 1 kg, 20 substeps, 5 s. Damped divided by undamped energy: 0.1339 vs
`e^−2` = 0.1353, in XPBD and impulse alike (they agree to 12 digits: the
same update, in position or velocity form). **And the undamped constraint
loses energy too**: 0.65925 of it is left after 5 s, exactly backward
Euler's `(1 + ω²h²)^−n` = 0.6593. Compliant constraints are implicit, and
implicit steps damp by themselves; that's the price of having no
stability threshold. The force spring keeps its energy (within 0.8% of
the analytic damped decay) until it explodes. That's M5's trade-off in
one measurement.

## The jelly: one network, two realizations

`scenarios::jelly(cols, rows, …)` builds a **`SpringNetwork`**: the
particles of a grid plus three kinds of pairs with rest lengths,

- **structural:** horizontal and vertical neighbors (shape);
- **shear:** both diagonals of each cell (resists shearing);
- **bend:** neighbors two apart, horizontally and vertically (resists
  folding).

The same network becomes either `SpringForce` springs or compliant
`DistanceConstraint`s, with the same masses and topology, so the panels
differ only in how springs are enforced.

**As built (M5.5,** `tests/jelly.rs`**; 8×8, 1 kg, 10 substeps, c = 0.5):**
the force-based jelly blows up between 0.1 and 0.15 of the single-spring
`k_crit` (22 500 N/m here), so between ~2 250 and ~3 400 N/m: the grid's
fastest mode is about 3× faster than one spring's. Both constraint solvers
stay stable at one iteration from k = 10³ to rigid (peak kinetic energy
4.82 J, the fall's, in every run). Stability is judged by kinetic
energy: the elastic energy of very stiff, unconverged constraints
(`½ C²/α`, tiny `α`) is meaningless, and showed XPBD "gaining" 3e5 J
while at rest.

### Soft constraints aren't warm-started (found in M5.5)

At first the impulse solver's jelly exploded from k ≈ 10⁴ N/m at one
iteration (peak kinetic energy up to 7.8e5 J), while 10 iterations
held it at any stiffness. The M4 mechanism again, through the soft form:
a soft constraint's λ feeds back into its own update (the `α̃ λ` term), so
warm starting re-applies the previous substep's bias on a network one
pass can't converge. Measured remedies:

| Remedy | Jelly | Spring period | Damping rate |
|---|---|---|---|
| none (warm start everything) | explodes from 10⁴ | right | right |
| **no warm start for soft constraints** | **stable, any k** | **right** | **right** |
| relax pass without bias (Box2D v3 style) | stable | **broken: springs stop oscillating** | broken |
| frequency cap, `ω h ≤ 1` | stable | right | changes the physics |
| frequency cap, `ω h ≤ π/2` | still explodes | right | |

So soft λ restarts at 0 every substep (it still accumulates within the
substep); rigid constraints keep warm starting, which M6's contacts will
need for stacks.

## The ground: a clamp, not contacts

`World::set_ground(Some(y))`: after each substep, any dynamic particle
below `y` moves up to it and loses its downward velocity (inelastic, no
friction). It applies to every stepper, so the jelly lands in every
panel. It removes energy at impacts by design; energy checks allow drops,
never rises. Real contacts (normals, restitution, friction, other
bodies) are M6.

## Live stiffness

- **Force panel:** `SpringForce::with_stiffness`, then `clear_forces` and
  re-add gravity and the springs (M2's softening pattern).
- **Constraint panels:** `World::update_constraints(grab, f)` rewrites
  every constraint in place (`with_compliance`, `with_damping`), except a
  held drag rod, so the slider doesn't reset the jelly.

**As built (M5.7, `site/demos/m5-jelly/`):** the slider is `log10 k` from
1 to 7 in half decades, plus one stop past the top for rigid. The force
panel refuses rigid (`demo_set_stiffness` returns 0) and keeps its last
finite `k`, saying so in its readout. A panel whose kinetic energy passes
100 J (20× the drop's peak), or whose particles leave a 10 m box, counts
as exploded and freezes until reset, so the plot never sees infinities.
It freezes on the **last sane frame**, not the current one: past the
threshold the grid's fastest mode grows by `|λ| ≈ s − 2` per substep
(`s = ω²h²`, a negative λ, so it flips sign every substep: the
checkerboard flicker), compounded over 10 substeps a frame. At
10^3.5 N/m that's 0.05 J, 33 J, 10³³ J, NaN on successive frames, and at
10⁴ N/m and above the first step already explodes. By the frame that
trips the check, the particles are at ~10¹⁰ m. The hint under the controls computes
`k_crit = 4m/h²` for the current grid, rate and substeps, with the
measured 0.1–0.15 band for the whole grid.

## Energy

For the energy plot (where the explosion shows first, a moment before
the jelly visibly tears):

- force springs: `½ k (|d| − rest)²` each;
- compliant constraints: `½ C² / α` each (`α > 0`); a rigid constraint
  stores no energy (`C` is held at 0);
- plus gravity and kinetic energy, as before.

## References

Full entries in `references.md`.

- Macklin, Müller, Chentanez (2016), *XPBD*: compliance and the damped
  update (eq. 26).
- Catto (2011), *Soft Constraints*: the spring–damper mapping onto the
  impulse update.
- Hairer, Lubich, Wanner, *Geometric Numerical Integration*: why
  symplectic Euler keeps phase-space area (det = 1) and where its
  stability ends.
