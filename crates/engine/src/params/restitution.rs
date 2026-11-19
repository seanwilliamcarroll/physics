//! [`Restitution`]: a collision's e ∈ [0, 1].

checked_param! {
    /// Coefficient of restitution e: a value known to be in `[0, 1]`. The
    /// ratio of separating to approaching normal speed in a collision: 0
    /// is perfectly inelastic (the bodies stop along the normal), 1 is
    /// elastic (no kinetic energy lost). Above 1 a collision would add
    /// energy, so it's rejected, as is NaN (`docs/08-collision.md`).
    Restitution, |restitution| restitution >= S::ZERO && restitution <= S::ONE
}

impl<S: crate::Scalar> Restitution<S> {
    /// e = 0: perfectly inelastic. A new world's default, so nothing
    /// bounces until asked to.
    pub const INELASTIC: Self = Self(S::ZERO);
    pub const ELASTIC: Self = Self(S::ONE);
}

#[cfg(test)]
mod tests;
