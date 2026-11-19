//! [`Waveguide`]: a string as two traveling waves (`docs/13-waveguide.md`).

use crate::bridge::Bridge;
use crate::hammer::Hammer;
use crate::{DelayLine, Scalar, Voicing};
use math::convert::{clamped_index, usize_to_f64};

/// A string with fixed ends as two delay lines ("rails") of `M` samples,
/// `right` toward the bridge and `left` toward the nut; ends reflect
/// inverted, the bridge also filters ([`Voicing`]). An odd loop `N` puts
/// its extra sample in the bridge. Positions are fractions of the
/// effective length `sample_rate / 2f₀` from the bridge: cell `c` is at
/// `(c + ½ + τ_b / 2) / length`, `τ_b` the bridge's round-trip delay.
#[derive(Clone, Debug)]
pub struct Waveguide<S> {
    right: DelayLine<S>,
    left: DelayLine<S>,
    bridge: Bridge<S>,
    /// The bridge's extra sample when the loop is odd, waiting one step.
    odd_sample: Option<S>,
    pickup: f64,
    /// The effective length, cells (`sample_rate / 2f₀`).
    length: f64,
    /// How far cell 0's center is from the effective bridge (`½ + τ_b / 2`).
    first_cell_offset: f64,
    /// A hammer on the string, and the cell its junction follows.
    hammer: Option<(Hammer, usize)>,
}

pub(crate) const DEFAULT_PICKUP: f64 = 0.1;

impl<S: Scalar> Waveguide<S> {
    /// A silent string; `None` for settings it can't play.
    #[must_use]
    pub fn new(sample_rate: f64, fundamental_hz: f64, voicing: Voicing) -> Option<Self> {
        let loop_length = voicing.coefficients(sample_rate, fundamental_hz)?.n;
        Self::with_capacity(sample_rate, fundamental_hz, voicing, loop_length)
    }

    /// As [`new`](Self::new), with room for a loop of `capacity` samples, so
    /// [`restring`](Self::restring) up to it never allocates.
    #[must_use]
    pub fn with_capacity(
        sample_rate: f64,
        fundamental_hz: f64,
        voicing: Voicing,
        capacity: usize,
    ) -> Option<Self> {
        let coefficients = voicing.coefficients(sample_rate, fundamental_hz)?;
        let rail_capacity = capacity / 2;
        let rail_length = coefficients.n / 2;
        let (length, first_cell_offset) = geometry(sample_rate, coefficients.pitch, rail_length);
        Some(Self {
            right: DelayLine::with_capacity(rail_length, rail_capacity)?,
            left: DelayLine::with_capacity(rail_length, rail_capacity)?,
            odd_sample: (coefficients.n % 2 == 1).then_some(S::ZERO),
            bridge: Bridge::new(&coefficients),
            pickup: DEFAULT_PICKUP,
            length,
            first_cell_offset,
            hammer: None,
        })
    }

    /// Re-voices for a new note, silent; `false`, changing nothing, if it
    /// can't be played or exceeds the capacity.
    pub fn restring(&mut self, sample_rate: f64, fundamental_hz: f64, voicing: Voicing) -> bool {
        self.restring_from(
            sample_rate,
            voicing.coefficients(sample_rate, fundamental_hz).as_ref(),
        )
    }

    /// As [`restring`](Self::restring), with a stored dispersion design.
    pub(crate) fn restring_designed(
        &mut self,
        sample_rate: f64,
        fundamental_hz: f64,
        voicing: Voicing,
        dispersion: Option<&crate::dispersion::Dispersion>,
    ) -> bool {
        let coefficients =
            voicing.coefficients_designed(sample_rate, fundamental_hz, |_, _| dispersion.copied());
        self.restring_from(sample_rate, coefficients.as_ref())
    }

    fn restring_from(
        &mut self,
        sample_rate: f64,
        coefficients: Option<&crate::voicing::Coefficients>,
    ) -> bool {
        let Some(coefficients) = coefficients else {
            return false;
        };
        let rail_length = coefficients.n / 2;
        let fits = rail_length <= self.right.capacity()
            && rail_length <= self.left.capacity()
            && rail_length > 0;
        if !fits {
            return false;
        }
        self.right.reset(rail_length);
        self.left.reset(rail_length);
        self.odd_sample = (coefficients.n % 2 == 1).then_some(S::ZERO);
        (self.length, self.first_cell_offset) =
            geometry(sample_rate, coefficients.pitch, rail_length);
        self.bridge.apply(coefficients);
        self.hammer = None;
        true
    }

    /// The loop's length `N`, samples (`2M`, plus 1 when odd).
    #[must_use]
    pub fn delay(&self) -> usize {
        2 * self.right.len() + usize::from(self.odd_sample.is_some())
    }

    #[must_use]
    pub fn rail(&self) -> usize {
        self.right.len()
    }

    #[must_use]
    pub const fn pitch(&self) -> f64 {
        self.bridge.pitch()
    }

    /// The release: see [`KsString::damp`](crate::KsString::damp).
    pub fn damp(&mut self, decay_time_60db: f64, ramp: core::num::NonZeroUsize) {
        self.bridge.damp(decay_time_60db, ramp);
    }

    /// Plucks into `shape(position)` (from the bridge, 0 to 1), at rest:
    /// both rails take half the shape (called once per cell, so noise is
    /// still at rest) and cancel in the loop: no DC to remove.
    pub fn pluck(&mut self, mut shape: impl FnMut(f64) -> S) {
        let rail_length = self.right.len();
        let (length, first_cell_offset) = (self.length, self.first_cell_offset);
        let position_of = |cell: usize| (usize_to_f64(cell) + first_cell_offset) / length;
        let half = S::from_f64(0.5);
        self.right.fill(|cell| shape(position_of(cell)) * half);
        // The left rail runs the other way (its front is the cell nearest
        // the nut), and takes the right rail's value at each cell.
        let right = &self.right;
        self.left.fill(|index| right.at(rail_length - 1 - index));
        if let Some(sample) = self.odd_sample.as_mut() {
            *sample = S::ZERO;
        }
        self.bridge.clear();
        self.hammer = None;
    }

    pub fn step(&mut self) -> S {
        let at_bridge = self.right.front();
        let at_nut = self.left.front();
        let filtered = self.bridge.process(at_bridge);
        // The odd loop's extra sample: this output waits a step.
        let out = match self.odd_sample.as_mut() {
            Some(sample) => core::mem::replace(sample, filtered),
            None => filtered,
        };
        self.right.push(-at_nut);
        self.left.push(-out);
        if let Some((hammer, junction_cell)) = self.hammer.as_mut() {
            let rail_length = self.right.len();
            // These two cells hold the waves that just crossed the junction.
            let (right_cell, left_cell) = (*junction_cell, rail_length - 2 - *junction_cell);
            let incoming = self.right.at(right_cell) + self.left.at(left_cell);
            let launched = S::from_f64(hammer.step(incoming.to_f64()));
            self.right.add_at(right_cell, launched);
            self.left.add_at(left_cell, launched);
        }
        filtered
    }

    pub const fn set_pickup(&mut self, position: f64) {
        self.pickup = position.clamp(0.0, 1.0);
    }

    #[must_use]
    pub fn displacement(&self) -> S {
        let rail_length = self.right.len();
        // The pickup's cell coordinate (cell c's center is at c).
        let x = (self.pickup * self.length - self.first_cell_offset)
            .clamp(0.0, usize_to_f64(rail_length - 1));
        let lower_cell = clamped_index(x, rail_length - 1);
        let upper_cell = (lower_cell + 1).min(rail_length - 1);
        let fraction = S::from_f64(x - usize_to_f64(lower_cell));
        let lower = self.cell(lower_cell);
        lower + (self.cell(upper_cell) - lower) * fraction
    }

    fn cell(&self, cell: usize) -> S {
        let rail_length = self.right.len();
        self.right.at(cell) + self.left.at(rail_length - 1 - cell)
    }

    pub fn next_sample(&mut self) -> S {
        self.step();
        self.displacement()
    }

    pub fn render(&mut self, out: &mut [S]) {
        for sample in out {
            *sample = self.next_sample();
        }
    }

    #[must_use]
    pub fn position(&self, cell: usize) -> f64 {
        let cell = usize_to_f64(cell);
        (cell + self.first_cell_offset) / self.length
    }

    pub fn shape(&self) -> impl Iterator<Item = S> + '_ {
        (0..self.right.len()).map(|cell| self.cell(cell))
    }

    /// Lays out a Karplus–Strong loop (oldest first): the first `M` on the
    /// right rail, the next `M` negated on the left, the last in the bridge.
    #[cfg(test)]
    pub(crate) fn load_loop(&mut self, line: &[S]) {
        let rail_length = self.right.len();
        let get = |index: usize| line.get(index).copied().unwrap_or(S::ZERO);
        self.right.fill(get);
        self.left.fill(|index| -get(rail_length + index));
        if let Some(sample) = self.odd_sample.as_mut() {
            *sample = get(2 * rail_length);
        }
        self.bridge.clear();
    }

    #[cfg(test)]
    pub(crate) fn load_rails(&mut self, right: &[S], left: &[S]) {
        self.right
            .fill(|index| right.get(index).copied().unwrap_or(S::ZERO));
        self.left
            .fill(|index| left.get(index).copied().unwrap_or(S::ZERO));
    }

    #[cfg(test)]
    pub(crate) fn rails_at(&self, cell: usize) -> (S, S) {
        let rail_length = self.right.len();
        (self.right.at(cell), self.left.at(rail_length - 1 - cell))
    }

    #[cfg(test)]
    pub(crate) fn left_newest(&self) -> S {
        self.left.back()
    }
}

/// The effective length in cells, `sample_rate / 2·pitch`, and cell 0's
/// distance from the effective bridge; the bare rail for a non-positive pitch.
fn geometry(sample_rate: f64, pitch: f64, rail_length: usize) -> (f64, f64) {
    let rail_cells = usize_to_f64(rail_length);
    let length = sample_rate / (2.0 * pitch);
    // `length > 0` is false for NaN too.
    let usable = length > 0.0 && length.is_finite();
    if usable {
        (length, length - rail_cells + 0.5)
    } else {
        (rail_cells, 0.5)
    }
}

mod strike;
#[cfg(test)]
mod tests;
