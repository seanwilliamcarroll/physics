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

**A network fails earlier.** Coupled springs have vibration modes, and the
fastest decides stability: `ω_max = √(λ_max(M⁻¹ K))`. For a chain of
equal masses and springs, `λ_max → 4k/m`, so `ω_max = 2ω` and the chain
explodes at a quarter of one spring's `k_crit`. The jelly's grid, with
shear and bend springs adding stiffness per particle, goes lower still;
its threshold is measured (section 5) and shown on the page.

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
stepper gets the same physical damper `c` (`TASKS.md` M5 decision 4):

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

## The ground: a clamp, not contacts

`World::set_ground(Some(y))`: after each substep, any dynamic particle
below `y` moves up to it and loses its downward velocity (inelastic, no
friction). It applies to every stepper, so the jelly lands in every
panel. It removes energy at impacts by design; energy checks allow drops,
never rises. Real contacts (normals, restitution, friction, other
bodies) are M6.

## Live stiffness

- **Force panel:** `clear_forces` and re-add the springs with the new `k`
  (M2's softening pattern).
- **Constraint panels:** `World::set_compliance(Compliance)` updates every
  constraint in place, except a held drag rod, so the slider doesn't
  reset the jelly.

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
