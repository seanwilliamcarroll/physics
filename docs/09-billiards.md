# 09 — Billiards

Status: **Adopted** (M7.1; as built: segments and per-contact
restitution M7.2, the cloth M7.3, the speculation switch and tunnel
counter M7.4, pockets M7.5, the table and its scenes M7.6, the web layer
M7.7, the page M7.8). Depends on `08-collision.md` (contacts,
speculative contacts, the impact stage).

M7 puts M6's contacts on a pool table: cushions, a cloth that makes a
ball slide and then roll, pockets, and a cue. The physics that's new is
the **ball model**: a ball on cloth carries spin, and spin is what makes a
stun shot stop dead, a follow shot roll through and a draw shot come back.
This doc fixes the ball model, the numbers, the cushions and pockets, and
two findings from planning: tunneling doesn't happen here, and restitution
per contact needs care in Generalized Reflections.

## Units and the table

SI throughout. The table is seen from above, so gravity is perpendicular
to the plane: there's **no in-plane gravity force**. `g` enters only
through the cloth (below).

| | Value | Source |
|---|---|---|
| Playing surface, 9-ft table | 2.54 × 1.27 m (±3.175 mm), inside the cushion noses | WPA, §5 |
| Ball diameter | 57.15 mm (±0.127 mm): `R = 0.028575` m | WPA, §16 |
| Ball mass | 156–170 g: **0.17 kg** (our choice, the upper end, as pooltool's 6 oz) | WPA, §16 |
| Corner pocket mouth | 114.3–117.5 mm, lip to lip; jaws cut at 142° | WPA, §9 |
| Side pocket mouth | 127.0–130.2 mm; jaws cut at 104° | WPA, §9 |
| Cushion nose height | 63.5% of the ball's diameter | WPA, §7 (not modelled: below) |
| Sliding friction, ball–cloth `μ_s` | **0.2** | Alciatore (secondary, below) |
| Rolling resistance `μ_r` | **0.01** | Alciatore (secondary) |
| Restitution, ball–ball `e_b` | **0.94** (measured range 0.90–0.96) | Alciatore (secondary) |
| Friction, ball–ball | ~0.06 (not modelled in M7) | Alciatore (secondary) |
| Restitution, ball–cushion `e_c` | **0.8**, our choice in a model-dependent range: 0.7 (Alciatore, a ball rolling into the rail), 0.85 (pooltool's default), 0.98 (Mathavan et al. 2010, under their cushion model) | as listed |
| `g` | 9.81 m/s² | |
| The fastest cue ball | **12 m/s**, our choice: above a hard break, the cue slider's top | |

**About the secondary values.** Dr. Dave Alciatore's typical-properties
page (Colorado State, `billiards.colostate.edu`) is the usual source, and
pooltool's defaults cite it. It refuses automated fetches, so the values
above come from his technical proofs as quoted in search results and from
pooltool's documented defaults, which agree. **To confirm by hand** before
they're relied on for more than a believable table. Mathavan et al. 2009
measured `μ_s` and `μ_r` with a high-speed camera, but the numbers are
behind the paywall; the abstract only says they were found.

## The ball model

### Spin without sidespin

A ball has a velocity `v = (v_x, v_y)` in the plane and an angular
velocity. Of its three components, the two about **horizontal** axes,
`ω = (ω_x, ω_y)`, are topspin and backspin: they set how the ball's
bottom moves over the cloth. The third, about the vertical axis (`ω_z`,
sidespin or "english"), only acts at cushions and in ball–ball throw,
through contact friction. M7 has neither (contact friction moved to
M10), so **`ω_z` is left out**. `00-scope.md`'s open question, answered: carry the horizontal
spin; the 2D view loses nothing it needs.

The moment of inertia of a solid sphere is `I = (2/5) m R²`.

### Slip

The ball touches the cloth at `r_c = −R ẑ` from its centre. That point
moves at

```text
u = v + ω × (−R ẑ) = (v_x − R ω_y,  v_y + R ω_x)
```

the **slip velocity**. A ball **rolls** when `u = 0` (`v_x = R ω_y`,
`v_y = −R ω_x`) and **slides** otherwise.

### Sliding: friction until it rolls

While sliding, the cloth pushes back with kinetic friction
`F = −μ_s m g û` (`û = u / |u|`), at the contact point. It slows the
centre, `dv/dt = −μ_s g û`, and its torque `τ = r_c × F = (R F_y, −R F_x)`
changes the spin, `dω/dt = τ / I`. Put together:

```text
du/dt = dv/dt + R (−dω_y/dt, dω_x/dt)
      = −μ_s g û − (R² / I) μ_s m g û
      = −(1 + 5/2) μ_s g û
      = −(7/2) μ_s g û
```

The slip shrinks **along a fixed direction** at a constant rate, and
reaches zero at

```text
t_s = 2 |u₀| / (7 μ_s g)
```

**A centre hit** (`ω₀ = 0`, so `u₀ = v₀`) slides in a straight line,
slowing at `μ_s g`, until `t_s`:

```text
v(t_s) = v₀ − μ_s g t_s = (5/7) v₀
s      = v₀ t_s − ½ μ_s g t_s² = 12 v₀² / (49 μ_s g)
```

At 3 m/s on `μ_s = 0.2`: it rolls after 0.44 s and 1.12 m, at 2.14 m/s.
These three numbers are M7.3's analytic tests.

In general, from any `(v₀, ω₀)`, the ball rolls off at `v = (5 v₀ + 2 R
(ω₀,y, −ω₀,x)) / 7`, the rolling velocity a frictionless push can't change
(its angular momentum about the contact point is conserved: friction acts
*at* that point).

### Rolling: resistance until it stops

A rolling ball loses speed to the cloth's deformation, modelled as
rolling resistance: `dv/dt = −μ_r g v̂`, with `ω` following `v` so it stays
rolling. It stops in finite time, `v / (μ_r g)`, after `v² / (2 μ_r g)`:
from 1 m/s, 10.2 s and 5.1 m (`μ_r = 0.01`). That's long, and real: the
WPA asks a firm centre-ball stroke to travel 4 to 4½ table lengths,
cushions included (§8). No "rest threshold" is needed. The
clamp that lands sliding exactly on rolling (below) lands rolling exactly
on rest.

### In the substep

The cloth acts in **the kicks**: `dv/dt` and `dω/dt` are applied with the
forces, in each half kick, so the impact stage still sees velocities as
they arrive (`08-collision.md`). A half kick of `h/2` changes `|u|` by
`(7/2) μ_s g h/2`. If that's more than `|u|`, the kick **stops exactly at
rolling**: it applies only the fraction that zeroes `u`, then rolls for
the rest. Same for rolling to rest. No overshoot, no chatter, and
`t_s` comes out right to within one substep.

Where it lives: a `Table` component on `World` (`μ_s`, `μ_r`, `g`, and a
spin per particle, aligned with the particles), off by default. Worlds
without one pay nothing.

### Energy

Kinetic energy includes rotation: `½ m |v|² + ½ I |ω|²`. A rolling ball
carries `(7/10) m |v|²`. Sliding friction and rolling resistance only
remove energy. Over a slide from a centre hit, the ball loses `2/7` of
its kinetic energy (`½ m v₀²` to `(7/10) m (5/7 v₀)² = (5/14) m v₀²`).
That's a test, and the page's energy readout includes the spin.

### The cue

The cue strikes the ball with an impulse `P` along the aim `d̂`, at a
height `b` above the centre. Linear: `m v = P`. Angular: the impulse acts
at `b ẑ` (plus a part along `d̂`, which exerts no torque), so `I ω = b P
(ẑ × d̂)`:

```text
v = (P/m) d̂,   ω = (5 b |v| / (2 R²)) (ẑ × d̂)
```

- `b = 0`: a **stun**. No spin; the ball slides, then rolls.
- `b = 2R/5`: **natural roll** from the start (`u = 0`), the classic
  result that a ball hit at 7/10 of its height rolls without sliding.
- `b > 0`: **follow**, `b < 0`: **draw**.

`|b| ≤ ½ R`: past that, a real cue miscues (the tip slips off). The page
limits the control there.

### Why stun, follow and draw emerge

A ball–ball contact in M7 is frictionless, so it changes the balls'
velocities along the line of centres and **never their spin**. On a
full hit at `e ≈ 1`, the cue ball's velocity passes to the object ball
and the cue ball keeps its spin:
- **stun** (no spin at impact, still sliding): it stops dead;
- **follow** (topspin): the cloth drives it forward again, to
  `(2/7) R |ω|`;
- **draw** (backspin): the cloth drives it back.

The object ball leaves with velocity and no spin: it slides, then rolls
at 5/7 of its speed. All of this falls out of the model, with no
special cases, and M7.3 tests each shot.

## Cushions

A cushion is a static **segment**: two endpoints, a restitution, and a
circle–segment narrowphase (closest point on the segment; past either
end, the endpoint itself, so ends behave as rounded corners). Pocket
jaws are segment ends. The cushions are laid out from the WPA mouths and
cut angles. Speculative like walls (`08-collision.md`).

**Not modelled:** the cushion nose sits at 63.5% of the ball's diameter,
above the centre, so a real cushion pushes slightly down and imparts spin
(Mathavan et al. 2010 analyse it). Our cushions push through the centre.
Cushion friction is left out with all contact friction (M10).

## Restitution per contact

Ball–ball and ball–cushion differ (0.94 against 0.8). M6's impact stage
takes one `e` for the world. With per-contact `e_i`, a round applies
`(1 + e_i) λ̃_i` to each contact.

**What that does to the energy guarantee.** In a round, the contacts `V`
have Jacobian `J` and effective mass `K = J M⁻¹ Jᵀ` (positive
semidefinite). The inelastic impulses `λ̃` solve the complementarity
problem `w = K λ̃ + J v⁻ ≥ 0`, `λ̃ ≥ 0`, `wᵢ λ̃ᵢ = 0`. Applying `(I + E)
λ̃`, with `E = diag(eᵢ)`, changes the kinetic energy by

```text
ΔT = (J v⁻)ᵀ (I+E) λ̃ + ½ λ̃ᵀ (I+E) K (I+E) λ̃
   = ½ (E λ̃)ᵀ K (E λ̃) − ½ λ̃ᵀ K λ̃          (using complementarity)
```

- **One `e` for all** (`E = e I`): `ΔT = −½ (1 − e²) λ̃ᵀ K λ̃ ≤ 0`. Never
  a gain: M6's guarantee.
- **Mixed `e`**: shrinking some components of `λ̃` by *different* factors
  can *raise* the quadratic form when `K` couples contacts negatively.
  For example, two contacts on one ball pushing it in opposite
  directions, as with a ball pinned between another ball and a cushion,
  both struck in the same round. So **a single round can gain energy**.
  Later rounds may take it back (what still approaches joins the next
  round), but nothing guarantees it.

**Measured (M7.2):** a ball frozen to a cushion and struck, square and at
angles, never gained: its cushion contact isn't approaching when the cue
ball arrives, so it joins a later round alone. But a ball **moving into a
cushion and struck in the same substep** puts both contacts in one round,
and at `e = (1, 0.5)` (balls, cushion) it **gained 2.5%** (0.94% at 20°),
in both solvers. The table's own values (0.94, 0.8) didn't gain in any
case tried, but nothing guaranteed it.

**The fix:** each round, contacts coupled through a shared ball (a
union-find over the round's balls) bounce with their group's **smallest
`e`**. `K` is block-diagonal across groups, so the energy change is a sum
of `−½ (1 − e_g²) λ̃ᵀ K_g λ̃ ≤ 0`, one per group: never a gain. Uncoupled
contacts keep their own `e`, and a world with one `e` skips the grouping
(bit-identical to M6). The price is a slightly deader bounce in a round
where a ball meets a ball and a cushion at once. `tests/cushions.rs`
sweeps the squeeze and the frozen ball over five pairs of `e`, three
angles and three speeds: never more than rounding above the start.

## Tunneling: why speculative contacts

The roadmap planned M7's showcase as tunneling: "a break shot at low
substeps lets balls pass through each other; raise substeps and it
stops". **Measured during planning: it doesn't happen.** A cue ball at 3,
6, 11 and 15 m/s into a resting ball, at 1, 2, 3, 5 and 10 substeps (60
Hz), in both solvers: always a hit, never a pass-through, even at 15 m/s
and one substep (25 cm per step against a 5.7 cm ball).

The reason is M6's **speculative contacts**. A pair becomes a contact
when its gap can close *this substep* (`08-collision.md`, contact
generation), and the impact stage resolves it before positions move. A
ball can't get past another without first being caught as a contact.

So the page shows *why* speculative contacts exist instead:
- `World::set_speculative(false)`: contacts only when already touching
  (within the margin) at the start of a substep, the naive rule;
- a **tunneling counter**: per candidate pair, a swept test over the
  substep (did the centres pass within `r_a + r_b` while neither touching
  at the start nor overlapping at the end, with no contact found).
  Balls against cushions are counted the same way.

Off, a hard break tunnels at low substeps, and raising them brings the
count to zero at a threshold M7.4 measures (below). On, nothing tunnels at
any substeps.

**As built (M7.4, `tests/tunneling.rs`).** Off is the narrowphase given
no time to close in (`h = 0` for the speculative and swept tests), so a
contact is only what's within the margin at a substep's start. A ball at
12 m/s into a resting one, over 20 starting distances: **13 tunnel at
one substep, 2 at two, none from three** (at one substep, 2 at 6 m/s,
none at 3), both solvers. A 12 m/s ball at a cushion goes through at one
substep. On, none of it, at any substeps. Counting (`World::count_tunnels`)
is off by default: it costs a broadphase a substep.

## Pockets

A pocket is a **sensor**: a circle at a corner or side, behind the mouth.
A ball whose centre enters it is **potted**. `World::retire` takes it out
of play (static, radius 0, so it collides with nothing, at rest, its spin
zeroed), and the step reports `(ball, pocket)` events for the page's
tray. Retiring keeps every other ball's index. A scratched cue ball is
re-spotted on the head spot once the table is at rest: a page rule, not
the engine's.

**As built (M7.3, `tests/cloth.rs`):** a centre hit at 3 m/s matches the
model in both solvers, sampled every step for 25 s through sliding,
rolling and rest: velocity to 1.4e-12 (impulse) and 6.4e-8 (XPBD, which
derives velocity from positions), position first order, 0.025 m / n at
n substeps, energy never rising, and exactly at rest at the end. Natural
roll (`b = 2R/5`) doesn't slide. After a full hit, the cue ball rolls at
`(5/7)(b/R) v₀` (stun 0, draw back) within `(5/7) μ_s g h/2`: the half
substep of cloth before the impact stage. Rolling is decided with a
relative tolerance (1e-6 of the ball's speeds), not exact zero: after
snapping to rolling, `v_x − R (v_x / R)` can be an ulp off, and an exact
test never saw the ball roll, so it never stopped.

## The table as built (M7.6, `scenarios/billiards.rs`)

`pool_table`: 6 rails and 12 jaws as segments, 6 pockets, the cloth,
`e_b` for balls and `e_c` on every cushion. Our readings and choices:
- **Mouths** at the middle of WPA's ranges (115.9 and 128.6 mm). A
  corner mouth is a 45° line across the corner, so its points sit
  `M / √2` back along each rail.
- **Jaws** leave each point turned outward from the rail by 180° minus
  the WPA cut angle (38° at the corners, 76° at the sides), 6 cm long, so
  each throat narrows toward the pocket, as real ones do. Reading
  "cut angle" as the angle through the cushion rubber between the nose
  and the facing is ours.
- **Pocket sensors:** a corner's is centred on the table's corner and
  reaches the mouth's midpoint; a side's sits a ball's radius behind the
  mouth, as wide as it.

`pool_rack`: the cue ball (particle 0) on the head spot, 15 balls
touching with the apex on the foot spot, numbered by `POOL_RACK` (the 1
at the apex, the 8 in the middle, a solid and a stripe in the back
corners). `pool_break(speed, tip)` strikes the cue ball at the apex.

**Measured (`tests/billiards.rs`, both solvers, 10 substeps):** a break at
6–12 m/s comes to rest, energy exactly 0, by 6.0–6.5 s; energy never
rises; nothing tunnels; no ball leaves the table except into a pocket
(0–6 potted). Goldens for the break, native and wasm.

## The page (M7.8, `m7-billiards`)

One table, drawn from the engine's own segments and pockets. Drag back
from anywhere and let go: the cue ball is struck along the line from the
pointer through it, at a speed in proportion to the pull (full at 0.6 m,
12 m/s), with the tip slider's height. The cue only works when the table
is still; a scratched cue ball is re-spotted then. Readouts: the potted
tray, the tunnel count, energy (kinetic and spin, a log plot). Settings:
tip, solver, substeps, speculative contacts, rate; presets for a hard
break, tunneling (no speculation at one substep, where the cue ball
passes through the rack) and the same at three, follow and draw.

## Tests (as built)

`tests/cushions.rs`, `tests/cloth.rs`, `tests/tunneling.rs`,
`tests/pockets.rs`, `tests/billiards.rs`, and goldens for the break in
`tests/determinism.rs` (native and wasm32); each file's bounds are
commented with what was measured. The plan they came from:

- **Cushions:** the reflection angle (in = out at `e = 1`; the normal part
  scaled by `e` below); a corner hit off a jaw; a ball at rest against a
  cushion stays put; no pass-through at 12 m/s.
- **Per-contact restitution:** energy never rises over the impact stage
  on the cases above.
- **The cloth:** a centre hit rolls at 5/7 v₀ after `12 v₀² / (49 μ_s g)`
  in `2 v₀ / (7 μ_s g)` (tolerances measured); a rolling ball stops after
  `v² / (2 μ_r g)`; natural roll at `b = 2R/5` doesn't slide; stun,
  follow and draw after a full hit; energy only falls, by 2/7 over a
  centre hit's slide.
- **Tunneling:** as above.
- **Pockets:** a ball aimed in is potted; one rolling past a jaw isn't; a
  retired ball collides with nothing.
- **The table:** after a break, every ball at rest within a measured time;
  goldens, native and wasm.

## Out of scope

Sidespin, throw and cushion-induced spin (contact friction: M10); the
cushion's height; jump and massé shots; continuous collision detection;
game rules beyond potting and re-spotting the cue ball.

## References

Full entries in `references.md` ("Billiards").

- WPA, *Recommended Equipment Specifications*: the table, balls,
  pockets and cushions.
- Mathavan, Jackson & Parkin (2009), high-speed imaging of billiards;
  (2010), cushion impacts.
- Alciatore, *Pool and Billiards Physics Resources*: typical physical
  properties (secondary; to confirm by hand).
- Kiefl, *pooltool*: ball parameter defaults, citing Alciatore.
- Smith, Kaufman, Vouga, Tamstorf & Grinspun (2012), *Reflections on
  Simultaneous Impact*: Generalized Reflections.
