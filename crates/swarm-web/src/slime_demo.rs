//! [`SlimeDemo`]: a Physarum system (S4), its clock, and its RGBA view of
//! the field. All safe Rust, tested natively; `slime_exports.rs` adapts
//! it to the C ABI.

use core::num::NonZeroU32;

use math::convert::{f64_to_f32, f64_to_usize, usize_to_f64};
use swarm::{Slime, SlimeParams};
use web_common::FixedStep;

use crate::abi;
use crate::demo::BACKGROUND;

/// One running system on a page.
pub struct SlimeDemo {
    slime: Slime,
    clock: FixedStep,
    scale: usize,
    pixels: Vec<u32>,
    ramp: [u32; 256],
}

const START_RATE: NonZeroU32 = match NonZeroU32::new(abi::DEFAULT_RATE_HZ) {
    Some(r) => r,
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
    /// `n` agents on a `side × side` periodic field, drawn `scale` px a
    /// cell (1–4).
    #[must_use]
    pub fn new(side: usize, n: usize, scale: usize, seed: u64) -> Option<Self> {
        if !(1..=4).contains(&scale) {
            return None;
        }
        let slime = Slime::new(side, n, SlimeParams::DEFAULT, seed)?;
        Some(Self {
            slime,
            clock: FixedStep::new(START_RATE),
            scale,
            pixels: vec![BACKGROUND; side * side * scale * scale],
            ramp: core::array::from_fn(|k| ramp(usize_to_f64(k) / 255.0)),
        })
    }

    #[must_use]
    pub const fn slime(&self) -> &Slime {
        &self.slime
    }

    /// Real time in, fixed steps run; how many.
    pub fn advance(&mut self, elapsed: f64) -> u32 {
        let steps = self.clock.advance(elapsed);
        for _ in 0..steps {
            self.slime.step();
        }
        steps
    }

    pub fn set_rate(&mut self, rate: NonZeroU32) {
        self.clock.set_rate(rate);
    }

    pub const fn set_step_cap(&mut self, cap: Option<NonZeroU32>) {
        self.clock.set_cap(cap);
    }

    pub const fn set_sensing(&mut self, on: bool) {
        self.slime.set_sensing(on);
    }

    /// A node at cell `(x, y)` depositing `amount` a step; `false` outside,
    /// for a bad amount, or past [`MAX_NODES`](abi::MAX_NODES).
    pub fn add_node(&mut self, x: f64, y: f64, amount: f64) -> bool {
        let cell = |v: f64| {
            if v.is_finite() && v >= 0.0 {
                f64_to_usize(v.floor())
            } else {
                None
            }
        };
        let room = u32::try_from(self.slime.nodes().len()).is_ok_and(|n| n < abi::MAX_NODES);
        match (cell(x), cell(y), room) {
            (Some(cx), Some(cy), true) => self.slime.add_node(cx, cy, f64_to_f32(amount)),
            _ => false,
        }
    }

    pub fn clear_nodes(&mut self) {
        self.slime.clear_nodes();
    }

    /// Sets a constant (`abi::SLIME_*`); `false` for an unknown code or an
    /// unusable value (nothing changed).
    pub fn set_param(&mut self, code: u32, value: f64) -> bool {
        let mut p = self.slime.params();
        let Some(slot) = slot(&mut p, code) else {
            return false;
        };
        *slot = f64_to_f32(value);
        self.slime.set_params(p)
    }

    /// A constant, or `None` for an unknown code.
    #[must_use]
    pub fn param(&self, code: u32) -> Option<f64> {
        let mut p = self.slime.params();
        slot(&mut p, code).map(|v| f64::from(*v))
    }

    /// The drawn side, pixels.
    #[must_use]
    pub const fn view(&self) -> usize {
        self.slime.side() * self.scale
    }

    /// Draws the field through the ramp, `v / (v + HALF)` on it.
    pub fn render(&mut self) -> &[u32] {
        let (side, s) = (self.slime.side(), self.scale);
        let vw = side * s;
        let values = self.slime.field().values();
        for cy in 0..side {
            for cx in 0..side {
                let v = values.get(cy * side + cx).copied().unwrap_or(0.0).max(0.0);
                let t = v / (v + HALF);
                let k = f64_to_usize(f64::from((t * 255.0).round()))
                    .unwrap_or(0)
                    .min(255);
                let colour = self.ramp.get(k).copied().unwrap_or(BACKGROUND);
                for py in cy * s..(cy + 1) * s {
                    if let Some(row) = self
                        .pixels
                        .get_mut(py * vw + cx * s..py * vw + (cx + 1) * s)
                    {
                        row.fill(colour);
                    }
                }
            }
        }
        &self.pixels
    }
}

/// The ramp at `t` (0..1), linear between the stops, as RGBA `u32`.
fn ramp(t: f64) -> u32 {
    let mix = |[ar, ag, ab]: [f64; 3], [br, bg, bb]: [f64; 3], f: f64| {
        [ar + (br - ar) * f, ag + (bg - ag) * f, ab + (bb - ab) * f]
    };
    let last = STOPS.last().map_or([255.0; 3], |s| s.1);
    let [r, g, b] = STOPS
        .iter()
        .zip(STOPS.iter().skip(1))
        .find(|(_, hi)| t <= hi.0)
        .map_or(last, |(lo, hi)| {
            mix(lo.1, hi.1, ((t - lo.0) / (hi.0 - lo.0)).clamp(0.0, 1.0))
        });
    let byte = |c: f64| u32::try_from(f64_to_usize(c.round()).unwrap_or(0).min(255)).unwrap_or(0);
    0xff00_0000 | (byte(b) << 16) | (byte(g) << 8) | byte(r)
}

/// The `SlimeParams` field a code names.
fn slot(p: &mut SlimeParams, code: u32) -> Option<&mut f32> {
    Some(match code {
        abi::SLIME_SENSOR_ANGLE => &mut p.sensor_angle,
        abi::SLIME_SENSOR_OFFSET => &mut p.sensor_offset,
        abi::SLIME_TURN => &mut p.turn,
        abi::SLIME_STEP => &mut p.step,
        abi::SLIME_DEPOSIT => &mut p.deposit,
        abi::SLIME_DIFFUSION => &mut p.diffusion,
        abi::SLIME_DECAY => &mut p.decay,
        _ => return None,
    })
}

#[cfg(test)]
mod tests;
