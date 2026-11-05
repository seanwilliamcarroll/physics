//! [`Waveguide`]: a string as two traveling waves (`docs/13-waveguide.md`).

use crate::bridge::Bridge;
use crate::hammer::Hammer;
use crate::{DelayLine, Scalar, Voicing};

/// A string of length `L` with fixed ends, as two delay lines ("rails")
/// of `M` samples: `right`, the wave traveling toward the bridge, and
/// `left`, the wave traveling toward the nut. Each sample, every value
/// moves one cell; at each end the arriving wave reflects inverted (a
/// fixed end), and at the bridge it also passes the loop filter
/// (the crate's `Bridge`: loss, lowpass, allpass, from the note's [`Voicing`]).
///
/// The loop is A1's: `N` samples, split `⌊N/2⌋` per rail, and when `N` is
/// odd the extra sample is a one-sample delay inside the bridge. So
/// positions map symmetrically onto both rails, and the tuning and decay
/// carry over exactly.
///
/// Positions are fractions of the length **measured from the bridge**,
/// along the string's *effective* length: the bridge's filters delay the
/// reflection (the lowpass, the allpass, the odd sample: `τ_b` samples a
/// round trip), so to the waves the string reaches `τ_b / 2` cells past
/// cell 0. The effective length is half the loop's period, `fs / (2 f₀)`
/// cells, and cell `c` (0 nearest the bridge) is at
/// `s = (c + ½ + τ_b / 2) / (fs / 2f₀)`. (Measuring on the `M` cells alone
/// put "1/n" a few thousandths of the length off the real node, and the
/// missing harmonics only fell to about −40 dB; A2.4.) The right rail's
/// front (about to reach the bridge) is cell 0; the left rail's front
/// (about to reach the nut) is cell `M − 1`. The displacement at a cell is
/// the sum of the two rails there.
#[derive(Clone, Debug)]
pub struct Waveguide<S> {
    right: DelayLine<S>,
    left: DelayLine<S>,
    bridge: Bridge<S>,
    /// The bridge's extra sample when the loop is odd: its filter output,
    /// waiting one step to enter the left rail.
    odd: Option<S>,
    /// Where the output is read, from the bridge.
    pickup: f64,
    /// The effective length, cells (`fs / 2f₀`), and how far cell 0's
    /// center is from the effective bridge (`½ + τ_b / 2`).
    length: f64,
    first: f64,
    /// A hammer on the string, and the cell `c` its junction follows (it
    /// sits between `c` and `c + 1`).
    hammer: Option<(Hammer, usize)>,
}

/// Where a new string's pickup sits, from the bridge: near it, as on a
/// guitar (`set_pickup` moves it).
pub const DEFAULT_PICKUP: f64 = 0.1;

impl<S: Scalar> Waveguide<S> {
    /// A silent string for pitch `f0` Hz at `fs` Hz, voiced by `voicing`;
    /// `None` for settings it can't play (as [`KsString`](crate::KsString)).
    #[must_use]
    pub fn new(fs: f64, f0: f64, voicing: Voicing) -> Option<Self> {
        let n = voicing.coefficients(fs, f0)?.n;
        Self::with_capacity(fs, f0, voicing, n)
    }

    /// As [`new`](Self::new), with room for a loop of `cap` samples, so
    /// [`restring`](Self::restring) up to it never allocates.
    #[must_use]
    pub fn with_capacity(fs: f64, f0: f64, voicing: Voicing, cap: usize) -> Option<Self> {
        let c = voicing.coefficients(fs, f0)?;
        let rail_cap = cap / 2;
        let m = c.n / 2;
        let (length, first) = geometry(fs, c.pitch, m);
        Some(Self {
            right: DelayLine::with_capacity(m, rail_cap)?,
            left: DelayLine::with_capacity(m, rail_cap)?,
            odd: (c.n % 2 == 1).then_some(S::ZERO),
            bridge: Bridge::new(&c),
            pickup: DEFAULT_PICKUP,
            length,
            first,
            hammer: None,
        })
    }

    /// Re-voices this string for a new note, silent, reusing its rails.
    /// `false`, changing nothing, for settings it can't play or a note
    /// longer than the capacity.
    pub fn restring(&mut self, fs: f64, f0: f64, voicing: Voicing) -> bool {
        let Some(c) = voicing.coefficients(fs, f0) else {
            return false;
        };
        let m = c.n / 2;
        let fits = m <= self.right.capacity() && m <= self.left.capacity() && m > 0;
        if !fits {
            return false;
        }
        self.right.reset(m);
        self.left.reset(m);
        self.odd = (c.n % 2 == 1).then_some(S::ZERO);
        (self.length, self.first) = geometry(fs, c.pitch, m);
        self.bridge.apply(&c);
        self.hammer = None;
        true
    }

    /// The loop's length `N`, samples (`2M`, plus 1 when odd).
    #[must_use]
    pub fn delay(&self) -> usize {
        2 * self.right.len() + usize::from(self.odd.is_some())
    }

    /// Each rail's length `M`, samples.
    #[must_use]
    pub fn rail(&self) -> usize {
        self.right.len()
    }

    /// The pitch this string plays, Hz.
    #[must_use]
    pub const fn pitch(&self) -> f64 {
        self.bridge.pitch()
    }

    /// The release: see [`KsString::damp`](crate::KsString::damp).
    pub fn damp(&mut self, t60: f64) {
        self.bridge.damp(t60);
    }

    /// Plucks the string into `shape(s)` (`s` from the bridge, 0 to 1),
    /// at rest: a displacement with zero velocity is two equal traveling
    /// waves, each half the shape. `shape` is called once per cell and both
    /// rails take that value, so a random shape (noise) is still at rest.
    /// The loop then holds `R` and `−L`, which cancel: no DC to remove
    /// (unlike A1's loop, which subtracts its mean). Clears the bridge's
    /// memory.
    pub fn pluck(&mut self, mut shape: impl FnMut(f64) -> S) {
        let m = self.right.len();
        let (length, first) = (self.length, self.first);
        #[expect(
            clippy::cast_precision_loss,
            reason = "rail lengths are far below 2^53"
        )]
        let at = |c: usize| (c as f64 + first) / length;
        let half = S::from_f64(0.5);
        self.right.fill(|c| shape(at(c)) * half);
        // The left rail runs the other way (its front is the cell nearest
        // the nut), and takes the right rail's value at each cell.
        let right = &self.right;
        self.left.fill(|j| right.at(m - 1 - j));
        if let Some(e) = self.odd.as_mut() {
            *e = S::ZERO;
        }
        self.bridge.clear();
        self.hammer = None;
    }

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
        #[expect(
            clippy::cast_precision_loss,
            reason = "rail lengths are far below 2^53"
        )]
        let x = (s.clamp(0.0, 1.0) * self.length - self.first - 0.5)
            .round()
            .clamp(0.0, (m - 2) as f64);
        #[expect(
            clippy::cast_possible_truncation,
            clippy::cast_sign_loss,
            reason = "x is clamped to the rail"
        )]
        let c = x as usize;
        self.hammer = Some((hammer, c));
        true
    }

    /// Zeros the rails and the bridge's memory.
    fn silence(&mut self) {
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

    /// Advances one sample and returns the bridge's output (the loop
    /// filter's): the signal A1's loop produces from the same state.
    pub fn step(&mut self) -> S {
        let at_bridge = self.right.front();
        let at_nut = self.left.front();
        let y = self.bridge.process(at_bridge);
        // The odd loop's extra sample: this output waits a step.
        let out = match self.odd.as_mut() {
            Some(e) => core::mem::replace(e, y),
            None => y,
        };
        self.right.push(-at_nut);
        self.left.push(-out);
        if let Some((hammer, c)) = self.hammer.as_mut() {
            let m = self.right.len();
            // After the move, the right rail's cell c and the left rail's
            // cell c + 1 hold the waves that just crossed the junction.
            let (r, l) = (*c, m - 2 - *c);
            let incoming = self.right.at(r) + self.left.at(l);
            let launched = S::from_f64(hammer.step(incoming.to_f64()));
            self.right.add_at(r, launched);
            self.left.add_at(l, launched);
        }
        y
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

    /// Moves the pickup to `s` (from the bridge, clamped to 0..1).
    pub const fn set_pickup(&mut self, s: f64) {
        self.pickup = s.clamp(0.0, 1.0);
    }

    /// The displacement at the pickup, read between cells linearly.
    #[must_use]
    pub fn displacement(&self) -> S {
        let m = self.right.len();
        // The pickup's cell coordinate (cell c's center is at c).
        #[expect(
            clippy::cast_precision_loss,
            reason = "rail lengths are far below 2^53"
        )]
        let x = (self.pickup * self.length - self.first).clamp(0.0, (m - 1) as f64);
        #[expect(
            clippy::cast_possible_truncation,
            clippy::cast_sign_loss,
            reason = "x is clamped to the rail"
        )]
        let c0 = x as usize;
        let c1 = (c0 + 1).min(m - 1);
        #[expect(
            clippy::cast_precision_loss,
            reason = "rail lengths are far below 2^53"
        )]
        let frac = S::from_f64(x - c0 as f64);
        let a = self.cell(c0);
        a + (self.cell(c1) - a) * frac
    }

    /// The displacement at cell `c` (0 nearest the bridge).
    fn cell(&self, c: usize) -> S {
        let m = self.right.len();
        self.right.at(c) + self.left.at(m - 1 - c)
    }

    /// The next output: advance one sample, read the pickup.
    pub fn next_sample(&mut self) -> S {
        self.step();
        self.displacement()
    }

    /// Fills `out` with the next samples.
    pub fn render(&mut self, out: &mut [S]) {
        for s in out {
            *s = self.next_sample();
        }
    }

    /// Where cell `c`'s center is, from the bridge (0 to 1 of the
    /// effective length).
    #[must_use]
    pub fn position(&self, c: usize) -> f64 {
        #[expect(
            clippy::cast_precision_loss,
            reason = "rail lengths are far below 2^53"
        )]
        let c = c as f64;
        (c + self.first) / self.length
    }

    /// The string's shape, cell by cell from the bridge: what the page
    /// draws.
    pub fn shape(&self) -> impl Iterator<Item = S> + '_ {
        (0..self.right.len()).map(|c| self.cell(c))
    }

    /// Lays out an A1 loop's delay line (oldest first) on this string so
    /// the bridge sees the same samples in the same order: its first `M`
    /// on the right rail, the next `M` negated on the left (the nut
    /// inverts them on the way), the last in the bridge when odd. The
    /// Karplus–Strong equivalence test.
    #[cfg(test)]
    pub(crate) fn load_loop(&mut self, line: &[S]) {
        let m = self.right.len();
        let get = |i: usize| line.get(i).copied().unwrap_or(S::ZERO);
        self.right.fill(get);
        self.left.fill(|j| -get(m + j));
        if let Some(e) = self.odd.as_mut() {
            *e = get(2 * m);
        }
        self.bridge.clear();
    }

    /// Sets the rails directly, front first (missing samples 0).
    #[cfg(test)]
    pub(crate) fn load_rails(&mut self, right: &[S], left: &[S]) {
        self.right
            .fill(|i| right.get(i).copied().unwrap_or(S::ZERO));
        self.left.fill(|i| left.get(i).copied().unwrap_or(S::ZERO));
    }

    /// The right and left rails' values at cell `c`.
    #[cfg(test)]
    pub(crate) fn rails_at(&self, c: usize) -> (S, S) {
        let m = self.right.len();
        (self.right.at(c), self.left.at(m - 1 - c))
    }

    /// The left rail's newest sample (just reflected at the bridge).
    #[cfg(test)]
    pub(crate) fn left_newest(&self) -> S {
        self.left.back()
    }
}

/// The effective length in cells, `fs / 2f₀` (half the loop's period),
/// and cell 0's center's distance from the effective bridge: the length
/// minus the `M` cells' own, plus half a cell. Falls back to the bare
/// rail (`M`, `½`) for a pitch that isn't positive.
fn geometry(fs: f64, pitch: f64, m: usize) -> (f64, f64) {
    #[expect(
        clippy::cast_precision_loss,
        reason = "rail lengths are far below 2^53"
    )]
    let m = m as f64;
    let length = fs / (2.0 * pitch);
    // `length > 0` is false for NaN too.
    let usable = length > 0.0 && length.is_finite();
    if usable {
        (length, length - m + 0.5)
    } else {
        (m, 0.5)
    }
}

#[cfg(test)]
mod tests;
