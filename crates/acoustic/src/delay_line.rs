//! [`DelayLine`]: a fixed-length FIFO of samples, as a ring buffer.

use crate::Scalar;
use math::convert::usize_to_f64;

/// The last `len` samples written, oldest first: [`front`](Self::front)
/// is the sample written `len` pushes ago (`y[n − N]`), and
/// [`push`](Self::push) replaces it with the newest.
///
/// A ring buffer: a push overwrites one slot and advances an index, so a
/// sample costs O(1) and never allocates (the audio thread's rule).
#[derive(Clone, Debug)]
pub(crate) struct DelayLine<S> {
    samples: Vec<S>,
    /// The oldest sample's slot, which the next push overwrites.
    head: usize,
}

impl<S: Scalar> DelayLine<S> {
    /// A line of `len` zeros; `None` for `len == 0` (no delay to read).
    #[cfg(test)]
    #[must_use]
    pub(crate) fn new(len: usize) -> Option<Self> {
        (len > 0).then(|| Self {
            samples: vec![S::ZERO; len],
            head: 0,
        })
    }

    #[must_use]
    pub(crate) fn len(&self) -> usize {
        self.samples.len()
    }

    /// The longest this line can [`reset`](Self::reset) to without
    /// allocating.
    #[must_use]
    pub(crate) fn capacity(&self) -> usize {
        self.samples.capacity()
    }

    #[cfg(test)]
    #[must_use]
    pub(crate) fn is_empty(&self) -> bool {
        self.samples.is_empty()
    }

    #[must_use]
    pub(crate) fn front(&self) -> S {
        self.samples.get(self.head).copied().unwrap_or(S::ZERO)
    }

    /// Sample `offset` counting from the front (0 = the oldest, the next to
    /// leave); 0 past the end.
    #[must_use]
    pub(crate) fn at(&self, offset: usize) -> S {
        let len = self.samples.len();
        if offset < len {
            self.samples
                .get((self.head + offset) % len)
                .copied()
                .unwrap_or(S::ZERO)
        } else {
            S::ZERO
        }
    }

    /// Adds `amount` to sample `offset` counting from the front (nothing
    /// past the end): a force entering a string mid-rail
    /// (`docs/14-piano.md`).
    pub(crate) fn add_at(&mut self, offset: usize, amount: S) {
        let len = self.samples.len();
        if offset < len
            && let Some(sample) = self.samples.get_mut((self.head + offset) % len)
        {
            *sample += amount;
        }
    }

    #[cfg(test)]
    #[must_use]
    pub(crate) fn back(&self) -> S {
        self.at(self.samples.len() - 1)
    }

    pub(crate) fn push(&mut self, sample: S) {
        if let Some(slot) = self.samples.get_mut(self.head) {
            *slot = sample;
        }
        self.head = (self.head + 1) % self.samples.len();
    }

    pub(crate) fn iter(&self) -> impl Iterator<Item = S> + '_ {
        let (newer, older) = self.samples.split_at(self.head);
        older.iter().chain(newer).copied()
    }

    /// A line of `len` zeros with room for `capacity` samples, so
    /// [`reset`](Self::reset) up to `capacity` never allocates (a voice's
    /// line, sized once for its lowest note). `None` for `len == 0` or
    /// `len > capacity`.
    #[must_use]
    pub(crate) fn with_capacity(len: usize, capacity: usize) -> Option<Self> {
        if len == 0 || len > capacity {
            return None;
        }
        let mut samples = Vec::with_capacity(capacity);
        samples.resize(len, S::ZERO);
        Some(Self { samples, head: 0 })
    }

    /// Makes this a line of `len` zeros, reusing the buffer: no allocation
    /// while `len` fits the capacity. `false`, changing nothing, for
    /// `len == 0` or a `len` over the capacity.
    pub(crate) fn reset(&mut self, len: usize) -> bool {
        if len == 0 || len > self.samples.capacity() {
            return false;
        }
        self.samples.clear();
        self.samples.resize(len, S::ZERO);
        self.head = 0;
        true
    }

    /// Subtracts the mean from every sample: a pluck's DC offset would sit
    /// in the loop, which passes DC at full gain, and decay only by `ρ`.
    pub(crate) fn remove_mean(&mut self) {
        let sum = self
            .samples
            .iter()
            .fold(S::ZERO, |total, &sample| total + sample);
        let mean = sum / S::from_f64(usize_to_f64(self.samples.len()));
        for sample in &mut self.samples {
            *sample -= mean;
        }
    }

    /// Sets every slot to `value_at(offset)` for its `offset` from the
    /// front (0 = oldest): a pluck.
    pub(crate) fn fill(&mut self, mut value_at: impl FnMut(usize) -> S) {
        let len = self.samples.len();
        for (slot_index, slot) in self.samples.iter_mut().enumerate() {
            // The slot holds the sample (slot_index − head) mod len positions
            // from the front.
            *slot = value_at((slot_index + len - self.head) % len);
        }
    }
}

#[cfg(test)]
mod tests;
