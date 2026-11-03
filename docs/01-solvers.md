# 01 — Solver Families: Impulse-Based vs XPBD

Status: **Draft — tutorial + decision record**
Depends on: `00-scope.md`

## The shared problem

A constraint is a function of positions that should equal zero (equality)
or stay non-negative (inequality, e.g. contacts). For a pendulum bob at `x`
pinned at the origin with rod length `L`:

```
C(x)  = |x| - L          // position constraint
∇C(x) = n = x / |x|      // gradient: the rod direction
```

Every solver answers the same question each step: *given the unconstrained
motion, what correction along `∇C`, weighted by inverse mass `w = 1/m`,
restores the constraint?* Mass weighting means the correction never creates
net linear momentum, which is why both families conserve it for free.

The two families differ in **which level they fix: velocity or position**.

---

## Family A: Impulse-based (sequential impulses / PGS)

Lineage: Erin Catto's sequential impulses (Box2D), projected Gauss–Seidel.

Idea: differentiate the constraint and enforce it on **velocities**.

```
Ċ = ∇C · v = J v = 0
```

### One step

```
v += dt * a_ext                                // integrate forces
for iter in 0..N:                              // Gauss–Seidel over constraints
    for c in constraints:
        b   = (β / dt) * C                     // Baumgarte bias: pushes drift back
        λ   = -(J v + b) / (J W Jᵀ)            // impulse magnitude
        (contacts: clamp ACCUMULATED λ ≥ 0, friction |λ_t| ≤ μ λ_n)
        v  += W Jᵀ λ                           // apply impulse
x += dt * v                                    // integrate positions
```

For the pendulum, `J W Jᵀ = w`, so `λ = -(n·v + b) / w` and `v += w λ n`.
That just removes the radial velocity component.

### Why it drifts

Zeroing radial velocity is a *linearization*. The bob then moves in a
straight line tangent to the circle, which lands slightly outside it.
Each step the rod stretches a bit. The Baumgarte term `β` feeds position
error back into velocity, but it's a tuning knob: too low → stretch,
too high → jitter and injected energy.

### Strengths

- Restitution and friction are natural, because they *are* velocity rules
  (`v_n' = -e v_n`, Coulomb cone on tangential impulse).
- Warm starting (reuse last frame's λ) makes stacks converge fast.
- Well understood energy behavior, especially when substepped.

---

## Family B: XPBD (extended position-based dynamics)

Lineage: Müller et al. PBD (2006/2007), Macklin et al. XPBD (2016),
"Small Steps in Physics Simulation" (2019), Müller et al. rigid-body XPBD (2020).

Idea: predict positions, then **project** them back onto the constraint.
Velocities are *derived* from how far positions moved.

### One substep (h = dt / n_sub)

```
v += h * a_ext
x_prev = x
x += h * v                                     // predict
for c in constraints:                          // usually 1 iteration with substeps
    α̃  = α / h²                                // compliance (α = 1/stiffness)
    Δλ  = (-C - α̃ λ) / (w_sum + α̃)
    x  += W ∇Cᵀ Δλ                             // project
v = (x - x_prev) / h                           // derive velocity
(velocity pass: restitution & dynamic friction for contacts)
```

For the pendulum, `α = 0` (rigid rod) and λ resets each substep, so
`Δλ = -C / w`. The bob is moved straight back onto the circle.

### The "X"

Plain PBD's stiffness depended on iteration count and timestep. XPBD's
compliance `α` is a physical quantity (inverse stiffness). Set `α = 1/k` and
you get a spring of stiffness `k` regardless of `n_sub`. **Rigid rods and soft
springs become the same code path**, which matters for our spring–mass demo.

### Strengths

- Position constraints hold exactly after each projection. No drift, no
  Baumgarte tuning.
- Unconditionally stable for very stiff springs where force-based springs explode.
- Simple to implement; one loop handles rods, springs, pins, contacts.

---

## Worked comparison: measured

Script: one pendulum, `L = 1 m`, `m = 1 kg`, released horizontal from rest,
simulated 10 s at a 60 Hz frame rate. Total swing energy is 9.81 J.

| Solver | Max rod-length error | Energy lost over 10 s |
|---|---|---|
| Impulse, no Baumgarte (β = 0) | **47 cm** | 8.4 J (meaningless: rod stretched) |
| Impulse, β = 0.2 | 1.3 cm | 0.98 J |
| Impulse, β = 0.2, 20 substeps | 0.03 mm | **0.005 J** |
| XPBD, 1 substep | ~0 (float eps) | 8.8 J (nearly stopped) |
| XPBD, 20 substeps | ~0 | 1.46 J |
| XPBD, 100 substeps | ~0 | 0.31 J |

Reproduced by the engine in M3, row for row (`06-constraints.md`, "As
built"; `tests/solver_table.rs`), plus one thing this script couldn't
show: in f32, XPBD with many substeps derives noisy velocities.

Takeaways:

1. **XPBD always satisfies the constraint**; the impulse solver only does so
   with stabilization and/or substeps.
2. **XPBD dissipates energy** through projection. This acts like numerical
   damping, shrinking as `h` shrinks. For a single pendulum, a substepped
   impulse solver preserves energy far better.
3. **Substepping is the great equalizer.** Small steps fix most problems in
   both families. Catto's Solver2D comparison (2024) reached a similar
   conclusion and Box2D v3 adopted a substepped soft-constraint solver.

A single pendulum is the easy case. Chains, high mass ratios (light links
holding a heavy bob), and stacks are where the families diverge further.
That's what the side-by-side demos are for.

---

## Side-by-side demos (planned)

Same scene, same `dt`, two solvers, rendered next to each other with live plots.

| Demo | What it reveals | Plot |
|---|---|---|
| Pendulum, β slider | Drift vs Baumgarte tuning vs exact projection | Rod-length error |
| Long-time pendulum | Energy loss vs substep count | Total energy vs time |
| Heavy bob on light chain (1:100) | Chain stretching / rubberiness | Max link error |
| Very stiff spring | Force-based explodes; XPBD stays stable | Spring length |
| Newton's cradle | Sequential handling of simultaneous contacts | Ball velocities |
| Billiards break | Tunneling vs substep count | Tunneling events |

A force-based explicit spring is a useful third baseline for the stiff-spring demo.

## Implications for the type design

To run both, the solver must be pluggable over a shared world:

- **Shared:** body storage, shapes, force generators, collision detection,
  contact generation, constraint *definitions* (`C`, `∇C`, compliance).
- **Per-solver:** the stepping loop and per-constraint state (impulse solver
  keeps accumulated λ for warm starting and clamping; XPBD keeps λ per substep).

Sketch of the seam (to refine in `02-core-types.md`):

```rust
pub trait Solver {
    fn step(&mut self, world: &mut World, dt: f64);
}
```

Constraints should describe *geometry* (evaluate `C` and `∇C`), not *how to
resolve it*. That keeps them reusable across solvers.

## Decision

**Implement both.** XPBD as the primary path for constraints and springs,
substepped sequential impulses as the comparison baseline. Contacts in both.
Revisit after the chain and billiards demos.

## References

Full entries in `references.md`.

- Catto, *Fast and Simple Physics using Sequential Impulses*, GDC 2006 —
  https://box2d.org/files/ErinCatto_SequentialImpulses_GDC2006.pdf
- Catto, *Solver2D*, 2024 — https://box2d.org/posts/2024/02/solver2d/
- Müller et al., *Position Based Dynamics*, VRIPHYS 2006 / JVCIR 2007 —
  https://diglib.eg.org/items/deb0a7a1-2ddf-496f-889a-fe0df1feeb73
- Macklin, Müller, Chentanez, *XPBD*, MIG 2016 —
  https://matthias-research.github.io/pages/publications/XPBD.pdf
- Macklin et al., *Small Steps in Physics Simulation*, SCA 2019 —
  https://diglib.eg.org/handle/10.1145/3309486-3340247
- Müller et al., *Detailed Rigid Body Simulation with XPBD*, SCA 2020 —
  https://matthias-research.github.io/pages/publications/PBDBodies.pdf
