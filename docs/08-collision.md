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

**At the moment of impact (M7.2).** The normal found at the start of a
substep is up to a substep's travel early, and on a glancing hit it's
still turning as the gap closes. Cut shots went 1–8° off at 10
substeps, and a graze whose start-of-substep normal *looked* closing was
bounced a substep early (an 80° cut left at 60°). Now every separated
contact is moved to where the pair first touches, moving in straight
lines (a quadratic for two circles, conservative advancement for a
segment; `pair_impact` and `segment_impact` in `collision/narrowphase.rs`), and takes its
normal and gap there. A pair that doesn't touch this substep is dropped
unless it's within the margin. The test is also swept (a contact if
either test says so), so a graze can't slip between them. Cut shots now
leave within 1.5e-11° at 1–40 substeps (`tests/cushions.rs`). Head-on
hits and touching contacts are unchanged; M6's box and impulse cradle
goldens changed, and its other measurements by less than 0.0013.

Contacts live for one substep. Detecting every substep is the simple,
correct choice; detecting once per step with a margin (Macklin et al.
2019) is an optimization to measure if the box gets large.

**Broadphase correctness is a property test:** for random circles, the
grid's pairs are a *superset* of the brute-force `O(n²)` overlapping
pairs. Missing a pair is a bug; extra pairs only cost time.

**As built (M6.3,** `collision::candidate_pairs`**):** a *sorted cell list*
rather than a dense array of cells. Each circle's cell
`(⌊x/cell⌋, ⌊y/cell⌋)` is sorted, runs of equal cells are the occupied
cells, and a neighbor's run is found in that list (first by binary
search; since the health pass by cursors, below). Memory follows the
number of circles, not the area they span (one runaway particle can't
blow up a dense grid), and the sort makes the output order deterministic
for free. Cost (`cargo bench -p engine --bench step -- broadphase`, f64,
lattice of nearly touching 5 cm circles, Apple silicon): 12.6 µs at 128
circles, 158 µs at 1,024, 802 µs at 4,096; about N log N (the sort).
M6.11 sorts through the engine's one key type to save `.wasm` size
(`03-wasm-shell.md`), at 13.8, 175 and 908 µs. Profiling then found
over half of that in the binary searches for neighbor cells; cursors
that follow the visiting order replaced them (`profiling.md`, "Fixed"):
6.2, 65 and 303 µs, of which the final pair sort is now over half. Once
per substep, so a few hundred balls at 10 substeps stay well under a
millisecond a frame. It allocates its key list per call; reusing a buffer
is the first optimization if it ever shows up in a profile.

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
n     = the contact's current normal
v_n   = n · (v_b − v_a)        (after the derive)
v_n⁻  = n · (v̄_b − v̄_a)       (v̄: saved before the solve, after the kick)
Δv    = −v_n + max(−e v_n⁻, 0)
v_a −= w_a / (w_a + w_b) · n Δv,  v_b += w_b / (w_a + w_b) · n Δv
```

Both normal velocities are measured along the **same, current** normal.

**Since M6.7 the pass runs at `e = 0`:** bouncing is the impact stage's
(below, "Simultaneous impacts"). What still pushes in the projection is
resting, or approached too slowly to bounce, and the pass only removes
the separation the projection leaves behind, so stacks stay at rest.

### The resting threshold, in both

At rest, gravity makes every resting contact approach at `g h` per
substep, and restitution would bounce it back, forever. Both solvers use
`e = 0` when the approach speed is below `2 |g| h` (Müller et al. 2020's
threshold), so resting balls settle. **As built:** `2 |a_b − a_a| h`, the
contact's relative acceleration from the forces: the same as `2 |g| h`
against a wall, but it needs no knowledge of which force is gravity
(forces are opaque `dyn Force`), and two balls falling together get 0.

### As built (M6.5, XPBD; `tests/contacts.rs`)

Analytic head-on (1 kg at +1 m/s into 3 kg at −1 m/s): `v₁′ = −2`,
`v₂′ = 0` to 1e-13 at `e = 1`, both at −0.5 m/s at `e = 0`. A dropped ball
bounces to `e² h` (0.49932 of 0.5 m at `e = 1`, sampled per frame) and
never enters the floor: the speculative contact catches it a substep
early. Momentum through a six-ball pileup: drift 1.6e-13. Two findings:

- **Measure `v_n⁻` along the current normal.** The first version took it
  along the normal from when the contact was found, and applied the
  bounce along the current one. In a glancing hit those differ by an
  angle proportional to `h`, so every elastic glancing collision *gained*
  energy: +1.4% over the pileup at 10 substeps, +0.35% at 40, +0.14% at
  100; iterations didn't matter, head-on hits were exact. Saving the
  pre-solve velocities and projecting them on the current normal, as
  Müller et al. do, makes the largest step-to-step rise 2e-13 J
  (rounding) at every `e`.
- **A contact margin.** A ball resting on another has a gap of ~0 and no
  approach speed (both fall at the same rate), so the speculative test
  said "no contact". During that substep the lower ball is held up while
  the upper one falls, so they overlap by `g h²`, get pushed apart,
  separate by a hair, and miss each other again: stacks of three or more
  jittered forever (six balls at ~5 cm/s, with more iterations only
  delaying it). `CONTACT_MARGIN` = 1 mm keeps near neighbors as contacts;
  every stack measured settles to exactly zero velocity, overlap 0.11 mm.
  The broadphase cell grows by the margin, so its superset guarantee
  holds.

### As built (M6.6, impulse; `tests/contacts.rs`)

The same tests pass on both solvers: head-on exact (`v₁′ = −2.0`,
`v₂′ = −1e-16`), momentum through the pileup 1.6e-16, the pileup's energy
flat at `e = 1` (largest rise 9e-16 J), a stack at rest, `e²` bounces.
A crowded box (9 balls, three walls, gravity, `e = 1`, 20 s) found two
orderings that matter, and one limit:

- **Restitute after positions move** (`Box2D` v3's order). Before the
  drift, the ball rebounded from where it started the impact substep,
  never travelling the gap to the surface: a dropped ball bounced 2%
  above its release height, and the box *gained* 26% in 20 s at 10
  substeps. After it, a lone bounce is energy-neutral (0.49932 of
  0.5 m, within the per-frame sampling of the apex), the same as XPBD.
- **Remember impulses before restituting.** A bounced pair usually
  stays inside `CONTACT_MARGIN` for the next substep, so warm-starting
  with the bounce impulse re-applied the bounce; on a ball with a second
  contact (against a wall) one pass can't take it back. Step-to-step
  energy rises over 20 s dropped from 14 J to 4 J.
- **Chain impacts lose energy, in both solvers.** A ball landing on balls
  that rest on the floor: the iterations treat every contact as
  inelastic, then the restitution pass bounces each contact by its *own*
  approach speed before the solve, and the resting floor contact's was
  ~0 (under the resting threshold). The impact pushed down the chain is
  absorbed: one step lost 3.8 J. It's Newton's cradle with a floor, the
  same mechanism the cradle panel shows, and `Box2D`'s single restitution
  pass shares it. As balls lose height more of them rest, so the loss
  accelerates. Measured, box energy after 20 s at `e = 1`:

  | substeps | XPBD | impulse |
  |---|---|---|
  | 10 | −41% | −30% |
  | 40 | −15% | −17% |
  | 100 | −1.3% | −1.2% |

  Accepted as measured (your call): the box shows it, linked to the
  cradle. The remaining small rises (4 J at 10 substeps, 0.4 J at 100,
  in both) are the same simultaneous contacts, run the other way.

**Tried and reverted: a time-of-impact correction.** After a bounce,
push the pair apart by what it would have rebounded since the moment of
impact, `e (|v_in| h − gap₀)`. It overshot a lone bounce (0.50404 m,
+0.8%: the bounce was already neutral, since being late at the surface
only delays the ball, and the push adds height on top), tripled the
rises (11 J), and made the box erratic (−47% at 40 substeps, −15% at
100): a push of a few millimeters in a crowd makes new overlaps. The
hypothesis behind it, that the box's loss came from where the ball sits
after a bounce, was wrong; the chain impacts above are the loss.

### Simultaneous impacts: the impact stage (M6.7, impulse; `tests/impacts.rs`)

**Why.** Both solvers used *Newton's* rule: after the inelastic
iterations, each contact that pushed bounces by **its own** approach
speed, recorded before the solve, one contact at a time. With
simultaneous contacts that fails both ways (`e = 1`, 10 substeps):

| scene | XPBD KE kept | impulse KE kept |
|---|---|---|
| one ball hits two (2 mm apart) | 116% | 116% |
| break, touching rack | 18% | 62% |
| break, 2 mm gaps | 134% | 136% |
| cradle, swing / pull (ideal `[0, 0, 0, 0, 1]`) | `[0, .22, .27, .30, .30]` | `[0, .01, .34, .43, .43]` |

- **A touching row loses:** its contacts were at rest before the solve,
  so they get no bounce, though the impact passes through them.
- **One ball hitting two gains:** each contact gives a full bounce of its
  own.
- **A joint solve alone wouldn't fix it.** Solved together with Newton's
  targets (the global LCP), energy is kept but the cradle sticks: ball 1
  rebounds and balls 2–5 leave together. The order of the hits is
  missing.

**The impact stage, Generalized Reflections** (Smith, Kaufman, Vouga,
Tamstorf & Grinspun 2012). It runs before the iterations, on the
velocities as they arrive, in rounds:

```
V ← the contacts approaching now (faster than the resting speed) that
    close this substep
if V is empty: done
λ̃ ← V's inelastic impulses, solved jointly (projected Gauss–Seidel
    over V alone, to convergence)
add e λ̃: in all (1 + e) λ̃, V's approach reflected, scaled by e
```

- **The cradle propagates.** Round 1 has only contact 1–2, so balls 1 and
  2 swap; round 2 has 2–3; and so on.
- **One ball hitting two** is one round of two contacts, solved together.
- **Then the iterations,** inelastic as before, hold the resting contacts
  and stacks: their approach is under the resting speed, so they're never
  in V.
- **The restitution pass is gone.** Impact impulses are never remembered
  for the warm start.
- **Caps:** at most `4n` rounds for `n` contacts (and 100), and 100 sweeps
  per round (or until the largest change is 1e-12 of the largest
  impulse). With `e < 1`, propagation can shrink geometrically without
  ending (the paper's *inelastic collapse*); what's left past the cap,
  the iterations treat inelastically.

**Where in the substep: between two half kicks.** A falling ball that
lands at fraction τ of a substep ends it at `v − g h (1 − 2τ)`. Where the
stage sits fixes τ:

| Stage position | Implied τ | Effect |
|---|---|---|
| After the whole kick | 1 | Gains `g h` a bounce: a lone bounce rose 2% above its drop |
| Before the kick | 0 | Loses it: −0.86% a bounce, and the box lost a third of its energy in 20 s |
| **Between two half kicks** | **½** | **Unbiased:** each bounce is off by `g h (τ − ½)`, which averages out |

A contact belongs in V if it closes this substep *after* the second half
kick (`gap + (v_n + ½ h n·Δa) h ≤ 0`). Otherwise the iterations' speculative
stop would catch it at the surface, with no bounce left. Worlds that
don't collide keep the whole kick, unchanged.

**Measured** (impulse, `e = 1`, 10 substeps):

| scene | before | after |
|---|---|---|
| one ball hits two (0, 2 mm, 1 cm) | 1.14–1.25 | 1 ± 5e-14 |
| break (touching, 2 mm, 1 cm), 2 s | 0.62–1.36 | 1 ± 2e-13; momentum 1e-15 |
| cradle, swing / pull | `[0, .01, .34, .43, .43]` | `[0, 3e-8, 1e-8, 5e-5, 0.998]` |
| box (20 balls, gravity, walls), 20 s | 0.50 | 1.0011 (40 substeps: 1.0001; 100: 1.0000) |

Every earlier contact test still passes: the analytic head-on, the `e²`
bounces, stacks at rest, momentum, the bullet, fast circles, 1:1e6.

**XPBD (M6.7b): the same stage, the same place.** It works on velocities
and needs only the contacts found at the start of the substep, so it
runs between XPBD's two half kicks, before predict, project and derive.
Contacts it bounced are separating, so they never overlap and never get
projected. The velocity pass stays, at `e = 0`. Measured (`e = 1`,
10 substeps):

| scene | before (Newton) | after |
|---|---|---|
| one ball hits two (0, 2 mm, 1 cm) | 1.14–1.24 | 1 ± 3e-13 |
| break (touching, 2 mm, 1 cm), 2 s | 0.18–1.34 | 1 ± 2e-13; momentum 6e-13 (as before: velocities derived from positions) |
| cradle, swing / pull | `[0, .22, .27, .30, .30]` | `[0, 0, 0, 0.003, 0.987]` (the rods' projection takes ~1.3%) |
| box (20 balls, gravity, walls), 20 s | 0.26 | 1.00007 |

The known failure (one ball hitting two) is gone from
`known_failures.rs`: both solvers keep its energy.

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

The plan was to record how far a sequential solver falls short: visiting
the four contacts one at a time, it would pass the impulse down the row
only partly per iteration. The impact stage (M6.7) changed that: it
passes the impulse down in rounds, to convergence, before the iterations
run, so a cradle swings one ball out in both solvers.

**As built** (`tests/impacts.rs`; the swing of each ball over the first
swing, as a fraction of the pull; ideal `[0, 0, 0, 0, 1]`):

| Substeps | XPBD, worst ball | Impulse, worst ball |
|---|---|---|
| 1 | 0.120 | 0.029 |
| 2 | 0.062 | 0.008 |
| 5 | 0.026 | 0.009 |
| 10 | 0.013 | 0.002 |
| 20 | 0.007 | 0.001 |
| 40 | 0.003 | 0.0006 |

- **Iterations don't matter** (1 vs 16: 1.8e-13 XPBD, 2.4e-8 impulse).
  Each ball hangs on its own rod, so there's nothing for Gauss–Seidel to
  pass between rods, and the impact stage converges on its own.
- **XPBD is first order in substeps** (error × n stays at 0.12–0.14). Its
  rods are projected positions, and the projection takes a share of the
  swing (ball 5 short, ball 4 nudged) that shrinks with h.
- **The impulse solver** is closer at every count but not monotone (2
  substeps beat 5).

The page's sliders are therefore substeps first; an iterations slider
would show nothing.

## Pages

- **`m6-collisions`**: the box (restitution, ball count, the broadphase
  overlay of grid cells and candidate pairs, an energy plot) and the
  free-space break (a momentum plot).
- **`m6-cradle`**: the cradle, XPBD and impulse side by side.

**As built (M6.10):** both pages show XPBD and impulse side by side.
`m6-collisions` switches between the box (plot: energy over its start)
and the break (plot: momentum drift, log scale), with restitution, ball
count, rack gap, substeps and rate; the broadphase overlay draws the
engine's own grid (`collision::broadphase_cell`, which depends on h and
the fastest ball) and the candidate pairs as lines. `m6-cradle` has balls,
pulled, substeps, restitution and rate, and an energy plot; no iterations
slider, since they change nothing (above). Balls can be grabbed on both.

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

**As built (M6.8):** the scenes' layouts (`scenarios/*/tests.rs`); the box
flat at `e = 1` (+0.11% over 20 s) and, at `e = 0.9, 0.5, 0`, never rising
between 2 s samples and settling at 0.255–0.259 of its start (balls at
rest); the break's energy and momentum, touching or not; the cradle by
iterations and substeps (above); goldens for the box, the break and the
cradle in both solvers (`tests/determinism.rs`, same on wasm32).

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
- Smith, Kaufman, Vouga, Tamstorf, Grinspun (2012), *Reflections on
  Simultaneous Impact*: Generalized Reflections, the impact stage.
