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
