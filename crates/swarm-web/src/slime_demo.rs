//! [`SlimeDemo`]: a Physarum system, its clock and an RGBA view of the field.
//! Safe Rust; `slime_exports.rs` adapts it to the C ABI.

use core::num::NonZeroU32;

use math::convert::{f64_to_f32, f64_to_usize, usize_to_f64};
use swarm::{Slime, SlimeParams};
use web_common::FixedStep;

use crate::abi;
use crate::demo::BACKGROUND;

pub struct SlimeDemo {
    slime: Slime,
    clock: FixedStep,
    scale: usize,
    pixels: Vec<u32>,
    ramp: [u32; 256],
}

const START_RATE: NonZeroU32 = match NonZeroU32::new(abi::DEFAULT_RATE_HZ) {
    Some(rate) => rate,
    None => NonZeroU32::MIN,
};

/// The field value drawn at half intensity: `t = v / (v + HALF)`.
const HALF: f32 = 5.0;

/// The ramp's stops (position, RGB): the background, teal, amber, near
/// white.
const STOPS: [(f64, [f64; 3]); 4] = [
    (0.0, [22.0, 26.0, 34.0]),
    (0.4, [31.0, 111.0, 139.0]),
    (0.75, [227.0, 179.0, 65.0]),
    (1.0, [255.0, 244.0, 194.0]),
];

impl SlimeDemo {
    /// `agent_count` agents on a `side × side` periodic field, drawn `scale` px a
    /// cell (1 to 4).
    #[must_use]
    pub fn new(side: usize, agent_count: usize, scale: usize, seed: u64) -> Option<Self> {
        if !(1..=4).contains(&scale) {
            return None;
        }
        let slime = Slime::new(side, agent_count, SlimeParams::DEFAULT, seed)?;
        Some(Self {
            slime,
            clock: FixedStep::new(START_RATE),
            scale,
            pixels: vec![BACKGROUND; side * side * scale * scale],
            ramp: core::array::from_fn(|index| ramp(usize_to_f64(index) / 255.0)),
        })
    }

    #[must_use]
    pub const fn slime(&self) -> &Slime {
        &self.slime
    }

    /// Runs the fixed steps `elapsed` seconds of real time pay for; returns how many.
    pub fn advance(&mut self, elapsed: f64) -> u32 {
        self.clock.run(elapsed, || self.slime.step())
    }

    pub const fn clock(&mut self) -> &mut FixedStep {
        &mut self.clock
    }

    pub const fn set_sensing(&mut self, on: bool) {
        self.slime.set_sensing(on);
    }

    /// A node at cell `(x, y)` depositing `amount` a step; `false` outside,
    /// for a bad amount, or past [`MAX_NODES`](abi::MAX_NODES).
    pub fn add_node(&mut self, x: f64, y: f64, amount: f64) -> bool {
        let cell = |coordinate: f64| {
            if coordinate.is_finite() && coordinate >= 0.0 {
                f64_to_usize(coordinate.floor())
            } else {
                None
            }
        };
        let room =
            u32::try_from(self.slime.nodes().len()).is_ok_and(|count| count < abi::MAX_NODES);
        match (cell(x), cell(y), room) {
            (Some(cell_x), Some(cell_y), true) => {
                self.slime.add_node(cell_x, cell_y, f64_to_f32(amount))
            }
            _ => false,
        }
    }

    pub fn clear_nodes(&mut self) {
        self.slime.clear_nodes();
    }

    /// Sets a constant (`abi::SLIME_*`); `false` for an unknown code or an
    /// unusable value (nothing changed).
    pub fn set_param(&mut self, code: u32, value: f64) -> bool {
        let mut params = self.slime.params();
        let Some(slot) = slot(&mut params, code) else {
            return false;
        };
        *slot = f64_to_f32(value);
        self.slime.set_params(params)
    }

    /// A constant, or `None` for an unknown code.
    #[must_use]
    pub fn param(&self, code: u32) -> Option<f64> {
        let mut params = self.slime.params();
        slot(&mut params, code).map(|value| f64::from(*value))
    }

    #[must_use]
    pub const fn view(&self) -> usize {
        self.slime.side() * self.scale
    }

    /// Draws the field through the ramp, `v / (v + HALF)` on it.
    pub fn render(&mut self) -> &[u32] {
        let (side, scale) = (self.slime.side(), self.scale);
        let view_width = side * scale;
        let values = self.slime.field().values();
        for cell_y in 0..side {
            for cell_x in 0..side {
                let value = values
                    .get(cell_y * side + cell_x)
                    .copied()
                    .unwrap_or(0.0)
                    .max(0.0);
                let intensity = value / (value + HALF);
                let ramp_index = f64_to_usize(f64::from((intensity * 255.0).round()))
                    .unwrap_or(0)
                    .min(255);
                let colour = self.ramp.get(ramp_index).copied().unwrap_or(BACKGROUND);
                for pixel_y in cell_y * scale..(cell_y + 1) * scale {
                    if let Some(row) = self.pixels.get_mut(
                        pixel_y * view_width + cell_x * scale
                            ..pixel_y * view_width + (cell_x + 1) * scale,
                    ) {
                        row.fill(colour);
                    }
                }
            }
        }
        &self.pixels
    }
}

/// The ramp at `position` (0 to 1), linear between the stops, as RGBA `u32`.
fn ramp(position: f64) -> u32 {
    let mix = |[from_red, from_green, from_blue]: [f64; 3],
               [to_red, to_green, to_blue]: [f64; 3],
               fraction: f64| {
        [
            from_red + (to_red - from_red) * fraction,
            from_green + (to_green - from_green) * fraction,
            from_blue + (to_blue - from_blue) * fraction,
        ]
    };
    let last = STOPS.last().map_or([255.0; 3], |stop| stop.1);
    let [red, green, blue] = STOPS
        .iter()
        .zip(STOPS.iter().skip(1))
        .find(|(_, upper)| position <= upper.0)
        .map_or(last, |(lower, upper)| {
            let fraction = ((position - lower.0) / (upper.0 - lower.0)).clamp(0.0, 1.0);
            mix(lower.1, upper.1, fraction)
        });
    let byte = |channel: f64| {
        u32::try_from(f64_to_usize(channel.round()).unwrap_or(0).min(255)).unwrap_or(0)
    };
    0xff00_0000 | (byte(blue) << 16) | (byte(green) << 8) | byte(red)
}

fn slot(params: &mut SlimeParams, code: u32) -> Option<&mut f32> {
    Some(match code {
        abi::SLIME_SENSOR_ANGLE => &mut params.sensor_angle,
        abi::SLIME_SENSOR_OFFSET => &mut params.sensor_offset,
        abi::SLIME_TURN => &mut params.turn,
        abi::SLIME_STEP => &mut params.step_distance,
        abi::SLIME_DEPOSIT => &mut params.deposit,
        abi::SLIME_DIFFUSION => &mut params.diffusion,
        abi::SLIME_DECAY => &mut params.decay,
        _ => return None,
    })
}

#[cfg(test)]
mod tests;
