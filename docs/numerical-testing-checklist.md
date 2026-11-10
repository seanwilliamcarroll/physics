# Numerical Testing Checklist — Physics Engine

A per-subsystem test plan for numerical code, written with a 2D rigid-body engine in Rust in mind. Counts are **targets for a mature subsystem**, not hard rules: one "test" means one `#[test]` function (a `proptest!` block counts as one test, regardless of how many cases it generates). Where a count says "per X", multiply by however many X your engine has.

**Legend for test styles**

| Code | Style | Main crates/tools |
|---|---|---|
| AN | Analytic solution with tolerances | `approx`, `float-cmp` |
| INV | Conservation / invariants | — |
| CONV | Convergence order | — |
| PROP | Property-based | `proptest` |
| DIFF | Differential (fast vs reference) | — |
| GOLD | Golden / snapshot regression | `insta` |
| FUZZ | Fuzzing degenerate inputs | `cargo-fuzz` |
| SCEN | Scenario / behavioral | — |

---

## 0. Prerequisites (do these first)

Most tests below are only meaningful if the step function is deterministic.

- [ ] Fixed timestep; no wall-clock time anywhere inside `step()`
- [ ] All randomness comes from a seeded RNG passed in explicitly
- [ ] Stable iteration order (no iterating a `HashMap`/`HashSet` in the solver or broadphase output; use `Vec`, `BTreeMap`, or sort)
- [ ] Shared tolerance helpers defined once (e.g. `assert_close!(a, b, rel = 1e-9, abs = 1e-12)`) so thresholds are consistent and greppable
- [ ] **1 determinism test:** run the same scene twice in one process, assert bit-identical state
- [ ] (Optional) **1 cross-target test:** native vs wasm output compared with a tolerance, not bit-exact

---

## 1. Coverage Matrix

Target test counts per category. `—` means the style doesn't meaningfully apply.

| Category | AN | INV | CONV | PROP | DIFF | GOLD | FUZZ | SCEN |
|---|---|---|---|---|---|---|---|---|
| Math primitives | 1 per op (~10–15) | — | — | 5–8 | — | — | 1 | — |
| Mass properties | 1 per shape | — | — | 2–3 | 1 | — | — | — |
| Integrator | 3 per integrator | 2 per integrator | 2 per integrator | 2 | — | 1 | 1 | — |
| Broadphase | 2–3 | — | — | 3 | 3 | — | 1 | — |
| Narrowphase | 3 per shape pair | — | — | 3 per shape pair | 1 per shape pair | — | 1 per shape pair | — |
| Contact solver | 2–3 | 3 | — | 2–3 | — | 2 | 1 | 3–5 |
| Joints / constraints | 1 per joint type | 1 per joint type | — | 1 per joint type | — | 1 | — | 1 per joint type |
| Sleeping & CCD | — | — | — | 1 | — | — | 1 | 3–4 |
| World / public API | — | — | — | 1 | 1 | 2–3 | 1 | — |

---

## 2. Per-Category Checklists

### 2.1 Math primitives (vectors, rotations, matrices)

- [ ] **AN — 1 per operation (~10–15):** dot, cross (2D scalar), length, normalize, rotate, perp, lerp, mat-vec, inverse, transform/inverse-transform round-trip
- [ ] **PROP — 5–8:**
  - [ ] rotation preserves length
  - [ ] `normalize(v)` has length 1 for non-tiny `v`
  - [ ] `transform ∘ inverse ≈ identity`
  - [ ] dot is commutative; cross is anti-commutative
  - [ ] `rotate(a) ∘ rotate(b) ≈ rotate(a + b)`
- [ ] **FUZZ — 1:** zero, subnormal, huge, and NaN/inf inputs; assert documented behavior (e.g. `normalize(0)` returns `None` or a defined fallback, never NaN)

### 2.2 Mass properties (area, mass, inertia, center of mass)

- [ ] **AN — 1 per shape:** circle, box, capsule, convex polygon against textbook formulas
- [ ] **PROP — 2–3:**
  - [ ] translating a polygon's vertices doesn't change mass or inertia about its centroid
  - [ ] parallel axis theorem holds
  - [ ] vertex winding / starting vertex doesn't change results
- [ ] **DIFF — 1:** general polygon inertia routine vs analytic box/regular-polygon formula

### 2.3 Integrator

Applies to each integrator you ship (e.g. semi-implicit Euler, Verlet, RK4).

- [ ] **AN — 3 per integrator:** constant velocity (exact), free fall under gravity, harmonic oscillator over one period
- [ ] **INV — 2 per integrator:**
  - [ ] linear momentum constant with no external force
  - [ ] energy behavior matches the method (bounded oscillation for symplectic; document expected drift for others)
- [ ] **CONV — 2 per integrator:** halve `dt` repeatedly (e.g. 4 levels), assert error ratio ≈ 2^p for position and for velocity, within ±0.3 of the expected order
- [ ] **PROP — 2:** no NaN/inf for bounded inputs; zero force + zero velocity leaves state unchanged
- [ ] **GOLD — 1:** fixed scene state after N steps
- [ ] **FUZZ — 1:** `dt = 0`, tiny `dt`, very large `dt`, huge velocities

### 2.4 Broadphase

- [ ] **AN — 2–3:** hand-built cases: two overlapping AABBs, two touching at an edge, two clearly separate
- [ ] **DIFF — 3:** pair set vs O(n²) brute force must match **exactly** for:
  - [ ] uniform random distribution
  - [ ] heavily clustered bodies
  - [ ] mixed tiny and huge bodies (spans many grid cells / tree levels)
- [ ] **PROP — 3:**
  - [ ] insertion order doesn't change the (sorted) pair set
  - [ ] translating the whole scene doesn't change the pair set
  - [ ] each pair reported once, never `(a, a)`
- [ ] **FUZZ — 1:** zero-size AABBs, coincident bodies, coordinates near float limits

### 2.5 Narrowphase (collision detection)

Applies to each supported shape pair (circle–circle, circle–polygon, polygon–polygon, …).

- [ ] **AN — 3 per pair:** separated (no contact), exactly touching, overlapping with known normal and depth
- [ ] **PROP — 3 per pair:**
  - [ ] swapping A and B flips the normal and keeps the depth
  - [ ] rigid translation/rotation of both shapes transforms the contact accordingly
  - [ ] depth ≥ 0 and normal has unit length whenever a contact is reported
- [ ] **DIFF — 1 per pair:** e.g. SAT vs GJK/EPA, or polygon-approximated circle vs exact circle (with tolerance)
- [ ] **FUZZ — 1 per pair:** coincident centers, degenerate/collinear polygons, zero-radius circles

### 2.6 Contact solver

- [ ] **AN — 2–3:** 1D elastic collision (velocities swap for equal mass), perfectly inelastic collision, block on a slope slides iff `tan θ > μ`
- [ ] **INV — 3:**
  - [ ] linear momentum conserved across a collision
  - [ ] angular momentum conserved across a collision (no external torque)
  - [ ] kinetic energy never increases for restitution ≤ 1
- [ ] **PROP — 2–3:** no NaN; penetration ≤ slop after K steps; body order doesn't affect result beyond tolerance
- [ ] **GOLD — 2:** a small stack and a multi-body pile after N steps
- [ ] **FUZZ — 1:** extreme mass ratios (1:10⁶), zero mass, infinite (static) mass on both sides
- [ ] **SCEN — 3–5:**
  - [ ] box stack (5–10 high) comes to rest without drift
  - [ ] pyramid stays standing for M seconds
  - [ ] resting body on ground has near-zero jitter
  - [ ] Newton's cradle transfers momentum end-to-end
  - [ ] friction holds a box on a shallow ramp

### 2.7 Joints / constraints (if applicable)

- [ ] **AN — 1 per joint type:** e.g. pendulum period for a distance/revolute joint (small angle)
- [ ] **INV — 1 per joint type:** constraint error stays below a bound over N steps
- [ ] **PROP — 1 per joint type:** constraint satisfied after solve for random initial states
- [ ] **GOLD — 1:** a chain/ragdoll after N steps
- [ ] **SCEN — 1 per joint type:** e.g. chain hangs straight, hinge door swings and settles

### 2.8 Sleeping & continuous collision detection

- [ ] **PROP — 1:** a sleeping body woken by contact gets the same result as one never asleep (within tolerance)
- [ ] **FUZZ — 1:** very fast bodies, very thin walls
- [ ] **SCEN — 3–4:**
  - [ ] resting bodies fall asleep within T seconds
  - [ ] sleeping body wakes when hit
  - [ ] fast bullet doesn't tunnel through a thin wall
  - [ ] fast body vs fast body doesn't tunnel

### 2.9 World / public API (including wasm boundary)

- [ ] **PROP — 1:** add/remove bodies in random order; world never panics or produces NaN
- [ ] **DIFF — 1:** native vs wasm build on the same scene (tolerance compare)
- [ ] **GOLD — 2–3:** representative demo scenes from the website
- [ ] **FUZZ — 1:** random sequences of API calls (add, remove, set velocity, step)

---

## 3. Running Strategy

- [ ] **Every commit (`cargo test`):** AN, INV, PROP (default case count), DIFF, GOLD, small SCEN
- [ ] **Nightly / pre-release:** CONV with fine `dt` levels, PROP with high case counts (`PROPTEST_CASES=10000`), long SCEN runs, FUZZ for a fixed time budget
- [ ] Mark slow tests `#[ignore]` and run them with `cargo test -- --ignored`
- [ ] Golden snapshots regenerated deliberately (`cargo insta review`), never blindly accepted
- [ ] Each tolerance has a comment explaining where the number came from
