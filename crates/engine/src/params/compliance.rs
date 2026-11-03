//! [`Compliance`]: a constraint's α = 1 / stiffness ≥ 0 (M4).

checked_param! {
    /// Compliance α = 1 / stiffness, m/N: a value known to be `≥ 0`. 0 is a
    /// rigid constraint; larger is softer. Negative compliance (negative
    /// stiffness, an anti-spring) and NaN are rejected. Both solvers read it
    /// the same way (`docs/06-constraints.md`, "Compliance in both
    /// solvers"), so `k = 1/α` means the same spring in either.
    Compliance, |alpha| alpha >= S::ZERO
}

impl<S: crate::Scalar> Compliance<S> {
    /// α = 0: rigid.
    pub const RIGID: Self = Self(S::ZERO);
}

#[cfg(test)]
mod tests;
