# 09 — Billiards

Status: **Draft** (M7.1). Depends on `08-collision.md` (contacts,
speculative contacts, the impact stage). Decisions: TASKS.md, M7.

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
through contact friction. M7 has neither (decision 3), so **`ω_z` is left
out**. `00-scope.md`'s open question, answered: carry the horizontal
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
These three numbers are section 3's analytic tests.

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
special cases, and section 3 tests each shot.

## Cushions

A cushion is a static **segment**: two endpoints, a restitution, and a
circle–segment narrowphase (closest point on the segment; past either
end, the endpoint itself, so ends behave as rounded corners). Pocket
jaws are segment ends. The cushions are laid out from the WPA mouths and
cut angles. Speculative like walls (`08-collision.md`).

**Not modelled:** the cushion nose sits at 63.5% of the ball's diameter,
above the centre, so a real cushion pushes slightly down and imparts spin
(Mathavan et al. 2010 analyse it). Our cushions push through the centre.
Cushion friction is left out with all contact friction (decision 3).

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

Section 2 measures it on the cases that can trigger it: a ball frozen to
a cushion struck square and at angles, and a rack against a cushion. If
energy rises over the whole stage, the candidates are: solve a round's
coupled contacts at their smallest `e` (conservative, loses a little
energy), or split such rounds by material. Decided by the measurement.

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
count to zero at a threshold section 4 measures. On, nothing tunnels at
any substeps. Section 4's tests: on, zero at 12 m/s and one substep; off,
tunnels at one substep.

## Pockets

A pocket is a **sensor**: a circle at a corner or side, behind the mouth.
A ball whose centre enters it is **potted**. `World::retire` takes it out
of play (static, radius 0, so it collides with nothing, at rest, its spin
zeroed), and the step reports `(ball, pocket)` events for the page's
tray. Retiring keeps every other ball's index. A scratched cue ball is
re-spotted on the head spot once the table is at rest: a page rule, not
the engine's.

## Tests (planned)

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

- WPA, *Recommended Equipment Specifications* (effective November 2001).
  https://wpapool.com/wp-content/uploads/2024/01/RECOMMENDED-EQUIPMENT-SPECIFICATIONS.pdf
- Mathavan, Jackson & Parkin (2009), "Application of high-speed imaging
  to determine the dynamics of billiards", *Am. J. Phys.* 77(9),
  788–794. doi:10.1119/1.3157159
- Mathavan, Jackson & Parkin (2010), "A theoretical analysis of billiard
  ball dynamics under cushion impacts", *Proc. IMechE C* 224(9),
  1863–1873. doi:10.1243/09544062JMES1964
- Alciatore, D., *Pool and Billiards Physics Resources* (Colorado State
  University), typical physical properties.
  https://billiards.colostate.edu/faq/physics/physical-properties/
- Kiefl, E., *pooltool* (ball parameter defaults, citing Alciatore).
  https://pooltool.readthedocs.io/
- Smith, Kaufman, Vouga, Tamstorf & Grinspun (2012), "Reflections on
  simultaneous impact", *ACM TOG* 31(4). doi:10.1145/2185520.2185602
