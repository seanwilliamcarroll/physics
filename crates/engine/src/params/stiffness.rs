//! [`Stiffness`]: a force-based spring's k > 0, finite.

checked_param! {
    /// Spring stiffness k, N/m: a value known to be positive and finite. A
    /// force-based spring can't be rigid (k = ∞ is no force law); rigid
    /// springs are compliant constraints with [`Compliance::RIGID`](crate::Compliance::RIGID).
    Stiffness, |stiffness| stiffness > S::ZERO
}

#[cfg(test)]
mod tests;
