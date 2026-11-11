//! [`SwarmDemo`]: a flock, its clock, its RGBA buffer, and the page's
//! controls. All safe Rust, tested natively; `exports.rs` only adapts it
//! to the C ABI.

use core::num::NonZeroU32;

use math::convert::{f64_to_f32, f64_to_usize, usize_to_f64};
use swarm::{Arena, Flock, Neighbours, Params};
use web_common::FixedStep;

use crate::abi;

/// One running flock on a page.
pub struct SwarmDemo {
    flock: Flock,
    clock: FixedStep,
    /// World pixels per drawn pixel.
    scale: f32,
    view: (usize, usize),
    /// One `u32` per drawn pixel, RGBA in memory order (`ImageData`'s).
    pixels: Vec<u32>,
    /// A colour per heading, 256 around the wheel.
    hues: [u32; 256],
}

/// Steps a demo starts at (the page's default rate).
const START_RATE: NonZeroU32 = match NonZeroU32::new(abi::DEFAULT_RATE_HZ) {
    Some(r) => r,
    None => NonZeroU32::MIN,
};

/// The background: the site's `--stage-bg` (#161a22), RGBA as `u32`.
pub const BACKGROUND: u32 = 0xff22_1a16;
/// A boid's dot, drawn pixels a side.
const DOT: usize = 2;

impl SwarmDemo {
    /// `n` boids in a `width × height` world (pixels), drawn at one pixel
    /// per `scale` world pixels; `None` for an unusable size.
    #[must_use]
    pub fn new(n: usize, width: usize, height: usize, scale: usize, seed: u64) -> Option<Self> {
        if scale == 0 || width < scale || height < scale {
            return None;
        }
        let arena = Arena::new(
            f64_to_f32(usize_to_f64(width)),
            f64_to_f32(usize_to_f64(height)),
        )?;
        let flock = Flock::new(n, arena, Params::ECE4760, seed)?;
        let view = (width / scale, height / scale);
        Some(Self {
            flock,
            clock: FixedStep::new(START_RATE),
            scale: f64_to_f32(usize_to_f64(scale)),
            view,
            pixels: vec![BACKGROUND; view.0 * view.1],
            hues: core::array::from_fn(|k| hue(usize_to_f64(k) / 256.0)),
        })
    }

    #[must_use]
    pub const fn flock(&self) -> &Flock {
        &self.flock
    }

    /// Adds `elapsed` seconds of real time and runs the fixed steps it
    /// pays for; returns how many.
    pub fn advance(&mut self, elapsed: f64) -> u32 {
        let steps = self.clock.advance(elapsed);
        for _ in 0..steps {
            self.flock.step();
        }
        steps
    }

    pub fn set_rate(&mut self, rate: NonZeroU32) {
        self.clock.set_rate(rate);
    }

    /// The step budget's cap (`None`: none), as in the other web crates.
    pub const fn set_step_cap(&mut self, cap: Option<NonZeroU32>) {
        self.clock.set_cap(cap);
    }

    /// How neighbours are found; `false` for brute force past
    /// [`MAX_BRUTE`](abi::MAX_BRUTE) boids.
    pub fn set_neighbours(&mut self, how: Neighbours) -> bool {
        let too_many = u32::try_from(self.flock.len()).map_or(true, |n| n > abi::MAX_BRUTE);
        if how == Neighbours::Brute && too_many {
            return false;
        }
        self.flock.set_neighbours(how);
        true
    }

    /// Sets one of the rules' constants (an `abi::PARAM_*` code); `false`
    /// for an unknown code or a value that makes them unusable.
    pub fn set_param(&mut self, code: u32, value: f64) -> bool {
        let mut p = self.flock.params();
        let Some(slot) = param_slot(&mut p, code) else {
            return false;
        };
        *slot = f64_to_f32(value);
        self.flock.set_params(p)
    }

    /// One of the rules' constants, or `None` for an unknown code.
    #[must_use]
    pub fn param(&self, code: u32) -> Option<f64> {
        let mut p = self.flock.params();
        param_slot(&mut p, code).map(|v| f64::from(*v))
    }

    /// The predator at world `(x, y)`, or none.
    pub fn set_predator(&mut self, at: Option<(f64, f64)>) -> bool {
        self.flock
            .set_predator(at.map(|(x, y)| (f64_to_f32(x), f64_to_f32(y))))
    }

    /// The drawn size, pixels.
    #[must_use]
    pub const fn view(&self) -> (usize, usize) {
        self.view
    }

    /// Clears the buffer and draws every boid as a `DOT`-pixel square,
    /// coloured by its heading; returns the buffer.
    pub fn render(&mut self) -> &[u32] {
        self.pixels.fill(BACKGROUND);
        let (w, h) = self.view;
        for b in self.flock.boids() {
            let at = |v: f32| f64_to_usize(f64::from((v / self.scale).floor()));
            let (Some(px), Some(py)) = (at(b.x), at(b.y)) else {
                continue;
            };
            let colour = self
                .hues
                .get(heading_index(b.vx, b.vy))
                .copied()
                .unwrap_or(BACKGROUND);
            for y in py..(py + DOT).min(h) {
                for x in px..(px + DOT).min(w) {
                    if let Some(p) = self.pixels.get_mut(y * w + x) {
                        *p = colour;
                    }
                }
            }
        }
        &self.pixels
    }
}

/// The `Params` field a code names.
fn param_slot(p: &mut Params, code: u32) -> Option<&mut f32> {
    Some(match code {
        abi::PARAM_VISUAL_RANGE => &mut p.visual_range,
        abi::PARAM_PROTECTED_RANGE => &mut p.protected_range,
        abi::PARAM_CENTERING => &mut p.centering,
        abi::PARAM_AVOID => &mut p.avoid,
        abi::PARAM_MATCHING => &mut p.matching,
        abi::PARAM_TURN => &mut p.turn,
        abi::PARAM_MARGIN => &mut p.margin,
        abi::PARAM_MIN_SPEED => &mut p.min_speed,
        abi::PARAM_MAX_SPEED => &mut p.max_speed,
        _ => return None,
    })
}

/// A heading's slot on the 256-colour wheel, from the **diamond angle**:
/// `0..4` around the unit diamond `|x| + |y| = 1`, monotone in the true
/// angle and exact at the axes, with no trig (drawing, not physics).
#[must_use]
pub fn heading_index(x: f32, y: f32) -> usize {
    let d = if y >= 0.0 {
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
    f64_to_usize(f64::from((d * 64.0).floor()))
        .unwrap_or(0)
        .min(255)
}

/// A colour at `turn` (0..1) round the hue wheel: HSV at saturation 0.65,
/// value 0.95, as RGBA `u32` (R in the low byte).
fn hue(turn: f64) -> u32 {
    let (s, v) = (0.65, 0.95);
    let h = turn * 6.0;
    let f = h - h.floor();
    let (p, q, t) = (v * (1.0 - s), v * (1.0 - s * f), v * (1.0 - s * (1.0 - f)));
    let (r, g, b) = match f64_to_usize(h.floor()).unwrap_or(0) % 6 {
        0 => (v, t, p),
        1 => (q, v, p),
        2 => (p, v, t),
        3 => (p, q, v),
        4 => (t, p, v),
        _ => (v, p, q),
    };
    let byte = |c: f64| {
        u32::try_from(f64_to_usize((c * 255.0).round()).unwrap_or(0).min(255)).unwrap_or(0)
    };
    0xff00_0000 | (byte(b) << 16) | (byte(g) << 8) | byte(r)
}

#[cfg(test)]
mod tests;
