//! [`DelayLine`]: a fixed-length FIFO of samples, as a ring buffer.

use crate::Scalar;

/// The last `len` samples written, oldest first: [`front`](Self::front)
/// is the sample written `len` pushes ago (`y[n − N]`), and
/// [`push`](Self::push) replaces it with the newest.
///
/// A ring buffer: a push overwrites one slot and advances an index, so a
/// sample costs O(1) and never allocates (the audio thread's rule).
#[derive(Clone, Debug)]
pub struct DelayLine<S> {
    buf: Vec<S>,
    /// The oldest sample's slot, which the next push overwrites.
    head: usize,
}

impl<S: Scalar> DelayLine<S> {
    /// A line of `len` zeros; `None` for `len == 0` (no delay to read).
    #[must_use]
    pub fn new(len: usize) -> Option<Self> {
        (len > 0).then(|| Self {
            buf: vec![S::ZERO; len],
            head: 0,
        })
    }

    #[must_use]
    pub fn len(&self) -> usize {
        self.buf.len()
    }

    /// The longest this line can [`reset`](Self::reset) to without
    /// allocating.
    #[must_use]
    pub fn capacity(&self) -> usize {
        self.buf.capacity()
    }

    /// Never true: a line has at least one sample (see [`new`](Self::new)).
    #[must_use]
    pub fn is_empty(&self) -> bool {
        self.buf.is_empty()
    }

    /// The oldest sample, written `len` pushes ago.
    #[must_use]
    pub fn front(&self) -> S {
        self.buf.get(self.head).copied().unwrap_or(S::ZERO)
    }

    /// Sample `j` counting from the front (0 = the oldest, the next to
    /// leave); 0 past the end.
    #[must_use]
    pub fn at(&self, j: usize) -> S {
        let n = self.buf.len();
        self.buf
            .get((self.head + j) % n)
            .copied()
            .unwrap_or(S::ZERO)
    }

    /// Adds `v` to sample `j` counting from the front (nothing past the
    /// end): a force entering a string mid-rail (`docs/14-piano.md`).
    pub fn add_at(&mut self, j: usize, v: S) {
        let n = self.buf.len();
        if j < n
            && let Some(x) = self.buf.get_mut((self.head + j) % n)
        {
            *x += v;
        }
    }

    /// The newest sample (the last pushed).
    #[must_use]
    pub fn back(&self) -> S {
        self.at(self.buf.len() - 1)
    }

    /// Replaces the oldest sample with `v`, the newest.
    pub fn push(&mut self, v: S) {
        if let Some(slot) = self.buf.get_mut(self.head) {
            *slot = v;
        }
        self.head = (self.head + 1) % self.buf.len();
    }

    /// The samples, oldest first: what the page draws.
    pub fn iter(&self) -> impl Iterator<Item = S> + '_ {
        let (newer, older) = self.buf.split_at(self.head);
        older.iter().chain(newer).copied()
    }

    /// A line of `len` zeros with room for `cap`
    /// samples, so [`reset`](Self::reset) up to `cap` never allocates
    /// (a voice's line, sized once for its lowest note). `None` for
    /// `len == 0` or `len > cap`.
    #[must_use]
    pub fn with_capacity(len: usize, cap: usize) -> Option<Self> {
        if len == 0 || len > cap {
            return None;
        }
        let mut buf = Vec::with_capacity(cap);
        buf.resize(len, S::ZERO);
        Some(Self { buf, head: 0 })
    }

    /// Makes this a line of `len` zeros, reusing the buffer: no allocation
    /// while `len` fits the capacity. `false`, changing nothing, for
    /// `len == 0` or a `len` over the capacity.
    pub fn reset(&mut self, len: usize) -> bool {
        if len == 0 || len > self.buf.capacity() {
            return false;
        }
        self.buf.clear();
        self.buf.resize(len, S::ZERO);
        self.head = 0;
        true
    }

    /// Subtracts the mean from every sample: a pluck's DC offset would sit
    /// in the loop, which passes DC at full gain, and decay only by `ρ`.
    pub fn remove_mean(&mut self) {
        let sum = self.buf.iter().fold(S::ZERO, |a, &x| a + x);
        #[expect(
            clippy::cast_precision_loss,
            reason = "line lengths are far below 2^53"
        )]
        let mean = sum / S::from_f64(self.buf.len() as f64);
        for x in &mut self.buf {
            *x -= mean;
        }
    }

    /// Sets slot `i` (0 = oldest) to `f(i)`, every slot: a pluck.
    pub fn fill(&mut self, mut f: impl FnMut(usize) -> S) {
        let n = self.buf.len();
        for (k, slot) in self.buf.iter_mut().enumerate() {
            // Slot k holds the sample (k − head) mod n positions from the front.
            *slot = f((k + n - self.head) % n);
        }
    }
}

#[cfg(test)]
mod tests;
