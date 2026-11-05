//! A hammer on the waveguide (`docs/14-piano.md`, "Coupling, as built"):
//! the strike at a junction between two cells, and the string's energy in
//! joules, for checking it against the hammer's. The per-sample coupling
//! is in `step`.

use super::Waveguide;
use crate::Scalar;
use crate::hammer::Hammer;
use math::convert::{clamped_index, usize_to_f64};

impl<S: Scalar> Waveguide<S> {
    /// Strikes the silenced string with `hammer` at `s` (from the bridge,
    /// so a piano's eighth from the nut is `1 − 1/8`), at a junction
    /// between two cells (`docs/14-piano.md`, "The hammer"). Each sample
    /// after the waves move, the two that just crossed the junction are
    /// the hammer's incoming displacement, and each gets what the hammer
    /// launched, `I / 2Z`: for good, so the step it launched stays on the
    /// string (it cancels at the ends). A string needs two cells for a
    /// junction; `false`, changing nothing, with fewer.
    pub fn strike(&mut self, hammer: Hammer, s: f64) -> bool {
        let m = self.right.len();
        if m < 2 {
            return false;
        }
        self.silence();
        // Cell c's center is at (c + first) / length, so the junction after
        // it (between c and c + 1) is at (c + ½ + first) / length.
        let x = (s.clamp(0.0, 1.0) * self.length - self.first - 0.5)
            .round()
            .clamp(0.0, usize_to_f64(m - 2));
        let c = clamped_index(x, m - 2);
        self.hammer = Some((hammer, c));
        true
    }

    /// Zeros the rails and the bridge's memory.
    pub(super) fn silence(&mut self) {
        self.right.fill(|_| S::ZERO);
        self.left.fill(|_| S::ZERO);
        if let Some(e) = self.odd.as_mut() {
            *e = S::ZERO;
        }
        self.bridge.clear();
    }

    /// The hammer on the string, if struck.
    #[must_use]
    pub fn hammer(&self) -> Option<&Hammer> {
        self.hammer.as_ref().map(|(h, _)| h)
    }

    /// The string's energy, J, for wave impedance `z` (kg/s) at `fs` Hz,
    /// with the rails in metres: each wave carries power `Z v²`, and a
    /// cell holds `1 / fs` of it. `v` is how a cell's value changes in a
    /// sample (the next cell's value, plus what the hammer adds where
    /// it crosses the junction).
    #[must_use]
    pub fn energy(&self, z: f64, fs: f64) -> f64 {
        let m = self.right.len();
        let junction = self.hammer.as_ref().map(|(h, c)| (*c, h.launched()));
        let mut sum = 0.0;
        for c in 0..m.saturating_sub(1) {
            let added = match junction {
                Some((j, launched)) if j == c => launched,
                _ => 0.0,
            };
            // The right rail moves toward cell 0, the left toward m − 1.
            let (r_next, r_now) = (
                self.right.at(c + 1).to_f64() + added,
                self.right.at(c).to_f64(),
            );
            let (l_prev, l_next) = (
                self.left.at(m - 1 - c).to_f64() + added,
                self.left.at(m - 2 - c).to_f64(),
            );
            sum += (r_next - r_now).powi(2) + (l_prev - l_next).powi(2);
        }
        z * fs * sum
    }
}
