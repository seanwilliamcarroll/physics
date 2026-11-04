# 08 — Collision

Status: **Adopted** (M6.1). Depends on `06-constraints.md` (both solvers,
warm starting, split impulses) and `07-soft-bodies.md` (the ground clamp,
which M6 doesn't replace).

M6's showcase is momentum exchange: circles that collide, elastic to
inelastic, in both solvers; and Newton's cradle, where a sequential solver
has to pass one impact through four simultaneous contacts. This doc fixes
the pieces: shapes, walls, who steps, contact generation (broad and
narrow), the contact constraint in each solver, restitution, and what the
tests and pages measure.

## What's conserved, and where

Collisions exchange momentum between bodies, so **total momentum is
conserved only when nothing outside pushes**: no gravity and no walls.
A box's walls push the balls back, so a box of balls' momentum is *not*
flat, and isn't supposed to be. (The roadmap's first "done when" said it
was; corrected in `TASKS.md`, decision 1.) So:

- **Momentum** is checked in a wall-free, gravity-free scene: a cue ball
  fired into a cluster. Contact impulses are equal and opposite, so it's
  flat to rounding in both solvers.
- **Energy** is checked in the box (walls do no work on an elastic bounce):
  flat at `e = 1` up to what a sequential solver loses on simultaneous
  contacts (measured), falling below it as `e` drops.

## Shapes

**Circles are particles with a radius.** `Particles` gains a `radius`
column (SoA, like `inv_mass`); `0` means a point that never collides, so
every existing scene, and its golden hash, is unchanged. No rotation: a
frictionless circle's contact force passes through its center, so it can't
spin. (M7's friction decides whether balls need angular state.)

**Walls are static half-planes**, `{ normal: UnitVec2, offset }`: the
solid side is `n · x < offset`, and a circle touches it when
`n · x − offset < r`. Held by the `World`, not as particles: a wall has no
position, mass, or velocity.

The M5 ground clamp stays as it is (the jelly and its goldens use it). It
isn't a contact: it moves particles up after the step and removes their
downward velocity, with no restitution and no solver involvement.

## Who steps

Since M3 the solver steps a world only when it has constraints. A box of
balls has none, so: **the solver steps when the world has constraints,
walls, or any particle with a radius** (`World::collides`). Otherwise the
integrator does, exactly as before.

## Contact generation

Every substep, at the start (positions where the substep begins):

1. **Broadphase** (`collision/broadphase.rs`): a uniform grid. Cell size
   is the largest diameter plus the speculative margin (below), so any
   pair that can touch this substep sits in the same or neighboring
   cells. Each circle goes in its center's cell; each cell is checked
   against itself and four of its eight neighbors (so each pair once).
   Candidate pairs are sorted `(a, b)` with `a < b`, so the output is
   deterministic. Walls are few (four for a box) and checked directly.
2. **Narrowphase** (`collision/narrowphase.rs`): for a candidate pair,
   `d = x_b − x_a`, gap `C = |d| − (r_a + r_b)`, normal `n = d / |d|`.
   A contact is kept when the gap is smaller than the distance the pair
   can close this substep: `C < max(0, −n · (v_b − v_a)) h` (the
   speculative margin, at least touching). Coincident centers have no
   normal (`length_and_direction` is `None`); they get a fixed fallback,
   `+x`, so they separate deterministically rather than stay stuck.

```
Contact { a, b: Body (Particle(id) | Wall(index)), n: UnitVec2, gap C }
```

Contacts live for one substep. Detecting every substep is the simple,
correct choice; detecting once per step with a margin (Macklin et al.
2019) is an optimization to measure if the box gets large.

**Broadphase correctness is a property test:** for random circles, the
grid's pairs are a *superset* of the brute-force `O(n²)` overlapping
pairs. Missing a pair is a bug; extra pairs only cost time.

## The contact constraint

The same distance function as a rod, but one-sided:

```
C = |x_b − x_a| − (r_a + r_b) ≥ 0           (pair)
C = n · x_a − offset − r_a ≥ 0               (wall; the wall doesn't move)
```

A rod pushes and pulls; a contact only pushes. In each solver that's one
change: **the multiplier can't go negative** (no pulling).

### XPBD

In the same passes as the rods (rods first, then contacts, each pass):

```
C = gap at the current positions (recomputed every projection)
if C < 0:  Δλ = −C / (w_a + w_b),  λ += Δλ
           x_a −= w_a n Δλ,  x_b += w_b n Δλ
```

Rigid (`α = 0`); a contact's λ only grows, since a correction is applied
only while overlapping. Then velocities are derived as before, followed by
the **velocity pass** (Müller et al. 2020, below).

### Sequential impulses

A contact's λ is the impulse it has applied this substep, **clamped as an
accumulated total, never per update** (Catto 2006):

```
v_n   = n · (v_b − v_a)                       (> 0: separating)
Δλ    = −(v_n − v_target) / (w_a + w_b)
λ_new = max(λ + Δλ, 0);  Δλ = λ_new − λ;  λ = λ_new
v_a −= w_a n Δλ,  v_b += w_b n Δλ
```

Clamping each `Δλ` at ≥ 0 instead would forbid an iteration from taking
back an earlier pass's overshoot; with several contacts per body (a
stack, the cradle) the overshoot then stays, and bodies jitter and
separate. Clamping the total lets a pass reduce the impulse, as long as
the contact never pulls.

**The target velocity** during the iterations:

- **Speculative** (`C > 0`): the pair may close by at most the gap this
  substep, `v_target = −C / h`. A pair that won't reach each other gets no
  impulse at all (the clamp keeps it at 0).
- **Touching or penetrating** (`C ≤ 0`): `v_target = 0`. With split
  impulses (the default, M4) the position error goes to the
  pseudo-velocity, `(β / h) · min(C + slop, 0)`, discarded after moving
  positions. A small **slop** (a fraction of a millimeter) lets resting
  contacts stay barely overlapping instead of flickering in and out.
  Classic Baumgarte stays selectable; it pushes the error into the real
  velocity, so balls pop out of each other with extra energy.

**Restitution is a separate pass after the iterations** (as Box2D v3
does), not part of the target: per contact that applied an impulse
(`λ > 0`) and was approaching at `v_n⁻ < 0` (its normal velocity recorded
*before* the solve), solve once more for `v_target = −e · v_n⁻`, with the
same accumulated clamp. It has to be separate because of the speculative
contact: it stops a ball *exactly* at the surface, so on the next substep
the approach speed is already ~0, and a rule that looked at "the approach
speed now" would never see the impact. Recording `v_n⁻` before the
solve, in the substep where the impulse fires, keeps it. This is the
same shape as XPBD's velocity pass below, so both solvers end with a
restitution pass over the contacts that were active.

**Warm starting** contacts: a contact's λ from the previous substep is
matched by its `(a, b)` and applied first, as rigid rods are (M4/M5).
New contacts start at 0. That's what lets a stack hold with one
iteration.

### Restitution in XPBD: the velocity pass

XPBD's derived velocity `(x − x_prev) / h` is what's left after the
position correction: inelastic. Müller et al. (2020) restore the bounce
with a velocity pass after the derive, per contact that was active:

```
v_n   = n · (v_b − v_a)        (after the derive)
v_n⁻  = n · (v_b − v_a)        (at the start of the substep)
Δv    = −v_n + max(−e v_n⁻, 0)
v_a −= w_a / (w_a + w_b) · n Δv,  v_b += w_b / (w_a + w_b) · n Δv
```

### The resting threshold, in both

At rest, gravity makes every resting contact approach at `g h` per
substep, and restitution would bounce it back, forever. Both solvers use
`e = 0` when the approach speed is below `2 |g| h` (Müller et al. 2020's
threshold), so resting balls settle.

## `Restitution`

A new parameter type, `Restitution<S>`, `e ∈ [0, 1]` (`checked_param!`):
0 is perfectly inelastic, 1 elastic. NaN and values outside are rejected
(above 1 a collision would add energy). One per world in M6; M7 may make
it per pair.

## Newton's cradle

Five balls on rigid rods (M3's `DistanceConstraint`), pins spaced one
diameter apart, so neighbors just touch at rest (`C = 0`). Pull the first
ball back and release: an ideal cradle swings exactly one ball out on the
far side.

A sequential solver visits the four contacts one at a time. Whether the
impulse passes cleanly through the row in one pass depends on the order
and the number of iterations, so with one pass several balls may swing
out together, and more iterations or substeps get closer to the ideal.
The tests **record** what each solver does (how many balls leave, how much
energy reaches the last ball) rather than demand the ideal, as M4 did for
chains; the page shows both solvers side by side with an iterations
slider.

## Pages

- **`m6-collisions`**: the box (restitution, ball count, the broadphase
  overlay of grid cells and candidate pairs, an energy plot) and the
  free-space break (a momentum plot).
- **`m6-cradle`**: the cradle, XPBD and impulse side by side.

## Tests

- Head-on elastic collision of unequal masses matches the analytic final
  velocities; `e = 0` makes them move together.
- Momentum conserved through collisions (free space, both solvers).
- No penetration beyond tolerance at rest (a ball resting on a wall,
  balls stacked).
- Energy in the box: flat at `e = 1` within a measured bound, decreasing
  for `e < 1`, never increasing.
- Broadphase: superset of brute force (proptest); deterministic order.
- Goldens for each new scene, native and wasm.

## Out of scope

Friction, cushions (segments), pockets, the cue (M7); tunneling
measurement (M7: M6's speeds stay well under a radius per substep);
rotation, polygons, continuous collision detection (deferred).

## References

Full entries in `references.md`.

- Catto (2006), *Fast and Simple Physics using Sequential Impulses*:
  accumulated impulses, clamping the total, warm starting.
- Müller, Macklin, Chentanez, Jeschke, Kim (2020), *Detailed Rigid Body
  Simulation with Extended Position Based Dynamics*: contacts in XPBD,
  the velocity pass for restitution, the resting threshold.
- Macklin et al. (2019), *Small Steps in Physics Simulation*: substeps
  over iterations; detecting collisions once per step.
