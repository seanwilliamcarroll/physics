//! [`VicsekDemo`]: a Vicsek system, its clock and its square RGBA buffer.
//! Safe Rust; `vicsek_exports.rs` adapts it to the C ABI.

use core::num::NonZeroU32;

use math::convert::{f64_to_f32, f64_to_usize, usize_to_f64};
use swarm::{Vicsek, VicsekParams};
use web_common::FixedStep;

use crate::abi;
use crate::demo::{BACKGROUND, DOT, heading_index, hue};

pub struct VicsekDemo {
    system: Vicsek,
    clock: FixedStep,
    view: usize,
    pixels: Vec<u32>,
    hues: [u32; 256],
}

const START_RATE: NonZeroU32 = match NonZeroU32::new(abi::DEFAULT_RATE_HZ) {
    Some(rate) => rate,
    None => NonZeroU32::MIN,
};

impl VicsekDemo {
    /// `particle_count` particles in a `side × side` box (interaction radii), the
    /// paper's `r = 1` and `v = 0.03`; drawn `view` pixels a side.
    #[must_use]
    pub fn new(
        particle_count: usize,
        side: f64,
        noise: f64,
        view: usize,
        seed: u64,
    ) -> Option<Self> {
        if view == 0 {
            return None;
        }
        let system = Vicsek::new(
            particle_count,
            f64_to_f32(side),
            VicsekParams::paper(f64_to_f32(noise)),
            seed,
        )?;
        Some(Self {
            system,
            clock: FixedStep::new(START_RATE),
            view,
            pixels: vec![BACKGROUND; view * view],
            hues: core::array::from_fn(|slot| hue(usize_to_f64(slot) / 256.0)),
        })
    }

    #[must_use]
    pub const fn system(&self) -> &Vicsek {
        &self.system
    }

    /// Runs the fixed steps `elapsed` seconds of real time pay for; returns how many.
    pub fn advance(&mut self, elapsed: f64) -> u32 {
        self.clock.run(elapsed, || self.system.step())
    }

    pub const fn clock(&mut self) -> &mut FixedStep {
        &mut self.clock
    }

    /// `false` outside `[0, 2π]` (nothing changed).
    pub fn set_noise(&mut self, noise: f64) -> bool {
        let params = VicsekParams {
            noise: f64_to_f32(noise),
            ..self.system.params()
        };
        self.system.set_params(params)
    }

    /// `false` unless finite and positive.
    pub fn set_speed(&mut self, speed: f64) -> bool {
        let params = VicsekParams {
            speed: f64_to_f32(speed),
            ..self.system.params()
        };
        self.system.set_params(params)
    }

    /// `transient` steps, then `v_a`'s mean over `window`; `None` past [`MAX_RUN`](abi::MAX_RUN) steps in all or an
    /// empty window.
    pub fn mean_order(&mut self, transient: u32, window: u32) -> Option<f64> {
        let total = transient.checked_add(window)?;
        (window > 0 && total <= abi::MAX_RUN).then(|| self.system.mean_order(transient, window))
    }

    #[must_use]
    pub const fn view(&self) -> usize {
        self.view
    }

    /// Clears the buffer and draws every particle as a `DOT`-pixel
    /// square coloured by heading; returns the buffer.
    pub fn render(&mut self) -> &[u32] {
        self.pixels.fill(BACKGROUND);
        let (view, scale) = (
            self.view,
            usize_to_f64(self.view) / f64::from(self.system.side()),
        );
        for particle in self.system.particles() {
            let at = |coordinate: f32| f64_to_usize((f64::from(coordinate) * scale).floor());
            let (Some(left), Some(top)) = (at(particle.x), at(particle.y)) else {
                continue;
            };
            let colour = self
                .hues
                .get(heading_index(particle.cos, particle.sin))
                .copied()
                .unwrap_or(BACKGROUND);
            for y in top..(top + DOT).min(view) {
                for x in left..(left + DOT).min(view) {
                    if let Some(pixel) = self.pixels.get_mut(y * view + x) {
                        *pixel = colour;
                    }
                }
            }
        }
        &self.pixels
    }
}

#[cfg(test)]
mod tests;
