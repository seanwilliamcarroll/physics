//! [`TimeStep`]: a step's dt > 0, finite (audit, after A3).

checked_param! {
    /// A step's duration, s: a value known to be positive and finite.
    /// [`World::step`](crate::World::step) takes one, so a negative,
    /// zero, NaN or infinite step can't be asked for. Zero isn't harmless:
    /// XPBD derives velocities as `(x − x_prev) / h`, which is `0 / 0` at
    /// `h = 0`.
    TimeStep, |dt| dt > S::ZERO
}

impl<S: crate::Scalar> TimeStep<S> {
    /// One step of a clock running `rate` steps per second (`dt = 1 /
    /// rate`): `None` for a rate that isn't positive and finite, or whose
    /// inverse isn't (a rate so large `1 / rate` underflows to 0).
    #[must_use]
    pub fn per_second(rate: f64) -> Option<Self> {
        Self::new(S::from_f64(1.0 / rate))
    }
}

#[cfg(test)]
mod tests;
