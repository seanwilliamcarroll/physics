//! [`VicsekDemo`]: a Vicsek system (S2), its clock, its square RGBA
//! buffer. All safe Rust, tested natively; `vicsek_exports.rs` adapts it
//! to the C ABI.

use core::num::NonZeroU32;

use math::convert::{f64_to_f32, f64_to_usize, usize_to_f64};
use swarm::{Vicsek, VicsekParams};
use web_common::FixedStep;

use crate::abi;
use crate::demo::{BACKGROUND, DOT, heading_index, hue};

/// One running Vicsek system on a page.
pub struct VicsekDemo {
    sys: Vicsek,
    clock: FixedStep,
    /// Drawn pixels per side (the box is square).
    view: usize,
    pixels: Vec<u32>,
    hues: [u32; 256],
}

const START_RATE: NonZeroU32 = match NonZeroU32::new(abi::DEFAULT_RATE_HZ) {
    Some(r) => r,
    None => NonZeroU32::MIN,
};

impl VicsekDemo {
    /// `n` particles in an `L × L` box (interaction radii), the paper's
    /// `r = 1` and `v = 0.03`, noise η; drawn `view` pixels a side.
    #[must_use]
    pub fn new(n: usize, side: f64, noise: f64, view: usize, seed: u64) -> Option<Self> {
        if view == 0 {
            return None;
        }
        let sys = Vicsek::new(
            n,
            f64_to_f32(side),
            VicsekParams::paper(f64_to_f32(noise)),
            seed,
        )?;
        Some(Self {
            sys,
            clock: FixedStep::new(START_RATE),
            view,
            pixels: vec![BACKGROUND; view * view],
            hues: core::array::from_fn(|k| hue(usize_to_f64(k) / 256.0)),
        })
    }

    #[must_use]
    pub const fn system(&self) -> &Vicsek {
        &self.sys
    }

    /// Real time in, fixed steps run; how many.
    pub fn advance(&mut self, elapsed: f64) -> u32 {
        self.clock.run(elapsed, || self.sys.step())
    }

    /// The clock, for the rate and the step budget's cap (the exports
    /// parse and set both through it: `FixedStep::set_rate_hz`,
    /// `set_cap_steps`).
    pub const fn clock(&mut self) -> &mut FixedStep {
        &mut self.clock
    }

    /// The noise η; `false` outside `[0, 2π]` (nothing changed).
    pub fn set_noise(&mut self, eta: f64) -> bool {
        let p = VicsekParams {
            noise: f64_to_f32(eta),
            ..self.sys.params()
        };
        self.sys.set_params(p)
    }

    /// The speed v; `false` unless finite and positive.
    pub fn set_speed(&mut self, v: f64) -> bool {
        let p = VicsekParams {
            speed: f64_to_f32(v),
            ..self.sys.params()
        };
        self.sys.set_params(p)
    }

    /// The paper's measurement: `transient` steps, then `v_a`'s mean over
    /// `window`; `None` past [`MAX_RUN`](abi::MAX_RUN) steps in all or an
    /// empty window.
    pub fn mean_order(&mut self, transient: u32, window: u32) -> Option<f64> {
        let total = transient.checked_add(window)?;
        (window > 0 && total <= abi::MAX_RUN).then(|| self.sys.mean_order(transient, window))
    }

    #[must_use]
    pub const fn view(&self) -> usize {
        self.view
    }

    /// Clears the buffer and draws every particle as a `DOT`-pixel
    /// square coloured by heading; returns the buffer.
    pub fn render(&mut self) -> &[u32] {
        self.pixels.fill(BACKGROUND);
        let (v, scale) = (
            self.view,
            usize_to_f64(self.view) / f64::from(self.sys.side()),
        );
        for p in self.sys.particles() {
            let at = |c: f32| f64_to_usize((f64::from(c) * scale).floor());
            let (Some(px), Some(py)) = (at(p.x), at(p.y)) else {
                continue;
            };
            let colour = self
                .hues
                .get(heading_index(p.cos, p.sin))
                .copied()
                .unwrap_or(BACKGROUND);
            for y in py..(py + DOT).min(v) {
                for x in px..(px + DOT).min(v) {
                    if let Some(px) = self.pixels.get_mut(y * v + x) {
                        *px = colour;
                    }
                }
            }
        }
        &self.pixels
    }
}

#[cfg(test)]
mod tests;
