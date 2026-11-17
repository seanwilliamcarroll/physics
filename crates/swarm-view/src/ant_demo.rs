//! [`AntDemo`]: an ant colony (S3), its clock, and its RGBA buffer. All
//! safe Rust, tested natively; `ant_exports.rs` adapts it to the C ABI.

use core::num::NonZeroU32;

use math::convert::{f64_to_f32, usize_to_f64};
use swarm::{AntParams, Colony, Pheromone};
use web_common::FixedStep;

use crate::abi;
use crate::demo::BACKGROUND;

/// One running colony on a page.
pub struct AntDemo {
    colony: Colony,
    clock: FixedStep,
    /// Drawn pixels per cell.
    scale: usize,
    pixels: Vec<u32>,
}

const START_RATE: NonZeroU32 = match NonZeroU32::new(abi::DEFAULT_RATE_HZ) {
    Some(r) => r,
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
    /// A `width × height` world (cells) with `n` ants at a nest an eighth
    /// of the way in, drawn at `scale` pixels a cell.
    #[must_use]
    pub fn new(width: usize, height: usize, n: usize, scale: usize, seed: u64) -> Option<Self> {
        if scale == 0 || scale > 8 {
            return None;
        }
        let (w, h) = (
            f64_to_f32(usize_to_f64(width)),
            f64_to_f32(usize_to_f64(height)),
        );
        let nest = (w / 8.0, h / 2.0, (w.min(h) / 20.0).max(1.0));
        let colony = Colony::new(width, height, n, nest, AntParams::DEFAULT, seed)?;
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

    /// Real time in, fixed steps run; how many.
    pub fn advance(&mut self, elapsed: f64) -> u32 {
        self.clock.run(elapsed, || self.colony.step())
    }

    /// The clock, for the rate and the step budget's cap (the exports
    /// parse and set both through it: `FixedStep::set_rate_hz`,
    /// `set_cap_steps`).
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
        let ok = x.is_finite()
            && y.is_finite()
            && radius.is_finite()
            && radius >= 0.0
            && radius <= f64::from(abi::MAX_ANT_BRUSH);
        if !ok {
            return None;
        }
        let (x, y, r) = (f64_to_f32(x), f64_to_f32(y), f64_to_f32(radius));
        Some(match tool {
            abi::TOOL_FOOD => {
                let amount = u16::try_from(amount)
                    .ok()
                    .filter(|&a| u32::from(a) <= abi::MAX_FOOD)?;
                self.colony.paint_food(x, y, r, amount)
            }
            abi::TOOL_WALL => u64::try_from(self.colony.paint_wall(x, y, r)).unwrap_or(0),
            abi::TOOL_ERASE => u64::try_from(self.colony.erase(x, y, r)).unwrap_or(0),
            abi::TOOL_NEST => u64::from(self.colony.set_nest(x, y, r.max(1.0))),
            _ => return None,
        })
    }

    /// Sets one constant (`abi::ANT_*`); `false` for an unknown code or a
    /// value that makes them unusable (nothing changed).
    pub fn set_param(&mut self, code: u32, value: f64) -> bool {
        let mut p = self.colony.params();
        let Some(slot) = slot(&mut p, code) else {
            return false;
        };
        *slot = f64_to_f32(value);
        self.colony.set_params(p)
    }

    /// One constant, or `None` for an unknown code.
    #[must_use]
    pub fn param(&self, code: u32) -> Option<f64> {
        let mut p = self.colony.params();
        slot(&mut p, code).map(|v| f64::from(*v))
    }

    /// The drawn size, pixels.
    #[must_use]
    pub const fn view(&self) -> (usize, usize) {
        let (w, h) = self.colony.size();
        (w * self.scale, h * self.scale)
    }

    /// Draws the world: each cell its wall, food, or the two fields (home
    /// blue, food green, on a log scale); the nest's rim; the ants.
    pub fn render(&mut self) -> &[u32] {
        let (w, h) = self.colony.size();
        let s = self.scale;
        let vw = w * s;
        let (home, food_f) = (
            self.colony.field(Pheromone::Home).values(),
            self.colony.field(Pheromone::Food).values(),
        );
        let (open, food) = (self.colony.open(), self.colony.food());
        let level = |v: f32| -> u32 {
            let t = libm::log1pf(v.max(0.0) * 50.0) / libm::log1pf(FULL * 50.0);
            u32::try_from(
                math::convert::f64_to_usize(f64::from((t.min(1.0) * 255.0).round())).unwrap_or(0),
            )
            .unwrap_or(0)
        };
        for cy in 0..h {
            for cx in 0..w {
                let i = cy * w + cx;
                let colour = if !open.get(i).copied().unwrap_or(true) {
                    WALL
                } else if food.get(i).copied().unwrap_or(0) > 0 {
                    FOOD
                } else {
                    let (b, g) = (
                        level(home.get(i).copied().unwrap_or(0.0)),
                        level(food_f.get(i).copied().unwrap_or(0.0)),
                    );
                    let base = BACKGROUND;
                    let (br, bg, bb) = (base & 0xff, (base >> 8) & 0xff, (base >> 16) & 0xff);
                    let mix = |c: u32, add: u32| (c + add).min(255);
                    0xff00_0000 | (mix(bb, b) << 16) | (mix(bg, g) << 8) | br
                };
                for py in cy * s..(cy + 1) * s {
                    for px in cx * s..(cx + 1) * s {
                        if let Some(p) = self.pixels.get_mut(py * vw + px) {
                            *p = colour;
                        }
                    }
                }
            }
        }
        // The nest's rim.
        let (nx, ny, nr) = self.colony.nest();
        for k in 0..72_u8 {
            let a = f32::from(k) * core::f32::consts::TAU / 72.0;
            self.dot(nx + nr * libm::cosf(a), ny + nr * libm::sinf(a), NEST);
        }
        let ants: Vec<(f32, f32, bool)> =
            self.colony.ants().map(|a| (a.x, a.y, a.carrying)).collect();
        for (x, y, carrying) in ants {
            self.dot(x, y, if carrying { CARRYING } else { SEARCHING });
        }
        &self.pixels
    }

    /// One cell-sized square at `(x, y)` (cells).
    fn dot(&mut self, x: f32, y: f32, colour: u32) {
        let (w, h) = self.colony.size();
        let s = self.scale;
        let at = |v: f32| math::convert::f64_to_usize(f64::from(v.floor()));
        let (Some(cx), Some(cy)) = (at(x), at(y)) else {
            return;
        };
        if cx >= w || cy >= h {
            return;
        }
        for py in cy * s..(cy + 1) * s {
            for px in cx * s..(cx + 1) * s {
                if let Some(p) = self.pixels.get_mut(py * w * s + px) {
                    *p = colour;
                }
            }
        }
    }
}

/// The `AntParams` field a code names.
fn slot(p: &mut AntParams, code: u32) -> Option<&mut f32> {
    Some(match code {
        abi::ANT_SENSOR_ANGLE => &mut p.sensor_angle,
        abi::ANT_SENSOR_DISTANCE => &mut p.sensor_distance,
        abi::ANT_TURN => &mut p.turn,
        abi::ANT_WIGGLE => &mut p.wiggle,
        abi::ANT_SPEED => &mut p.speed,
        abi::ANT_DEPOSIT => &mut p.deposit,
        abi::ANT_FALLOFF => &mut p.falloff,
        abi::ANT_DIFFUSION => &mut p.diffusion,
        abi::ANT_DECAY => &mut p.decay,
        _ => return None,
    })
}

#[cfg(test)]
mod tests;
