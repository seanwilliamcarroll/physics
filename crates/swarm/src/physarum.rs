//! [`Slime`]: the Physarum model (`docs/15-swarm.md`, "Physarum"; Jones
//! 2010). One periodic field; agents that sense it at three points ahead,
//! turn toward the strongest, move, and deposit into it; the field
//! diffuses (the 3 × 3 mean filter) and decays.

use math::SplitMix64;
use math::convert::{f64_to_f32, f64_to_usize, usize_to_f64};

use crate::Field;

pub const MAX_AGENTS: usize = 1 << 21;

/// The model's constants: our values (Jones's paper wasn't read; these are
/// the values commonly reported for it: `docs/15-swarm.md`, "Physarum").
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct SlimeParams {
    pub sensor_angle: f32,
    pub sensor_offset: f32,
    pub turn: f32,
    pub step_distance: f32,
    pub deposit: f32,
    /// The fraction diffused to neighbours a step (8/9: the mean filter).
    pub diffusion: f32,
    pub decay: f32,
}

impl SlimeParams {
    /// SA 22.5°, SO 9, RA 45°, SS 1, deposit 5, the mean filter, decay 0.1.
    pub const DEFAULT: Self = Self {
        sensor_angle: core::f32::consts::FRAC_PI_8,
        sensor_offset: 9.0,
        turn: core::f32::consts::FRAC_PI_4,
        step_distance: 1.0,
        deposit: 5.0,
        diffusion: 8.0 / 9.0,
        decay: 0.1,
    };

    /// `self` if usable: angles in `[0, π]`, offset `≥ 0`, deposit in
    /// `[0, MAX_DEPOSIT]`, step distance `> 0` and under half the world,
    /// the rates in `[0, 1]`.
    #[must_use]
    pub fn checked(self) -> Option<Self> {
        let pi = core::f32::consts::PI;
        let ok = (0.0..=pi).contains(&self.sensor_angle)
            && (0.0..=pi).contains(&self.turn)
            && self.sensor_offset.is_finite()
            && self.sensor_offset >= 0.0
            && self.step_distance.is_finite()
            && self.step_distance > 0.0
            && (0.0..=crate::MAX_DEPOSIT).contains(&self.deposit)
            && (0.0..=1.0).contains(&self.diffusion)
            && (0.0..=1.0).contains(&self.decay);
        ok.then_some(self)
    }
}

/// The cell index holding `coordinate` wrapped: `floor(coordinate) mod side`. One add within a
/// world-width outside, else `rem_euclid` (an `fmod` call: on every lookup it was 40% of a step;
/// `docs/profiling.md`).
fn wrap_cell(coordinate: f32, side: usize) -> usize {
    let (floor, side_length) = (f64::from(coordinate.floor()), usize_to_f64(side));
    let wrapped = if (0.0..side_length).contains(&floor) {
        floor
    } else if (-side_length..0.0).contains(&floor) {
        floor + side_length
    } else if (side_length..2.0 * side_length).contains(&floor) {
        floor - side_length
    } else {
        floor.rem_euclid(side_length)
    };
    f64_to_usize(wrapped).unwrap_or(0).min(side - 1)
}

/// `position` wrapped into `[0, side_length)`: exactly `rem_euclid`, without the `fmod` call
/// when within one side outside. A sum that rounds up to `side_length` becomes 0.
fn wrap_position(position: f32, side_length: f32) -> f32 {
    let wrapped = if (0.0..side_length).contains(&position) {
        position
    } else if position > -side_length && position < 0.0 {
        // Not −side_length itself: `rem_euclid` gives −0 there, and this
        // would give +0.
        position + side_length
    } else if (side_length..2.0 * side_length).contains(&position) {
        position - side_length
    } else {
        position.rem_euclid(side_length)
    };
    if wrapped >= side_length { 0.0 } else { wrapped }
}

#[derive(Clone, Debug)]
pub struct Slime {
    side: usize,
    field: Field,
    // The agents, one entry each in x, y and the heading's cos and sin.
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
    /// The last step's agent deposits: (cell index, amount).
    deposits: Vec<(usize, f32)>,
}

impl Slime {
    /// `agent_count` agents at random positions and headings on a
    /// `side × side` periodic field. `None` for a bad size, count or
    /// params.
    #[must_use]
    pub fn new(side: usize, agent_count: usize, params: SlimeParams, seed: u64) -> Option<Self> {
        let params = params.checked()?;
        let field = Field::new(side, side)?;
        if !(1..=MAX_AGENTS).contains(&agent_count)
            || f64::from(params.step_distance) >= usize_to_f64(side) / 2.0
        {
            return None;
        }
        let mut rng = SplitMix64::new(seed);
        let side_length = usize_to_f64(side);
        let (mut x, mut y, mut cos, mut sin) = (
            Vec::with_capacity(agent_count),
            Vec::with_capacity(agent_count),
            Vec::with_capacity(agent_count),
            Vec::with_capacity(agent_count),
        );
        for _ in 0..agent_count {
            x.push(
                f64_to_f32(rng.range(0.0, side_length))
                    .min(f64_to_f32(side_length) * (1.0 - f32::EPSILON)),
            );
            y.push(
                f64_to_f32(rng.range(0.0, side_length))
                    .min(f64_to_f32(side_length) * (1.0 - f32::EPSILON)),
            );
            // A direction, without trig: a point in the unit disc.
            let (heading_cos, heading_sin) = loop {
                let (disc_x, disc_y) = (rng.range(-1.0, 1.0), rng.range(-1.0, 1.0));
                let length = (disc_x * disc_x + disc_y * disc_y).sqrt();
                if length > 1e-3 && length <= 1.0 {
                    break (disc_x / length, disc_y / length);
                }
            };
            cos.push(f64_to_f32(heading_cos));
            sin.push(f64_to_f32(heading_sin));
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

    fn cell(&self, x: f32, y: f32) -> usize {
        let side = self.side;
        wrap_cell(y, side) * side + wrap_cell(x, side)
    }

    pub fn step(&mut self) {
        let params = self.params;
        let side_length = f64_to_f32(usize_to_f64(self.side));
        let (sensor_cos, sensor_sin) = (
            libm::cosf(params.sensor_angle),
            libm::sinf(params.sensor_angle),
        );
        let (turn_cos, turn_sin) = (libm::cosf(params.turn), libm::sinf(params.turn));
        self.deposits.clear();
        for agent_index in 0..self.x.len() {
            let (Some(&x), Some(&y), Some(&cos), Some(&sin)) = (
                self.x.get(agent_index),
                self.y.get(agent_index),
                self.cos.get(agent_index),
                self.sin.get(agent_index),
            ) else {
                continue;
            };
            // One draw per agent per step: the stream stays aligned.
            let roll = self.rng.next_unit_f64();
            // The field at the sensor ahead, at the angle off the heading
            // whose cos and sin are given.
            let sense = |offset_cos: f32, offset_sin: f32| {
                let (sense_cos, sense_sin) = (
                    cos * offset_cos - sin * offset_sin,
                    cos * offset_sin + sin * offset_cos,
                );
                let sensed_cell = self.cell(
                    x + params.sensor_offset * sense_cos,
                    y + params.sensor_offset * sense_sin,
                );
                self.field.values().get(sensed_cell).copied().unwrap_or(0.0)
            };
            // −1: turn by −RA; 0: straight; 1: by +RA.
            let turn_direction: i8 = if self.sensing {
                let (left, front, right) = (
                    sense(sensor_cos, -sensor_sin),
                    sense(1.0, 0.0),
                    sense(sensor_cos, sensor_sin),
                );
                if front > left && front > right {
                    0
                } else if front < left && front < right {
                    if roll < 0.5 { -1 } else { 1 }
                } else if left > right {
                    -1
                } else {
                    i8::from(right > left)
                }
            } else if roll < 1.0 / 3.0 {
                -1
            } else {
                i8::from(roll >= 2.0 / 3.0)
            };
            let (new_cos, new_sin) = match turn_direction {
                -1 => (
                    cos * turn_cos + sin * turn_sin,
                    sin * turn_cos - cos * turn_sin,
                ),
                1 => (
                    cos * turn_cos - sin * turn_sin,
                    sin * turn_cos + cos * turn_sin,
                ),
                _ => (cos, sin),
            };
            let (new_x, new_y) = (
                wrap_position(x + params.step_distance * new_cos, side_length),
                wrap_position(y + params.step_distance * new_sin, side_length),
            );
            let landing_cell = self.cell(new_x, new_y);
            self.deposits.push((landing_cell, params.deposit));
            if let (Some(x_slot), Some(y_slot), Some(cos_slot), Some(sin_slot)) = (
                self.x.get_mut(agent_index),
                self.y.get_mut(agent_index),
                self.cos.get_mut(agent_index),
                self.sin.get_mut(agent_index),
            ) {
                (*x_slot, *y_slot, *cos_slot, *sin_slot) = (new_x, new_y, new_cos, new_sin);
            }
        }
        let side = self.side;
        for &(cell, amount) in &self.deposits {
            self.field.deposit(cell % side, cell / side, amount);
        }
        for &(x, y, amount) in &self.nodes {
            self.field.deposit(x, y, amount);
        }
        self.field.diffuse_periodic(params.diffusion);
        self.field.decay(params.decay);
        self.steps += 1;
    }

    /// Adds a fixed source at cell `(x, y)` depositing `amount` a step (a
    /// nutrient node); `false` outside or for a bad amount (negative, not
    /// a number, or over [`MAX_DEPOSIT`](crate::MAX_DEPOSIT)).
    pub fn add_node(&mut self, x: usize, y: usize, amount: f32) -> bool {
        let ok = x < self.side && y < self.side && (0.0..=crate::MAX_DEPOSIT).contains(&amount);
        if ok {
            self.nodes.push((x, y, amount));
        }
        ok
    }

    pub fn clear_nodes(&mut self) {
        self.nodes.clear();
    }

    #[must_use]
    pub fn nodes(&self) -> &[(usize, usize, f32)] {
        &self.nodes
    }

    pub const fn set_sensing(&mut self, on: bool) {
        self.sensing = on;
    }

    pub fn set_params(&mut self, params: SlimeParams) -> bool {
        let fits = f64::from(params.step_distance) < usize_to_f64(self.side) / 2.0;
        match params.checked() {
            Some(checked) if fits => {
                self.params = checked;
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

    /// Never true: a system has at least one agent.
    #[must_use]
    pub fn is_empty(&self) -> bool {
        self.x.is_empty()
    }

    #[must_use]
    pub const fn steps(&self) -> u64 {
        self.steps
    }

    pub fn positions(&self) -> impl Iterator<Item = (f32, f32)> + '_ {
        self.x.iter().copied().zip(self.y.iter().copied())
    }

    #[must_use]
    pub fn last_deposits(&self) -> f64 {
        self.deposits
            .iter()
            .map(|&(_, amount)| f64::from(amount))
            .sum::<f64>()
            + self
                .nodes
                .iter()
                .map(|&(_, _, amount)| f64::from(amount))
                .sum::<f64>()
    }

    #[must_use]
    pub fn state_bytes(&self) -> Vec<u8> {
        let mut bytes = Vec::new();
        for column in [&self.x, &self.y, &self.cos, &self.sin] {
            for value in column {
                bytes.extend_from_slice(&value.to_le_bytes());
            }
        }
        for value in self.field.values() {
            bytes.extend_from_slice(&value.to_le_bytes());
        }
        bytes
    }
}

#[cfg(test)]
mod tests;
