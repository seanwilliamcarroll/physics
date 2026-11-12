//! [`Vicsek`]: the Vicsek model (`docs/15-swarm.md`, S2; Vicsek et al.
//! 1995). Constant speed v; each step every particle takes the average
//! heading of the particles within `r` of it (itself included) plus a
//! uniform angle in `[−η/2, η/2]`; a periodic square box of side L.

use math::SplitMix64;
use math::convert::f64_to_f32;

use crate::grid::Grid;

/// The most particles a system holds (as [`MAX_BOIDS`](crate::MAX_BOIDS)).
pub const MAX_PARTICLES: usize = 1 << 18;

/// The model's constants: Vicsek et al.'s units by default.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct VicsekParams {
    /// Interaction radius `r` (the paper's unit of length: 1).
    pub radius: f32,
    /// The distance a particle moves a step, `v` (the paper's 0.03).
    pub speed: f32,
    /// The noise amplitude η: `Δθ` is uniform on `[−η/2, η/2]`, so η =
    /// 2π is no alignment at all.
    pub noise: f32,
}

impl VicsekParams {
    /// The paper's `r = 1`, `v = 0.03`, and a given η.
    #[must_use]
    pub const fn paper(noise: f32) -> Self {
        Self {
            radius: 1.0,
            speed: 0.03,
            noise,
        }
    }

    /// `self` if usable: radius and speed finite and positive, the noise
    /// finite in `[0, 2π]`.
    #[must_use]
    pub fn checked(self) -> Option<Self> {
        let ok = self.radius.is_finite()
            && self.radius > 0.0
            && self.speed.is_finite()
            && self.speed > 0.0
            && (0.0..=core::f32::consts::TAU).contains(&self.noise);
        ok.then_some(self)
    }
}

/// A particle: position in `[0, L)²` and its heading, a unit vector.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Particle {
    pub x: f32,
    pub y: f32,
    pub cos: f32,
    pub sin: f32,
}

#[derive(Clone, Debug, Default)]
struct State {
    x: Vec<f32>,
    y: Vec<f32>,
    cos: Vec<f32>,
    sin: Vec<f32>,
}

impl State {
    fn get(&self, i: usize) -> Option<Particle> {
        Some(Particle {
            x: *self.x.get(i)?,
            y: *self.y.get(i)?,
            cos: *self.cos.get(i)?,
            sin: *self.sin.get(i)?,
        })
    }

    fn set(&mut self, i: usize, p: Particle) {
        let slots = (
            self.x.get_mut(i),
            self.y.get_mut(i),
            self.cos.get_mut(i),
            self.sin.get_mut(i),
        );
        if let (Some(x), Some(y), Some(c), Some(s)) = slots {
            (*x, *y, *c, *s) = (p.x, p.y, p.cos, p.sin);
        }
    }

    fn push(&mut self, p: Particle) {
        self.x.push(p.x);
        self.y.push(p.y);
        self.cos.push(p.cos);
        self.sin.push(p.sin);
    }

    fn len(&self) -> usize {
        self.x.len()
    }
}

/// A Vicsek system: the particles now and the buffer the next step goes
/// into (swapped every step), the noise's random stream, and how often a
/// neighbourhood's headings cancelled exactly.
#[derive(Clone, Debug)]
pub struct Vicsek {
    side: f32,
    params: VicsekParams,
    cur: State,
    next: State,
    rng: SplitMix64,
    steps: u64,
    annihilations: u64,
    /// Neighbours through the periodic grid (when ≥ 3 cells fit), or
    /// every pair.
    brute_force: bool,
    grid: Grid,
}

impl Vicsek {
    /// `n` particles (1 to [`MAX_PARTICLES`]) at random in an `L × L`
    /// box, random headings, the noise drawn from `seed`'s stream. `None`
    /// for a bad count, side or params.
    #[must_use]
    pub fn new(n: usize, side: f32, params: VicsekParams, seed: u64) -> Option<Self> {
        if !(1..=MAX_PARTICLES).contains(&n) {
            return None;
        }
        let mut rng = SplitMix64::new(seed);
        let l = f64::from(side);
        let particles: Vec<Particle> = (0..n)
            .map(|_| {
                let (x, y) = (rng.range(0.0, l), rng.range(0.0, l));
                // A direction, without trig: a point in the unit disc.
                let (c, s) = loop {
                    let (c, s) = (rng.range(-1.0, 1.0), rng.range(-1.0, 1.0));
                    let len = (c * c + s * s).sqrt();
                    if len > 1e-3 && len <= 1.0 {
                        break (c / len, s / len);
                    }
                };
                Particle {
                    x: f64_to_f32(x),
                    y: f64_to_f32(y),
                    cos: f64_to_f32(c),
                    sin: f64_to_f32(s),
                }
            })
            .collect();
        Self::with_particles(side, params, particles, rng.next_u64())
    }

    /// Exactly `particles` (positions wrapped into the box), the noise
    /// from `seed`. `None` if empty, too many, or a bad side or params.
    #[must_use]
    pub fn with_particles(
        side: f32,
        params: VicsekParams,
        particles: impl IntoIterator<Item = Particle>,
        seed: u64,
    ) -> Option<Self> {
        let params = params.checked()?;
        if !(side.is_finite() && side > 0.0) {
            return None;
        }
        let mut cur = State::default();
        for p in particles.into_iter().take(MAX_PARTICLES + 1) {
            cur.push(Particle {
                x: wrap(p.x, side),
                y: wrap(p.y, side),
                ..p
            });
        }
        if cur.len() == 0 || cur.len() > MAX_PARTICLES {
            return None;
        }
        Some(Self {
            side,
            params,
            next: cur.clone(),
            cur,
            rng: SplitMix64::new(seed),
            steps: 0,
            annihilations: 0,
            brute_force: false,
            grid: Grid::default(),
        })
    }

    /// One step: every particle's new heading from the current state
    /// (its neighbourhood's normalized heading sum, rotated by the
    /// noise), and its new position from its *current* heading (Eq. 1).
    pub fn step(&mut self) {
        let n = self.cur.len();
        let (side, p) = (self.side, self.params);
        let gridded = !self.brute_force
            && self
                .grid
                .rebuild_periodic(side, p.radius, &self.cur.x, &self.cur.y)
                .is_some();
        for i in 0..n {
            let Some(me) = self.cur.get(i) else { continue };
            // The neighbourhood's heading sum, `me` included (distance 0).
            let mut sum = (0.0_f32, 0.0_f32);
            if gridded {
                for cell in self.grid.cells_wrapped(me.x, me.y) {
                    let candidates = cell.iter().filter_map(|&j| usize::try_from(j).ok());
                    add_headings(&mut sum, &self.cur, me, side, p.radius, candidates);
                }
            } else {
                add_headings(&mut sum, &self.cur, me, side, p.radius, 0..n);
            }
            let (sc, ss) = sum;
            let next = self.turn(me, sc, ss);
            self.next.set(i, next);
        }
        core::mem::swap(&mut self.cur, &mut self.next);
        self.steps += 1;
    }

    /// The particle with its new heading (the normalized sum, or its own
    /// if the sum is exactly zero, counted), noise applied, and moved by
    /// its old one.
    fn turn(&mut self, me: Particle, sc: f32, ss: f32) -> Particle {
        let len = (sc * sc + ss * ss).sqrt();
        let (c, s) = if len > 0.0 {
            (sc / len, ss / len)
        } else {
            self.annihilations += 1;
            (me.cos, me.sin)
        };
        // Δθ uniform on [−η/2, η/2], one draw per particle per step in
        // storage order.
        let dt = f64_to_f32((self.rng.next_unit_f64() - 0.5) * f64::from(self.params.noise));
        let (sn, cs) = (libm::sinf(dt), libm::cosf(dt));
        let v = self.params.speed;
        Particle {
            x: wrap(me.x + v * me.cos, self.side),
            y: wrap(me.y + v * me.sin, self.side),
            cos: c * cs - s * sn,
            sin: c * sn + s * cs,
        }
    }

    /// Every pair (`true`) or the periodic grid (`false`, the default;
    /// brute force anyway when fewer than 3 cells fit across the box).
    /// The same neighbours either way.
    pub const fn set_brute_force(&mut self, on: bool) {
        self.brute_force = on;
    }

    #[must_use]
    pub fn len(&self) -> usize {
        self.cur.len()
    }

    /// Never true: a system has at least one particle.
    #[must_use]
    pub fn is_empty(&self) -> bool {
        self.cur.len() == 0
    }

    #[must_use]
    pub fn particle(&self, i: usize) -> Option<Particle> {
        self.cur.get(i)
    }

    pub fn particles(&self) -> impl Iterator<Item = Particle> + '_ {
        (0..self.len()).filter_map(|i| self.cur.get(i))
    }

    #[must_use]
    pub const fn side(&self) -> f32 {
        self.side
    }

    #[must_use]
    pub const fn params(&self) -> VicsekParams {
        self.params
    }

    /// Replaces the constants from the next step; `false` (and nothing
    /// changed) if unusable.
    pub fn set_params(&mut self, params: VicsekParams) -> bool {
        params.checked().map(|p| self.params = p).is_some()
    }

    #[must_use]
    pub const fn steps(&self) -> u64 {
        self.steps
    }

    /// How many times a neighbourhood's headings summed to exactly zero
    /// (the heading was kept): Chen & Zhang's "direction annihilation".
    #[must_use]
    pub const fn annihilations(&self) -> u64 {
        self.annihilations
    }

    /// The order parameter `v_a = |Σ vᵢ| / (N v)`: with every speed v,
    /// the length of the mean heading. Summed in `f64`.
    #[must_use]
    pub fn order(&self) -> f64 {
        let (mut c, mut s, mut n) = (0.0_f64, 0.0_f64, 0.0_f64);
        for p in self.particles() {
            c += f64::from(p.cos);
            s += f64::from(p.sin);
            n += 1.0;
        }
        (c * c + s * s).sqrt() / n
    }

    /// The paper's measurement: `transient` steps discarded, then the mean
    /// of [`Self::order`] over the next `window` steps (NaN for an empty
    /// window).
    pub fn mean_order(&mut self, transient: u32, window: u32) -> f64 {
        for _ in 0..transient {
            self.step();
        }
        let mut sum = 0.0;
        for _ in 0..window {
            self.step();
            sum += self.order();
        }
        sum / f64::from(window)
    }

    /// The state's bytes for hashing (goldens).
    pub fn state_bytes(&self) -> impl Iterator<Item = u8> + '_ {
        self.particles()
            .flat_map(|p| [p.x, p.y, p.cos, p.sin])
            .flat_map(f32::to_le_bytes)
    }
}

/// Adds to `sum` the headings of the `candidates` within `r` of `me`
/// (minimum image), `me` included if it's among them. Called once per
/// cell on the grid: the sum carries on from cell to cell, in the same
/// order as one pass over them all.
fn add_headings(
    sum: &mut (f32, f32),
    s: &State,
    me: Particle,
    side: f32,
    r: f32,
    candidates: impl Iterator<Item = usize>,
) {
    let r_sq = r * r;
    let (mut sc, mut ss) = *sum;
    for j in candidates {
        let Some(o) = s.get(j) else { continue };
        let (dx, dy) = (image(me.x - o.x, side), image(me.y - o.y, side));
        if dx * dx + dy * dy < r_sq {
            sc += o.cos;
            ss += o.sin;
        }
    }
    *sum = (sc, ss);
}

/// `d` as the minimum image in a box of side `l`: in `[−l/2, l/2]`.
fn image(d: f32, l: f32) -> f32 {
    if d > 0.5 * l {
        d - l
    } else if d < -0.5 * l {
        d + l
    } else {
        d
    }
}

/// `x` wrapped into `[0, l)` (a step is far less than l).
fn wrap(x: f32, l: f32) -> f32 {
    let w = if x >= l {
        x - l
    } else if x < 0.0 {
        x + l
    } else {
        x
    };
    // `x + l` can round up to exactly `l` for a tiny negative x.
    if w >= l { 0.0 } else { w }
}

#[cfg(test)]
mod tests;
