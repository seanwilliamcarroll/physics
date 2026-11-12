//! [`Colony`]: ant foraging (`docs/15-swarm.md`, S3). A grid world
//! (walls, integer food, a nest), two pheromone [`Field`]s, and ants that
//! sense one field, turn, move, pick up and deliver food, and deposit
//! into the other.

use math::SplitMix64;
use math::convert::{f64_to_f32, f64_to_usize};

use crate::Field;

/// The most ants a colony holds.
pub const MAX_ANTS: usize = 1 << 18;

/// The ants' constants (all **our choices**, measured: `docs/15-swarm.md`,
/// S3). Angles in radians, distances in cells, per step.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct AntParams {
    /// SA: the side sensors' angle off the heading.
    pub sensor_angle: f32,
    /// SD: how far ahead the sensors are.
    pub sensor_distance: f32,
    /// RA: the turn toward the stronger side.
    pub turn: f32,
    /// A random turn each step, uniform in `[−wiggle, wiggle]`.
    pub wiggle: f32,
    /// v: cells a step.
    pub speed: f32,
    /// q: the deposit leaving the nest or the food.
    pub deposit: f32,
    /// k: the deposit's fall-off, `q · e^(−k s)` after `s` steps.
    pub falloff: f32,
    /// D: the fraction each cell diffuses to its neighbours a step.
    pub diffusion: f32,
    /// E: the fraction that evaporates a step.
    pub decay: f32,
}

impl AntParams {
    /// The defaults: SA, SD, RA and v as planned; the wiggle, fall-off,
    /// diffusion and decay from a scan (`docs/15-swarm.md`, S3.3: the
    /// setting whose worst of four seeds delivered most).
    pub const DEFAULT: Self = Self {
        sensor_angle: core::f32::consts::FRAC_PI_4,
        sensor_distance: 9.0,
        turn: core::f32::consts::FRAC_PI_4,
        wiggle: 0.4,
        speed: 1.0,
        deposit: 1.0,
        falloff: 0.08,
        diffusion: 0.2,
        decay: 0.008,
    };

    /// `self` if every value is finite and in range: angles in `[0, π]`,
    /// distances, speed and deposit `≥ 0` (speed `> 0`), the rates in
    /// `[0, 1]`.
    #[must_use]
    pub fn checked(self) -> Option<Self> {
        let pi = core::f32::consts::PI;
        let ok = [self.sensor_angle, self.turn, self.wiggle]
            .iter()
            .all(|a| (0.0..=pi).contains(a))
            && self.sensor_distance.is_finite()
            && self.sensor_distance >= 0.0
            && self.speed.is_finite()
            && self.speed > 0.0
            && self.deposit.is_finite()
            && self.deposit >= 0.0
            && self.falloff.is_finite()
            && self.falloff >= 0.0
            && (0.0..=1.0).contains(&self.diffusion)
            && (0.0..=1.0).contains(&self.decay);
        ok.then_some(self)
    }
}

/// One ant: position (cells), heading (a unit vector), whether it
/// carries food, and its steps since it last left the nest or the food.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Ant {
    pub x: f32,
    pub y: f32,
    pub cos: f32,
    pub sin: f32,
    pub carrying: bool,
    pub since: u32,
}

/// The two fields an ant writes and reads.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub enum Pheromone {
    /// Laid by searching ants: it leads home.
    Home,
    /// Laid by carrying ants: it leads to food.
    Food,
}

/// A colony and its world.
#[derive(Clone, Debug)]
pub struct Colony {
    width: usize,
    height: usize,
    /// `true` for an open cell, `false` for a wall.
    open: Vec<bool>,
    food: Vec<u16>,
    nest: (f32, f32, f32),
    home_field: Field,
    food_field: Field,
    ants: Vec<Ant>,
    params: AntParams,
    rng: SplitMix64,
    sensing: bool,
    steps: u64,
    delivered: u64,
    /// Food painted in, less food painted out: the accounting's total.
    painted: i64,
    deposits: Vec<(Pheromone, usize, usize, f32)>,
}

impl Colony {
    /// A `width × height` world, open and empty, with `n` ants at the
    /// nest (a disc at `(nx, ny)` of radius `nr`, cells) heading at
    /// random. `None` for a bad size, count, nest or params.
    #[must_use]
    pub fn new(
        width: usize,
        height: usize,
        n: usize,
        nest: (f32, f32, f32),
        params: AntParams,
        seed: u64,
    ) -> Option<Self> {
        let params = params.checked()?;
        let (home_field, food_field) = (Field::new(width, height)?, Field::new(width, height)?);
        let (nx, ny, nr) = nest;
        let in_world = |v: f32, side: usize| {
            v.is_finite()
                && v >= 0.0
                && u32::try_from(side).is_ok_and(|n| f64::from(v) < f64::from(n))
        };
        let usable = (1..=MAX_ANTS).contains(&n)
            && in_world(nx, width)
            && in_world(ny, height)
            && nr.is_finite()
            && nr > 0.0;
        if !usable {
            return None;
        }
        let mut rng = SplitMix64::new(seed);
        let ants = (0..n)
            .map(|_| {
                let (c, s) = unit(&mut rng);
                Ant {
                    x: nx,
                    y: ny,
                    cos: c,
                    sin: s,
                    carrying: false,
                    since: 0,
                }
            })
            .collect();
        Some(Self {
            width,
            height,
            open: vec![true; width * height],
            food: vec![0; width * height],
            nest,
            home_field,
            food_field,
            ants,
            params,
            rng,
            sensing: true,
            steps: 0,
            delivered: 0,
            painted: 0,
            deposits: Vec::new(),
        })
    }

    fn index(&self, x: f32, y: f32) -> Option<usize> {
        let (cx, cy) = (
            f64_to_usize(f64::from(x.floor()))?,
            f64_to_usize(f64::from(y.floor()))?,
        );
        (cx < self.width && cy < self.height).then(|| cy * self.width + cx)
    }

    fn in_nest(&self, x: f32, y: f32) -> bool {
        let (nx, ny, nr) = self.nest;
        (x - nx) * (x - nx) + (y - ny) * (y - ny) <= nr * nr
    }

    /// Cells of the disc of `radius` at `(x, y)`, clipped to the world.
    fn disc(&self, x: f32, y: f32, radius: f32) -> Vec<usize> {
        let r = radius.max(0.0);
        let (x0, x1) = (f64::from((x - r).floor()), f64::from((x + r).ceil()));
        let (y0, y1) = (f64::from((y - r).floor()), f64::from((y + r).ceil()));
        let mut out = Vec::new();
        let (mut cy, w) = (y0, self.width);
        while cy <= y1 {
            let mut cx = x0;
            while cx <= x1 {
                let (dx, dy) = (cx + 0.5 - f64::from(x), cy + 0.5 - f64::from(y));
                if dx * dx + dy * dy <= f64::from(r * r) + 0.5
                    && let (Some(ix), Some(iy)) = (f64_to_usize(cx), f64_to_usize(cy))
                    && ix < w
                    && iy < self.height
                {
                    out.push(iy * w + ix);
                }
                cx += 1.0;
            }
            cy += 1.0;
        }
        out
    }

    /// Adds `amount` food to every open cell of a disc (saturating at
    /// `u16::MAX`); returns the units added.
    pub fn paint_food(&mut self, x: f32, y: f32, radius: f32, amount: u16) -> u64 {
        let mut added = 0_u64;
        for i in self.disc(x, y, radius) {
            if self.open.get(i).copied().unwrap_or(false)
                && let Some(f) = self.food.get_mut(i)
            {
                let new = f.saturating_add(amount);
                added += u64::from(new - *f);
                *f = new;
            }
        }
        self.painted += i64::try_from(added).unwrap_or(i64::MAX);
        added
    }

    /// Makes a disc of cells walls (removing their food and pheromone);
    /// returns the cells changed.
    pub fn paint_wall(&mut self, x: f32, y: f32, radius: f32) -> usize {
        let mut changed = 0;
        for i in self.disc(x, y, radius) {
            if let Some(o) = self.open.get_mut(i)
                && *o
            {
                *o = false;
                changed += 1;
            }
            self.remove_food(i);
        }
        self.clear_walls_from_fields();
        changed
    }

    /// Opens a disc of cells and removes their food; returns the cells
    /// that were walls or held food.
    pub fn erase(&mut self, x: f32, y: f32, radius: f32) -> usize {
        let mut changed = 0;
        for i in self.disc(x, y, radius) {
            let was_wall = self.open.get(i).is_some_and(|o| !o);
            if let Some(o) = self.open.get_mut(i) {
                *o = true;
            }
            changed += usize::from(was_wall || self.remove_food(i) > 0);
        }
        changed
    }

    fn remove_food(&mut self, i: usize) -> u16 {
        let Some(f) = self.food.get_mut(i) else {
            return 0;
        };
        let had = *f;
        *f = 0;
        self.painted -= i64::from(had);
        had
    }

    fn clear_walls_from_fields(&mut self) {
        // Pheromone under a new wall is removed (walls hold nothing).
        let walls: Vec<usize> = self
            .open
            .iter()
            .enumerate()
            .filter(|&(_, &o)| !o)
            .map(|(i, _)| i)
            .collect();
        for field in [&mut self.home_field, &mut self.food_field] {
            for &i in &walls {
                field.zero(i);
            }
        }
    }

    /// Moves the nest; `false` (unchanged) for a centre outside the world
    /// or a radius not positive.
    pub fn set_nest(&mut self, x: f32, y: f32, radius: f32) -> bool {
        let w = f64::from(u32::try_from(self.width).unwrap_or(u32::MAX));
        let h = f64::from(u32::try_from(self.height).unwrap_or(u32::MAX));
        let ok = x.is_finite()
            && y.is_finite()
            && radius.is_finite()
            && radius > 0.0
            && x >= 0.0
            && y >= 0.0
            && f64::from(x) < w
            && f64::from(y) < h;
        if ok {
            self.nest = (x, y, radius);
        }
        ok
    }

    /// Sensing on (the default) or off: off, ants turn at random (a
    /// random walk with the same speed and turns: the baseline).
    pub const fn set_sensing(&mut self, on: bool) {
        self.sensing = on;
    }

    /// Replaces the constants; `false` (unchanged) if unusable.
    pub fn set_params(&mut self, params: AntParams) -> bool {
        params.checked().map(|p| self.params = p).is_some()
    }

    /// The followed field at `(x, y)`; a wall or the outside reads −1 (worse
    /// than any trail).
    fn sense(&self, which: Pheromone, x: f32, y: f32) -> f32 {
        let field = match which {
            Pheromone::Home => &self.home_field,
            Pheromone::Food => &self.food_field,
        };
        match self.index(x, y) {
            Some(i) if self.open.get(i).copied().unwrap_or(false) => {
                field.values().get(i).copied().unwrap_or(-1.0)
            }
            _ => -1.0,
        }
    }

    /// One step: every ant senses (the fields as they were), turns,
    /// moves, takes or delivers food; then the deposits, diffusion and
    /// decay.
    pub fn step(&mut self) {
        let p = self.params;
        self.deposits.clear();
        for i in 0..self.ants.len() {
            let Some(mut a) = self.ants.get(i).copied() else {
                continue;
            };
            // Two draws per ant per step, whatever happens: the stream
            // stays aligned.
            let (r_turn, r_wiggle) = (self.rng.next_unit_f64(), self.rng.next_unit_f64());
            let follow = if a.carrying {
                Pheromone::Home
            } else {
                Pheromone::Food
            };
            let turn = if self.sensing {
                let at = |angle: f32| {
                    let (c, s) = rotate(a.cos, a.sin, angle);
                    self.sense(
                        follow,
                        a.x + p.sensor_distance * c,
                        a.y + p.sensor_distance * s,
                    )
                };
                let (left, front, right) = (at(-p.sensor_angle), at(0.0), at(p.sensor_angle));
                if front > left && front > right {
                    0.0
                } else if front < left && front < right {
                    if r_turn < 0.5 { -p.turn } else { p.turn }
                } else if left > right {
                    -p.turn
                } else if right > left {
                    p.turn
                } else {
                    0.0
                }
            } else {
                f64_to_f32((r_turn * 2.0 - 1.0) * f64::from(p.turn))
            };
            let wiggle = f64_to_f32((r_wiggle * 2.0 - 1.0) * f64::from(p.wiggle));
            (a.cos, a.sin) = rotate(a.cos, a.sin, turn + wiggle);
            let (nx, ny) = (a.x + p.speed * a.cos, a.y + p.speed * a.sin);
            match self.index(nx, ny) {
                Some(j) if self.open.get(j).copied().unwrap_or(false) => (a.x, a.y) = (nx, ny),
                _ => (a.cos, a.sin) = (-a.cos, -a.sin),
            }
            let here = self.index(a.x, a.y);
            if a.carrying {
                if self.in_nest(a.x, a.y) {
                    self.delivered += 1;
                    a.carrying = false;
                    a.since = 0;
                    (a.cos, a.sin) = (-a.cos, -a.sin);
                }
            } else if let Some(f) = here.and_then(|j| self.food.get_mut(j)).filter(|f| **f > 0) {
                *f -= 1;
                a.carrying = true;
                a.since = 0;
                (a.cos, a.sin) = (-a.cos, -a.sin);
            } else if self.in_nest(a.x, a.y) {
                a.since = 0;
            }
            // Deposit into the other field, weakening with distance.
            let laid = if a.carrying {
                Pheromone::Food
            } else {
                Pheromone::Home
            };
            let amount = p.deposit * libm::expf(-p.falloff * f64_to_f32(f64::from(a.since)));
            if let (Some(cx), Some(cy)) = (
                f64_to_usize(f64::from(a.x.floor())),
                f64_to_usize(f64::from(a.y.floor())),
            ) {
                self.deposits.push((laid, cx, cy, amount));
            }
            a.since = a.since.saturating_add(1);
            if let Some(slot) = self.ants.get_mut(i) {
                *slot = a;
            }
        }
        for &(which, x, y, amount) in &self.deposits {
            let field = match which {
                Pheromone::Home => &mut self.home_field,
                Pheromone::Food => &mut self.food_field,
            };
            field.deposit(x, y, amount);
        }
        for field in [&mut self.home_field, &mut self.food_field] {
            field.diffuse(&self.open, p.diffusion);
            field.decay(p.decay);
        }
        self.steps += 1;
    }

    /// The deposits the last step made, summed (accounting).
    #[must_use]
    pub fn last_deposits(&self, which: Pheromone) -> f64 {
        self.deposits
            .iter()
            .filter(|d| d.0 == which)
            .map(|d| f64::from(d.3))
            .sum()
    }

    #[must_use]
    pub fn field(&self, which: Pheromone) -> &Field {
        match which {
            Pheromone::Home => &self.home_field,
            Pheromone::Food => &self.food_field,
        }
    }

    pub fn ants(&self) -> impl Iterator<Item = Ant> + '_ {
        self.ants.iter().copied()
    }

    #[must_use]
    pub fn len(&self) -> usize {
        self.ants.len()
    }

    /// Never true: a colony has at least one ant.
    #[must_use]
    pub fn is_empty(&self) -> bool {
        self.ants.is_empty()
    }

    #[must_use]
    pub const fn size(&self) -> (usize, usize) {
        (self.width, self.height)
    }

    /// `true` for an open cell, row-major.
    #[must_use]
    pub fn open(&self) -> &[bool] {
        &self.open
    }

    /// Food units per cell, row-major.
    #[must_use]
    pub fn food(&self) -> &[u16] {
        &self.food
    }

    #[must_use]
    pub const fn nest(&self) -> (f32, f32, f32) {
        self.nest
    }

    #[must_use]
    pub const fn params(&self) -> AntParams {
        self.params
    }

    #[must_use]
    pub const fn steps(&self) -> u64 {
        self.steps
    }

    /// Food units brought to the nest so far.
    #[must_use]
    pub const fn delivered(&self) -> u64 {
        self.delivered
    }

    /// Ants carrying food now.
    #[must_use]
    pub fn carrying(&self) -> u64 {
        self.ants.iter().map(|a| u64::from(a.carrying)).sum()
    }

    /// Food lying in the world now.
    #[must_use]
    pub fn food_in_world(&self) -> u64 {
        self.food.iter().map(|&f| u64::from(f)).sum()
    }

    /// Food painted in, less painted out: world + carried + delivered
    /// must equal it, always.
    #[must_use]
    pub const fn painted(&self) -> i64 {
        self.painted
    }

    /// The state's bytes for hashing (goldens): ants, then both fields.
    #[must_use]
    pub fn state_bytes(&self) -> Vec<u8> {
        let mut out = Vec::new();
        for a in &self.ants {
            for v in [a.x, a.y, a.cos, a.sin] {
                out.extend_from_slice(&v.to_le_bytes());
            }
            out.push(u8::from(a.carrying));
        }
        for f in [&self.home_field, &self.food_field] {
            for v in f.values() {
                out.extend_from_slice(&v.to_le_bytes());
            }
        }
        out
    }
}

/// `(c, s)` rotated by `angle` (radians): `libm`, so bit-identical on wasm.
fn rotate(c: f32, s: f32, angle: f32) -> (f32, f32) {
    if angle == 0.0 {
        return (c, s);
    }
    let (sn, cs) = (libm::sinf(angle), libm::cosf(angle));
    (c * cs - s * sn, c * sn + s * cs)
}

/// A random unit vector, without trig: a point in the unit disc.
fn unit(rng: &mut SplitMix64) -> (f32, f32) {
    loop {
        let (c, s) = (rng.range(-1.0, 1.0), rng.range(-1.0, 1.0));
        let len = (c * c + s * s).sqrt();
        if len > 1e-3 && len <= 1.0 {
            return (f64_to_f32(c / len), f64_to_f32(s / len));
        }
    }
}

#[cfg(test)]
mod tests;
