//! [`Colony`]: ant foraging (`docs/15-swarm.md`, "Ant foraging"). A grid
//! world (walls, integer food, a nest), two pheromone [`Field`]s, and ants
//! that sense one field, turn, move, pick up and deliver food, and deposit
//! into the other.

use math::SplitMix64;
use math::convert::{f64_to_f32, f64_to_usize};

use crate::Field;

pub const MAX_ANTS: usize = 1 << 18;

/// The ants' constants (all our choices, measured: `docs/15-swarm.md`,
/// "The ants as built"). Angles in radians, distances in cells, per step.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct AntParams {
    pub sensor_angle: f32,
    pub sensor_distance: f32,
    pub turn: f32,
    /// A random turn each step, uniform in `[−wiggle, wiggle]`.
    pub wiggle: f32,
    pub speed: f32,
    pub deposit: f32,
    /// k: the deposit's fall-off, `q · e^(−k s)` after `s` steps.
    pub falloff: f32,
    /// D: the fraction each cell diffuses to its neighbours a step.
    pub diffusion: f32,
    /// E: the fraction that evaporates a step.
    pub decay: f32,
}

impl AntParams {
    /// Wiggle, fall-off, diffusion and decay from a scan: the best worst-of-four-seeds
    /// (`docs/15-swarm.md`, "The ants as built").
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

    /// The best of `examples/evolve_ants.rs` (`docs/15-swarm.md`, "The ants evolved"). Held out:
    /// 5,394 delivered against the defaults' 1,701, and 3,978 against 404 in the unseen barriers
    /// scene.
    pub const EVOLVED: Self = Self {
        sensor_angle: 1.392_224_1,
        sensor_distance: 1.674_356_8,
        turn: 0.573_285_6,
        wiggle: 0.050_456_405,
        speed: 1.0,
        deposit: 1.0,
        falloff: 0.187_099_08,
        diffusion: 0.5,
        decay: 0.006_431_879_5,
    };

    /// `self` if every value is finite and in range: angles in `[0, π]`,
    /// distances, speed and deposit `≥ 0` (speed `> 0`), the rates in
    /// `[0, 1]`.
    #[must_use]
    pub fn checked(self) -> Option<Self> {
        let pi = core::f32::consts::PI;
        let ok = [self.sensor_angle, self.turn, self.wiggle]
            .iter()
            .all(|angle| (0.0..=pi).contains(angle))
            && self.sensor_distance.is_finite()
            && self.sensor_distance >= 0.0
            && self.speed.is_finite()
            && self.speed > 0.0
            && (0.0..=crate::MAX_DEPOSIT).contains(&self.deposit)
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
    pub steps_since_leaving: u32,
}

#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub enum Pheromone {
    /// Laid by searching ants: it leads home.
    Home,
    /// Laid by carrying ants: it leads to food.
    Food,
}

#[derive(Copy, Clone, Debug)]
struct Deposit {
    pheromone: Pheromone,
    x: usize,
    y: usize,
    amount: f32,
}

#[derive(Clone, Debug)]
pub struct Colony {
    width: usize,
    height: usize,
    open: Vec<bool>,
    /// Each cell's open neighbours, for the fields' diffusion: recounted
    /// only when walls change (`Field::diffuse_counted`).
    neighbours: Vec<u8>,
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
    painted: i64,
    deposits: Vec<Deposit>,
}

impl Colony {
    /// A `width × height` world, open and empty, with `ant_count` ants at
    /// the nest (a disc at `(x, y)` of radius `radius`, cells, given as
    /// `nest`) heading at random. `None` for a bad size, count, nest or
    /// params.
    #[must_use]
    pub fn new(
        width: usize,
        height: usize,
        ant_count: usize,
        nest: (f32, f32, f32),
        params: AntParams,
        seed: u64,
    ) -> Option<Self> {
        let params = params.checked()?;
        let (home_field, food_field) = (Field::new(width, height)?, Field::new(width, height)?);
        let (nest_x, nest_y, nest_radius) = nest;
        let in_world = |coordinate: f32, side: usize| {
            coordinate.is_finite()
                && coordinate >= 0.0
                && u32::try_from(side).is_ok_and(|side| f64::from(coordinate) < f64::from(side))
        };
        let usable = (1..=MAX_ANTS).contains(&ant_count)
            && in_world(nest_x, width)
            && in_world(nest_y, height)
            && nest_radius.is_finite()
            && nest_radius > 0.0;
        if !usable {
            return None;
        }
        let mut rng = SplitMix64::new(seed);
        let ants = (0..ant_count)
            .map(|_| {
                let (cos, sin) = random_heading(&mut rng);
                Ant {
                    x: nest_x,
                    y: nest_y,
                    cos,
                    sin,
                    carrying: false,
                    steps_since_leaving: 0,
                }
            })
            .collect();
        let mut colony = Self {
            width,
            height,
            open: vec![true; width * height],
            neighbours: Vec::new(),
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
        };
        colony.recount();
        Some(colony)
    }

    fn recount(&mut self) {
        self.neighbours = self.home_field.open_neighbours(&self.open);
    }

    /// The row-major index of the cell holding `(x, y)`, or `None` outside
    /// the world.
    fn index(&self, x: f32, y: f32) -> Option<usize> {
        let (cell_x, cell_y) = (
            f64_to_usize(f64::from(x.floor()))?,
            f64_to_usize(f64::from(y.floor()))?,
        );
        (cell_x < self.width && cell_y < self.height).then(|| cell_y * self.width + cell_x)
    }

    fn in_nest(&self, x: f32, y: f32) -> bool {
        let (nest_x, nest_y, nest_radius) = self.nest;
        (x - nest_x) * (x - nest_x) + (y - nest_y) * (y - nest_y) <= nest_radius * nest_radius
    }

    /// Moves the nest; `false` (unchanged) for a centre outside the world
    /// or a radius not positive. **Before the first step the ants move with
    /// it** (they start at the nest: a scene places it after creating the
    /// colony); after, they stay where they are.
    pub fn set_nest(&mut self, x: f32, y: f32, radius: f32) -> bool {
        let world_width = f64::from(u32::try_from(self.width).unwrap_or(u32::MAX));
        let world_height = f64::from(u32::try_from(self.height).unwrap_or(u32::MAX));
        let ok = x.is_finite()
            && y.is_finite()
            && radius.is_finite()
            && radius > 0.0
            && x >= 0.0
            && y >= 0.0
            && f64::from(x) < world_width
            && f64::from(y) < world_height;
        if ok {
            self.nest = (x, y, radius);
            if self.steps == 0 {
                for ant in &mut self.ants {
                    (ant.x, ant.y) = (x, y);
                }
            }
        }
        ok
    }

    /// Sensing on (the default) or off: off, ants turn at random (a
    /// random walk with the same speed and turns: the baseline).
    pub const fn set_sensing(&mut self, on: bool) {
        self.sensing = on;
    }

    pub fn set_params(&mut self, params: AntParams) -> bool {
        params
            .checked()
            .map(|checked| self.params = checked)
            .is_some()
    }

    /// The followed field at `(x, y)`; a wall or the outside reads −1 (worse
    /// than any trail).
    fn sense(&self, pheromone: Pheromone, x: f32, y: f32) -> f32 {
        let field = match pheromone {
            Pheromone::Home => &self.home_field,
            Pheromone::Food => &self.food_field,
        };
        match self.index(x, y) {
            Some(cell) if self.open.get(cell).copied().unwrap_or(false) => {
                field.values().get(cell).copied().unwrap_or(-1.0)
            }
            _ => -1.0,
        }
    }

    pub fn step(&mut self) {
        let params = self.params;
        self.deposits.clear();
        for ant_index in 0..self.ants.len() {
            let Some(mut ant) = self.ants.get(ant_index).copied() else {
                continue;
            };
            // Two draws per ant per step, whatever happens: the stream
            // stays aligned.
            let (turn_roll, wiggle_roll) = (self.rng.next_unit_f64(), self.rng.next_unit_f64());
            let followed = if ant.carrying {
                Pheromone::Home
            } else {
                Pheromone::Food
            };
            let turn = if self.sensing {
                let sense_at_angle = |angle: f32| {
                    let (cos, sin) = rotate(ant.cos, ant.sin, angle);
                    self.sense(
                        followed,
                        ant.x + params.sensor_distance * cos,
                        ant.y + params.sensor_distance * sin,
                    )
                };
                let (left, front, right) = (
                    sense_at_angle(-params.sensor_angle),
                    sense_at_angle(0.0),
                    sense_at_angle(params.sensor_angle),
                );
                turn_toward_stronger(left, front, right, turn_roll, params.turn)
            } else {
                f64_to_f32((turn_roll * 2.0 - 1.0) * f64::from(params.turn))
            };
            let wiggle = f64_to_f32((wiggle_roll * 2.0 - 1.0) * f64::from(params.wiggle));
            (ant.cos, ant.sin) = rotate(ant.cos, ant.sin, turn + wiggle);
            let (new_x, new_y) = (
                ant.x + params.speed * ant.cos,
                ant.y + params.speed * ant.sin,
            );
            match self.index(new_x, new_y) {
                Some(cell) if self.open.get(cell).copied().unwrap_or(false) => {
                    (ant.x, ant.y) = (new_x, new_y);
                }
                _ => (ant.cos, ant.sin) = (-ant.cos, -ant.sin),
            }
            let cell = self.index(ant.x, ant.y);
            if ant.carrying {
                if self.in_nest(ant.x, ant.y) {
                    self.delivered += 1;
                    ant.carrying = false;
                    ant.steps_since_leaving = 0;
                    (ant.cos, ant.sin) = (-ant.cos, -ant.sin);
                }
            } else if let Some(food) = cell
                .and_then(|cell| self.food.get_mut(cell))
                .filter(|food| **food > 0)
            {
                *food -= 1;
                ant.carrying = true;
                ant.steps_since_leaving = 0;
                (ant.cos, ant.sin) = (-ant.cos, -ant.sin);
            } else if self.in_nest(ant.x, ant.y) {
                ant.steps_since_leaving = 0;
            }
            let laid = if ant.carrying {
                Pheromone::Food
            } else {
                Pheromone::Home
            };
            let amount = params.deposit
                * libm::expf(-params.falloff * f64_to_f32(f64::from(ant.steps_since_leaving)));
            if let (Some(cell_x), Some(cell_y)) = (
                f64_to_usize(f64::from(ant.x.floor())),
                f64_to_usize(f64::from(ant.y.floor())),
            ) {
                self.deposits.push(Deposit {
                    pheromone: laid,
                    x: cell_x,
                    y: cell_y,
                    amount,
                });
            }
            ant.steps_since_leaving = ant.steps_since_leaving.saturating_add(1);
            if let Some(slot) = self.ants.get_mut(ant_index) {
                *slot = ant;
            }
        }
        for deposit in &self.deposits {
            let field = match deposit.pheromone {
                Pheromone::Home => &mut self.home_field,
                Pheromone::Food => &mut self.food_field,
            };
            field.deposit(deposit.x, deposit.y, deposit.amount);
        }
        for field in [&mut self.home_field, &mut self.food_field] {
            field.diffuse_counted(&self.open, &self.neighbours, params.diffusion);
            field.decay(params.decay);
        }
        self.steps += 1;
    }

    #[must_use]
    pub fn last_deposits(&self, pheromone: Pheromone) -> f64 {
        self.deposits
            .iter()
            .filter(|deposit| deposit.pheromone == pheromone)
            .map(|deposit| f64::from(deposit.amount))
            .sum()
    }

    #[must_use]
    pub fn field(&self, pheromone: Pheromone) -> &Field {
        match pheromone {
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

    #[must_use]
    pub fn open(&self) -> &[bool] {
        &self.open
    }

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

    #[must_use]
    pub const fn delivered(&self) -> u64 {
        self.delivered
    }

    #[must_use]
    pub fn carrying(&self) -> u64 {
        self.ants.iter().map(|ant| u64::from(ant.carrying)).sum()
    }

    #[must_use]
    pub fn food_in_world(&self) -> u64 {
        self.food.iter().map(|&units| u64::from(units)).sum()
    }

    /// Food painted in, less painted out: world + carried + delivered
    /// must equal it, always.
    #[must_use]
    pub const fn painted(&self) -> i64 {
        self.painted
    }

    #[must_use]
    pub fn state_bytes(&self) -> Vec<u8> {
        let mut bytes = Vec::new();
        for ant in &self.ants {
            for value in [ant.x, ant.y, ant.cos, ant.sin] {
                bytes.extend_from_slice(&value.to_le_bytes());
            }
            bytes.push(u8::from(ant.carrying));
        }
        for field in [&self.home_field, &self.food_field] {
            for value in field.values() {
                bytes.extend_from_slice(&value.to_le_bytes());
            }
        }
        bytes
    }
}

/// The turn (radians, negative is left) toward the strongest of the three
/// sensor readings: straight if the front is strongest, a coin flip
/// (`turn_roll < 0.5`) if both sides beat it, else toward the stronger side.
fn turn_toward_stronger(left: f32, front: f32, right: f32, turn_roll: f64, turn: f32) -> f32 {
    if front > left && front > right {
        0.0
    } else if front < left && front < right {
        if turn_roll < 0.5 { -turn } else { turn }
    } else if left > right {
        -turn
    } else if right > left {
        turn
    } else {
        0.0
    }
}

/// The heading `(cos, sin)` rotated by `angle` (radians): `libm`, so
/// bit-identical on wasm.
fn rotate(cos: f32, sin: f32, angle: f32) -> (f32, f32) {
    if angle == 0.0 {
        return (cos, sin);
    }
    let (angle_sin, angle_cos) = (libm::sinf(angle), libm::cosf(angle));
    (
        cos * angle_cos - sin * angle_sin,
        cos * angle_sin + sin * angle_cos,
    )
}

fn random_heading(rng: &mut SplitMix64) -> (f32, f32) {
    loop {
        let (x, y) = (rng.range(-1.0, 1.0), rng.range(-1.0, 1.0));
        let length = (x * x + y * y).sqrt();
        if length > 1e-3 && length <= 1.0 {
            return (f64_to_f32(x / length), f64_to_f32(y / length));
        }
    }
}

mod paint;
#[cfg(test)]
mod tests;
