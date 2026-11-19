//! [`SwarmDemo`]: a flock, its clock and its RGBA buffer. Safe Rust; `exports.rs`
//! adapts it to the C ABI.

use core::num::NonZeroU32;

use math::convert::{f64_to_f32, f64_to_usize, usize_to_f64};
use swarm::{Arena, Flock, Neighbours, Params};
use web_common::FixedStep;

use crate::abi;

pub struct SwarmDemo {
    flock: Flock,
    clock: FixedStep,
    /// World pixels per drawn pixel.
    scale: f32,
    view: (usize, usize),
    /// One `u32` per drawn pixel, RGBA in memory order (`ImageData`'s).
    pixels: Vec<u32>,
    hues: [u32; 256],
}

const START_RATE: NonZeroU32 = match NonZeroU32::new(abi::DEFAULT_RATE_HZ) {
    Some(rate) => rate,
    None => NonZeroU32::MIN,
};

/// The site's `--stage-bg` (#161a22), RGBA as `u32`.
pub const BACKGROUND: u32 = 0xff22_1a16;
pub(crate) const DOT: usize = 2;

impl SwarmDemo {
    /// `boid_count` boids in a `width × height` world (pixels), drawn at one pixel
    /// per `scale` world pixels; `None` for an unusable size.
    #[must_use]
    pub fn new(
        boid_count: usize,
        width: usize,
        height: usize,
        scale: usize,
        seed: u64,
    ) -> Option<Self> {
        if scale == 0 || width < scale || height < scale {
            return None;
        }
        let arena = Arena::new(
            f64_to_f32(usize_to_f64(width)),
            f64_to_f32(usize_to_f64(height)),
        )?;
        let flock = Flock::new(boid_count, arena, Params::ECE4760, seed)?;
        let view = (width / scale, height / scale);
        Some(Self {
            flock,
            clock: FixedStep::new(START_RATE),
            scale: f64_to_f32(usize_to_f64(scale)),
            view,
            pixels: vec![BACKGROUND; view.0 * view.1],
            hues: core::array::from_fn(|slot| hue(usize_to_f64(slot) / 256.0)),
        })
    }

    #[must_use]
    pub const fn flock(&self) -> &Flock {
        &self.flock
    }

    /// Runs the fixed steps `elapsed` seconds of real time pay for; returns how many.
    pub fn advance(&mut self, elapsed: f64) -> u32 {
        self.clock.run(elapsed, || self.flock.step())
    }

    pub const fn clock(&mut self) -> &mut FixedStep {
        &mut self.clock
    }

    /// How neighbours are found; `false` for brute force past
    /// [`MAX_BRUTE`](abi::MAX_BRUTE) boids.
    pub fn set_neighbours(&mut self, how: Neighbours) -> bool {
        let too_many = u32::try_from(self.flock.len()).map_or(true, |count| count > abi::MAX_BRUTE);
        if how == Neighbours::Brute && too_many {
            return false;
        }
        self.flock.set_neighbours(how);
        true
    }

    /// Sets one of the rules' constants (an `abi::PARAM_*` code); `false`
    /// for an unknown code or a value that makes them unusable.
    pub fn set_param(&mut self, code: u32, value: f64) -> bool {
        let mut params = self.flock.params();
        let Some(slot) = param_slot(&mut params, code) else {
            return false;
        };
        *slot = f64_to_f32(value);
        self.flock.set_params(params)
    }

    /// One of the rules' constants, or `None` for an unknown code.
    #[must_use]
    pub fn param(&self, code: u32) -> Option<f64> {
        let mut params = self.flock.params();
        param_slot(&mut params, code).map(|value| f64::from(*value))
    }

    pub fn set_predator(&mut self, at: Option<(f64, f64)>) -> bool {
        self.flock
            .set_predator(at.map(|(x, y)| (f64_to_f32(x), f64_to_f32(y))))
    }

    #[must_use]
    pub const fn view(&self) -> (usize, usize) {
        self.view
    }

    /// Clears the buffer and draws every boid as a `DOT`-pixel square,
    /// coloured by its heading; returns the buffer.
    pub fn render(&mut self) -> &[u32] {
        self.pixels.fill(BACKGROUND);
        let (width, height) = self.view;
        for boid in self.flock.boids() {
            let at = |world: f32| f64_to_usize(f64::from((world / self.scale).floor()));
            let (Some(left), Some(top)) = (at(boid.x), at(boid.y)) else {
                continue;
            };
            let colour = self
                .hues
                .get(heading_index(boid.vx, boid.vy))
                .copied()
                .unwrap_or(BACKGROUND);
            for y in top..(top + DOT).min(height) {
                for x in left..(left + DOT).min(width) {
                    if let Some(pixel) = self.pixels.get_mut(y * width + x) {
                        *pixel = colour;
                    }
                }
            }
        }
        &self.pixels
    }
}

fn param_slot(params: &mut Params, code: u32) -> Option<&mut f32> {
    Some(match code {
        abi::PARAM_VISUAL_RANGE => &mut params.visual_range,
        abi::PARAM_PROTECTED_RANGE => &mut params.protected_range,
        abi::PARAM_CENTERING => &mut params.centering,
        abi::PARAM_AVOID => &mut params.avoid,
        abi::PARAM_MATCHING => &mut params.matching,
        abi::PARAM_TURN => &mut params.turn,
        abi::PARAM_MARGIN => &mut params.margin,
        abi::PARAM_MIN_SPEED => &mut params.min_speed,
        abi::PARAM_MAX_SPEED => &mut params.max_speed,
        _ => return None,
    })
}

/// A heading's slot on the 256-colour wheel, from the **diamond angle**:
/// `0..4` around the unit diamond `|x| + |y| = 1`, monotone in the true
/// angle and exact at the axes, with no trig (drawing, not physics).
#[must_use]
pub fn heading_index(x: f32, y: f32) -> usize {
    let diamond_angle = if y >= 0.0 {
        if x >= 0.0 {
            y / (x + y)
        } else {
            1.0 - x / (y - x)
        }
    } else if x < 0.0 {
        2.0 - y / (-x - y)
    } else {
        3.0 + x / (x - y)
    };
    // NaN (speed 0, which the clamp rules out) lands on slot 0.
    f64_to_usize(f64::from((diamond_angle * 64.0).floor()))
        .unwrap_or(0)
        .min(255)
}

/// A colour at `turn` (0..1) round the hue wheel: HSV at saturation 0.65,
/// value 0.95, as RGBA `u32` (R in the low byte).
pub(crate) fn hue(turn: f64) -> u32 {
    let (saturation, value) = (0.65, 0.95);
    let sector_position = turn * 6.0;
    let fraction = sector_position - sector_position.floor();
    let (low, falling, rising) = (
        value * (1.0 - saturation),
        value * (1.0 - saturation * fraction),
        value * (1.0 - saturation * (1.0 - fraction)),
    );
    let (red, green, blue) = match f64_to_usize(sector_position.floor()).unwrap_or(0) % 6 {
        0 => (value, rising, low),
        1 => (falling, value, low),
        2 => (low, value, rising),
        3 => (low, falling, value),
        4 => (rising, low, value),
        _ => (value, low, falling),
    };
    let byte = |channel: f64| {
        u32::try_from(
            f64_to_usize((channel * 255.0).round())
                .unwrap_or(0)
                .min(255),
        )
        .unwrap_or(0)
    };
    0xff00_0000 | (byte(blue) << 16) | (byte(green) << 8) | byte(red)
}

#[cfg(test)]
mod tests;
