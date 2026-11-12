//! [`Slime`]: the Physarum model (`docs/15-swarm.md`, S4; Jones 2010).
//! One periodic field; agents that sense it at three points ahead, turn
//! toward the strongest, move, and deposit into it; the field diffuses
//! (the 3 × 3 mean filter) and decays.

use math::SplitMix64;
use math::convert::{f64_to_f32, f64_to_usize, usize_to_f64};

use crate::Field;

/// The most agents.
pub const MAX_AGENTS: usize = 1 << 21;

/// The model's constants: **our values** (`docs/15-swarm.md`, S4: Jones's
/// paper wasn't read; these are the values commonly reported for it).
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct SlimeParams {
    /// SA, radians.
    pub sensor_angle: f32,
    /// SO: how far ahead the sensors are, cells.
    pub sensor_offset: f32,
    /// RA, radians.
    pub turn: f32,
    /// SS: cells a step.
    pub step: f32,
    /// What an agent deposits a step.
    pub deposit: f32,
    /// The fraction diffused to neighbours a step (8/9: the mean filter).
    pub diffusion: f32,
    /// The fraction that decays a step.
    pub decay: f32,
}

impl SlimeParams {
    /// SA 22.5°, SO 9, RA 45°, SS 1, deposit 5, the mean filter, decay 0.1.
    pub const DEFAULT: Self = Self {
        sensor_angle: core::f32::consts::FRAC_PI_8,
        sensor_offset: 9.0,
        turn: core::f32::consts::FRAC_PI_4,
        step: 1.0,
        deposit: 5.0,
        diffusion: 8.0 / 9.0,
        decay: 0.1,
    };

    /// `self` if usable: angles in `[0, π]`, offset and deposit `≥ 0`,
    /// step `> 0` and under half the world, the rates in `[0, 1]`.
    #[must_use]
    pub fn checked(self) -> Option<Self> {
        let pi = core::f32::consts::PI;
        let ok = (0.0..=pi).contains(&self.sensor_angle)
            && (0.0..=pi).contains(&self.turn)
            && self.sensor_offset.is_finite()
            && self.sensor_offset >= 0.0
            && self.step.is_finite()
            && self.step > 0.0
            && self.deposit.is_finite()
            && self.deposit >= 0.0
            && (0.0..=1.0).contains(&self.diffusion)
            && (0.0..=1.0).contains(&self.decay);
        ok.then_some(self)
    }
}

/// The cell index (along one axis of `side` cells) holding coordinate `v`,
/// wrapped: `floor(v) mod side`. A sensor or a step reaches at most one
/// world-width outside in practice, where the wrap is one add; anything
/// further takes the general `rem_euclid` (an `fmod` call: with it on
/// every lookup, 40% of a step; `docs/profiling.md`). The same integer
/// either way: these are whole numbers in `f64`, so the add is exact.
fn wrap_cell(v: f32, side: usize) -> usize {
    let (f, l) = (f64::from(v.floor()), usize_to_f64(side));
    let c = if (0.0..l).contains(&f) {
        f
    } else if (-l..0.0).contains(&f) {
        f + l
    } else if (l..2.0 * l).contains(&f) {
        f - l
    } else {
        f.rem_euclid(l)
    };
    f64_to_usize(c).unwrap_or(0).min(side - 1)
}

/// Position `v` wrapped into `[0, l)`: `v.rem_euclid(l)`, and exactly
/// what it returns (`fmod` is exact; `v − l` is exact for `v` in
/// `[l, 2l)`; below zero `rem_euclid` itself adds `l`), without the call
/// when `v` is within one `l` outside. A sum that rounds up to `l`
/// becomes 0.
fn wrap_position(v: f32, l: f32) -> f32 {
    let w = if (0.0..l).contains(&v) {
        v
    } else if v > -l && v < 0.0 {
        // Not −l itself: `rem_euclid` gives −0 there, and this would +0.
        v + l
    } else if (l..2.0 * l).contains(&v) {
        v - l
    } else {
        v.rem_euclid(l)
    };
    if w >= l { 0.0 } else { w }
}

/// A Physarum system on a periodic `side × side` field.
#[derive(Clone, Debug)]
pub struct Slime {
    side: usize,
    field: Field,
    x: Vec<f32>,
    y: Vec<f32>,
    cos: Vec<f32>,
    sin: Vec<f32>,
    params: SlimeParams,
    rng: SplitMix64,
    sensing: bool,
    steps: u64,
    /// Fixed sources: (cell x, cell y, deposit a step).
    nodes: Vec<(usize, usize, f32)>,
    deposits: Vec<(usize, f32)>,
}

impl Slime {
    /// `n` agents at random positions and headings on a `side × side`
    /// periodic field. `None` for a bad size, count or params.
    #[must_use]
    pub fn new(side: usize, n: usize, params: SlimeParams, seed: u64) -> Option<Self> {
        let params = params.checked()?;
        let field = Field::new(side, side)?;
        if !(1..=MAX_AGENTS).contains(&n) || f64::from(params.step) >= usize_to_f64(side) / 2.0 {
            return None;
        }
        let mut rng = SplitMix64::new(seed);
        let l = usize_to_f64(side);
        let (mut x, mut y, mut cos, mut sin) = (
            Vec::with_capacity(n),
            Vec::with_capacity(n),
            Vec::with_capacity(n),
            Vec::with_capacity(n),
        );
        for _ in 0..n {
            x.push(f64_to_f32(rng.range(0.0, l)).min(f64_to_f32(l) * (1.0 - f32::EPSILON)));
            y.push(f64_to_f32(rng.range(0.0, l)).min(f64_to_f32(l) * (1.0 - f32::EPSILON)));
            let (c, s) = loop {
                let (c, s) = (rng.range(-1.0, 1.0), rng.range(-1.0, 1.0));
                let len = (c * c + s * s).sqrt();
                if len > 1e-3 && len <= 1.0 {
                    break (c / len, s / len);
                }
            };
            cos.push(f64_to_f32(c));
            sin.push(f64_to_f32(s));
        }
        Some(Self {
            side,
            field,
            x,
            y,
            cos,
            sin,
            params,
            rng,
            sensing: true,
            steps: 0,
            nodes: Vec::new(),
            deposits: Vec::new(),
        })
    }

    /// The cell holding `(x, y)`, wrapped into the field.
    fn cell(&self, x: f32, y: f32) -> usize {
        let l = self.side;
        wrap_cell(y, l) * l + wrap_cell(x, l)
    }

    /// One step: every agent senses (the field as it was), turns, moves,
    /// and deposits; then the nodes deposit; then diffusion and decay.
    pub fn step(&mut self) {
        let p = self.params;
        let l = f64_to_f32(usize_to_f64(self.side));
        let (sa_c, sa_s) = (libm::cosf(p.sensor_angle), libm::sinf(p.sensor_angle));
        let (ra_c, ra_s) = (libm::cosf(p.turn), libm::sinf(p.turn));
        self.deposits.clear();
        for i in 0..self.x.len() {
            let (Some(&x), Some(&y), Some(&c), Some(&s)) = (
                self.x.get(i),
                self.y.get(i),
                self.cos.get(i),
                self.sin.get(i),
            ) else {
                continue;
            };
            // One draw per agent per step: the stream stays aligned.
            let r = self.rng.next_unit_f64();
            let sense = |dc: f32, ds: f32| {
                let (hc, hs) = (c * dc - s * ds, c * ds + s * dc);
                let at = self.cell(x + p.sensor_offset * hc, y + p.sensor_offset * hs);
                self.field.values().get(at).copied().unwrap_or(0.0)
            };
            // −1: turn by −RA; 0: straight; 1: by +RA.
            let dir: i8 = if self.sensing {
                let (left, front, right) = (sense(sa_c, -sa_s), sense(1.0, 0.0), sense(sa_c, sa_s));
                if front > left && front > right {
                    0
                } else if front < left && front < right {
                    if r < 0.5 { -1 } else { 1 }
                } else if left > right {
                    -1
                } else {
                    i8::from(right > left)
                }
            } else if r < 1.0 / 3.0 {
                -1
            } else {
                i8::from(r >= 2.0 / 3.0)
            };
            let (nc, ns) = match dir {
                -1 => (c * ra_c + s * ra_s, s * ra_c - c * ra_s),
                1 => (c * ra_c - s * ra_s, s * ra_c + c * ra_s),
                _ => (c, s),
            };
            let (nx, ny) = (
                wrap_position(x + p.step * nc, l),
                wrap_position(y + p.step * ns, l),
            );
            let at = self.cell(nx, ny);
            self.deposits.push((at, p.deposit));
            if let (Some(xs), Some(ys), Some(cs), Some(ss)) = (
                self.x.get_mut(i),
                self.y.get_mut(i),
                self.cos.get_mut(i),
                self.sin.get_mut(i),
            ) {
                (*xs, *ys, *cs, *ss) = (nx, ny, nc, ns);
            }
        }
        let l = self.side;
        for &(i, amount) in &self.deposits {
            self.field.deposit(i % l, i / l, amount);
        }
        for &(x, y, amount) in &self.nodes {
            self.field.deposit(x, y, amount);
        }
        self.field.diffuse_periodic(p.diffusion);
        self.field.decay(p.decay);
        self.steps += 1;
    }

    /// Adds a fixed source at cell `(x, y)` depositing `amount` a step (a
    /// nutrient node); `false` outside or for a bad amount.
    pub fn add_node(&mut self, x: usize, y: usize, amount: f32) -> bool {
        let ok = x < self.side && y < self.side && amount.is_finite() && amount >= 0.0;
        if ok {
            self.nodes.push((x, y, amount));
        }
        ok
    }

    /// Removes every node.
    pub fn clear_nodes(&mut self) {
        self.nodes.clear();
    }

    #[must_use]
    pub fn nodes(&self) -> &[(usize, usize, f32)] {
        &self.nodes
    }

    /// Sensing on (the default) or off: off, agents turn at random (−RA,
    /// 0, +RA equally): the baseline.
    pub const fn set_sensing(&mut self, on: bool) {
        self.sensing = on;
    }

    /// Replaces the constants; `false` (unchanged) if unusable.
    pub fn set_params(&mut self, params: SlimeParams) -> bool {
        let fits = f64::from(params.step) < usize_to_f64(self.side) / 2.0;
        match params.checked() {
            Some(p) if fits => {
                self.params = p;
                true
            }
            _ => false,
        }
    }

    #[must_use]
    pub const fn params(&self) -> SlimeParams {
        self.params
    }

    #[must_use]
    pub const fn field(&self) -> &Field {
        &self.field
    }

    #[must_use]
    pub const fn side(&self) -> usize {
        self.side
    }

    #[must_use]
    pub fn len(&self) -> usize {
        self.x.len()
    }

    /// Never true.
    #[must_use]
    pub fn is_empty(&self) -> bool {
        self.x.is_empty()
    }

    #[must_use]
    pub const fn steps(&self) -> u64 {
        self.steps
    }

    /// Agents' positions, cells.
    pub fn positions(&self) -> impl Iterator<Item = (f32, f32)> + '_ {
        self.x.iter().copied().zip(self.y.iter().copied())
    }

    /// What the last step deposited (agents and nodes), for accounting.
    #[must_use]
    pub fn last_deposits(&self) -> f64 {
        self.deposits.iter().map(|d| f64::from(d.1)).sum::<f64>()
            + self.nodes.iter().map(|n| f64::from(n.2)).sum::<f64>()
    }

    /// The state's bytes for hashing (goldens): agents, then the field.
    #[must_use]
    pub fn state_bytes(&self) -> Vec<u8> {
        let mut out = Vec::new();
        for v in [&self.x, &self.y, &self.cos, &self.sin] {
            for f in v {
                out.extend_from_slice(&f.to_le_bytes());
            }
        }
        for f in self.field.values() {
            out.extend_from_slice(&f.to_le_bytes());
        }
        out
    }
}

#[cfg(test)]
mod tests;
