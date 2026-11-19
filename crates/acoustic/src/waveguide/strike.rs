//! A hammer on the waveguide (`docs/14-piano.md`, "Coupling, as built"):
//! the strike at a junction between two cells, and the string's energy in
//! joules, for checking it against the hammer's.

use super::Waveguide;
use crate::Scalar;
use crate::hammer::Hammer;
use math::convert::{clamped_index, usize_to_f64};

impl<S: Scalar> Waveguide<S> {
    /// Strikes the silenced string with `hammer` at `position` (from the
    /// bridge, so a piano's eighth from the nut is `1 − 1/8`), at a junction
    /// between two cells; each wave gets what the hammer launched, `I / 2Z`.
    /// `false`, changing nothing, with fewer than two cells.
    pub fn strike(&mut self, hammer: Hammer, position: f64) -> bool {
        let rail_length = self.right.len();
        if rail_length < 2 {
            return false;
        }
        self.silence();
        // Cell c's center is at (c + offset) / length, so the junction after
        // it (between c and c + 1) is at (c + ½ + offset) / length.
        let x = (position.clamp(0.0, 1.0) * self.length - self.first_cell_offset - 0.5)
            .round()
            .clamp(0.0, usize_to_f64(rail_length - 2));
        let junction_cell = clamped_index(x, rail_length - 2);
        self.hammer = Some((hammer, junction_cell));
        true
    }

    pub(super) fn silence(&mut self) {
        self.right.fill(|_| S::ZERO);
        self.left.fill(|_| S::ZERO);
        if let Some(sample) = self.odd_sample.as_mut() {
            *sample = S::ZERO;
        }
        self.bridge.clear();
    }

    #[must_use]
    pub fn hammer(&self) -> Option<&Hammer> {
        self.hammer.as_ref().map(|(hammer, _)| hammer)
    }

    /// The string's energy, J, for wave impedance `impedance` (kg/s), rails
    /// in metres: each wave carries power `Z v²`, a cell `1 / sample_rate` of it.
    #[must_use]
    pub fn energy(&self, impedance: f64, sample_rate: f64) -> f64 {
        let rail_length = self.right.len();
        let junction = self
            .hammer
            .as_ref()
            .map(|(hammer, cell)| (*cell, hammer.launched()));
        let mut sum = 0.0;
        for cell in 0..rail_length.saturating_sub(1) {
            let added = match junction {
                Some((junction_cell, launched)) if junction_cell == cell => launched,
                _ => 0.0,
            };
            // The right rail moves toward cell 0, the left toward the last.
            let (right_next, right_now) = (
                self.right.at(cell + 1).to_f64() + added,
                self.right.at(cell).to_f64(),
            );
            let (left_previous, left_next) = (
                self.left.at(rail_length - 1 - cell).to_f64() + added,
                self.left.at(rail_length - 2 - cell).to_f64(),
            );
            sum += (right_next - right_now).powi(2) + (left_previous - left_next).powi(2);
        }
        impedance * sample_rate * sum
    }
}
