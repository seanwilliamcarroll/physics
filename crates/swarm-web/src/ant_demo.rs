//! [`AntDemo`]: an ant colony, its clock and its RGBA buffer. Safe Rust;
//! `ant_exports.rs` adapts it to the C ABI.

use core::num::NonZeroU32;

use math::convert::{f64_to_f32, usize_to_f64};
use swarm::{AntParams, Colony, Pheromone};
use web_common::FixedStep;

use crate::abi;
use crate::demo::BACKGROUND;

pub struct AntDemo {
    colony: Colony,
    clock: FixedStep,
    scale: usize,
    pixels: Vec<u32>,
}

const START_RATE: NonZeroU32 = match NonZeroU32::new(abi::DEFAULT_RATE_HZ) {
    Some(rate) => rate,
    None => NonZeroU32::MIN,
};

/// RGBA `u32`s (R in the low byte): walls, food, the nest's rim, ants.
const WALL: u32 = 0xff5a_524a;
const FOOD: u32 = 0xff3c_d2f0;
const NEST: u32 = 0xff6e_8cff;
const SEARCHING: u32 = 0xffe8_e8e8;
const CARRYING: u32 = 0xff28_a0ff;
/// A field value reads at full colour at this level (log scale below).
const FULL: f32 = 5.0;

impl AntDemo {
    /// A `width × height` world (cells) with `ant_count` ants at a nest an eighth
    /// of the way in, drawn at `scale` pixels a cell (1 to 8).
    #[must_use]
    pub fn new(
        width: usize,
        height: usize,
        ant_count: usize,
        scale: usize,
        seed: u64,
    ) -> Option<Self> {
        if scale == 0 || scale > 8 {
            return None;
        }
        let (width_f32, height_f32) = (
            f64_to_f32(usize_to_f64(width)),
            f64_to_f32(usize_to_f64(height)),
        );
        let nest = (
            width_f32 / 8.0,
            height_f32 / 2.0,
            (width_f32.min(height_f32) / 20.0).max(1.0),
        );
        let colony = Colony::new(width, height, ant_count, nest, AntParams::DEFAULT, seed)?;
        Some(Self {
            colony,
            clock: FixedStep::new(START_RATE),
            scale,
            pixels: vec![BACKGROUND; width * height * scale * scale],
        })
    }

    #[must_use]
    pub const fn colony(&self) -> &Colony {
        &self.colony
    }

    /// Runs the fixed steps `elapsed` seconds of real time pay for; returns how many.
    pub fn advance(&mut self, elapsed: f64) -> u32 {
        self.clock.run(elapsed, || self.colony.step())
    }

    pub const fn clock(&mut self) -> &mut FixedStep {
        &mut self.clock
    }

    pub const fn set_sensing(&mut self, on: bool) {
        self.colony.set_sensing(on);
    }

    /// Paints with a tool (`abi::TOOL_*`) at `(x, y)` (cells); returns
    /// what changed (food units, cells, or 1 for a moved nest); `None` for
    /// an unknown tool or a value out of range.
    pub fn paint(&mut self, tool: u32, x: f64, y: f64, radius: f64, amount: u32) -> Option<u64> {
        let in_range = x.is_finite()
            && y.is_finite()
            && radius.is_finite()
            && radius >= 0.0
            && radius <= f64::from(abi::MAX_ANT_BRUSH);
        if !in_range {
            return None;
        }
        let (x, y, radius) = (f64_to_f32(x), f64_to_f32(y), f64_to_f32(radius));
        Some(match tool {
            abi::TOOL_FOOD => {
                let amount = u16::try_from(amount)
                    .ok()
                    .filter(|&food| u32::from(food) <= abi::MAX_FOOD)?;
                self.colony.paint_food(x, y, radius, amount)
            }
            abi::TOOL_WALL => u64::try_from(self.colony.paint_wall(x, y, radius)).unwrap_or(0),
            abi::TOOL_ERASE => u64::try_from(self.colony.erase(x, y, radius)).unwrap_or(0),
            abi::TOOL_NEST => u64::from(self.colony.set_nest(x, y, radius.max(1.0))),
            _ => return None,
        })
    }

    /// Sets one constant (`abi::ANT_*`); `false` for an unknown code or a
    /// value that makes them unusable (nothing changed).
    pub fn set_param(&mut self, code: u32, value: f64) -> bool {
        let mut params = self.colony.params();
        let Some(slot) = slot(&mut params, code) else {
            return false;
        };
        *slot = f64_to_f32(value);
        self.colony.set_params(params)
    }

    /// One constant, or `None` for an unknown code.
    #[must_use]
    pub fn param(&self, code: u32) -> Option<f64> {
        let mut params = self.colony.params();
        slot(&mut params, code).map(|value| f64::from(*value))
    }

    #[must_use]
    pub const fn view(&self) -> (usize, usize) {
        let (width, height) = self.colony.size();
        (width * self.scale, height * self.scale)
    }

    /// Draws the world: each cell its wall, food, or the two fields (home
    /// blue, food green, on a log scale); the nest's rim; the ants.
    pub fn render(&mut self) -> &[u32] {
        let (width, height) = self.colony.size();
        let scale = self.scale;
        let view_width = width * scale;
        let (home_field, food_field) = (
            self.colony.field(Pheromone::Home).values(),
            self.colony.field(Pheromone::Food).values(),
        );
        let (open, food) = (self.colony.open(), self.colony.food());
        let level = |value: f32| -> u32 {
            let intensity = libm::log1pf(value.max(0.0) * 50.0) / libm::log1pf(FULL * 50.0);
            u32::try_from(
                math::convert::f64_to_usize(f64::from((intensity.min(1.0) * 255.0).round()))
                    .unwrap_or(0),
            )
            .unwrap_or(0)
        };
        for cell_y in 0..height {
            for cell_x in 0..width {
                let index = cell_y * width + cell_x;
                let colour = if !open.get(index).copied().unwrap_or(true) {
                    WALL
                } else if food.get(index).copied().unwrap_or(0) > 0 {
                    FOOD
                } else {
                    let (blue_add, green_add) = (
                        level(home_field.get(index).copied().unwrap_or(0.0)),
                        level(food_field.get(index).copied().unwrap_or(0.0)),
                    );
                    let base = BACKGROUND;
                    let (base_red, base_green, base_blue) =
                        (base & 0xff, (base >> 8) & 0xff, (base >> 16) & 0xff);
                    let mix = |channel: u32, add: u32| (channel + add).min(255);
                    0xff00_0000
                        | (mix(base_blue, blue_add) << 16)
                        | (mix(base_green, green_add) << 8)
                        | base_red
                };
                for pixel_y in cell_y * scale..(cell_y + 1) * scale {
                    for pixel_x in cell_x * scale..(cell_x + 1) * scale {
                        if let Some(pixel) = self.pixels.get_mut(pixel_y * view_width + pixel_x) {
                            *pixel = colour;
                        }
                    }
                }
            }
        }
        let (nest_x, nest_y, nest_radius) = self.colony.nest();
        for step in 0..72_u8 {
            let angle = f32::from(step) * core::f32::consts::TAU / 72.0;
            self.dot(
                nest_x + nest_radius * libm::cosf(angle),
                nest_y + nest_radius * libm::sinf(angle),
                NEST,
            );
        }
        let ants: Vec<(f32, f32, bool)> = self
            .colony
            .ants()
            .map(|ant| (ant.x, ant.y, ant.carrying))
            .collect();
        for (x, y, carrying) in ants {
            self.dot(x, y, if carrying { CARRYING } else { SEARCHING });
        }
        &self.pixels
    }

    fn dot(&mut self, x: f32, y: f32, colour: u32) {
        let (width, height) = self.colony.size();
        let scale = self.scale;
        let to_cell = |coordinate: f32| math::convert::f64_to_usize(f64::from(coordinate.floor()));
        let (Some(cell_x), Some(cell_y)) = (to_cell(x), to_cell(y)) else {
            return;
        };
        if cell_x >= width || cell_y >= height {
            return;
        }
        for pixel_y in cell_y * scale..(cell_y + 1) * scale {
            for pixel_x in cell_x * scale..(cell_x + 1) * scale {
                if let Some(pixel) = self.pixels.get_mut(pixel_y * width * scale + pixel_x) {
                    *pixel = colour;
                }
            }
        }
    }
}

fn slot(params: &mut AntParams, code: u32) -> Option<&mut f32> {
    Some(match code {
        abi::ANT_SENSOR_ANGLE => &mut params.sensor_angle,
        abi::ANT_SENSOR_DISTANCE => &mut params.sensor_distance,
        abi::ANT_TURN => &mut params.turn,
        abi::ANT_WIGGLE => &mut params.wiggle,
        abi::ANT_SPEED => &mut params.speed,
        abi::ANT_DEPOSIT => &mut params.deposit,
        abi::ANT_FALLOFF => &mut params.falloff,
        abi::ANT_DIFFUSION => &mut params.diffusion,
        abi::ANT_DECAY => &mut params.decay,
        _ => return None,
    })
}

#[cfg(test)]
mod tests;
