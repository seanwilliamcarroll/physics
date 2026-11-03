//! [`OpeningAngle`]: Barnes–Hut θ ≥ 0 (M2).

checked_param! {
    /// Barnes–Hut opening angle θ: a value known to be `≥ 0`
    /// (`docs/type-invariants.md`: θ became a slider). θ = 0 is valid
    /// (exact direct summation through the tree); Barnes & Hut used about 1.
    OpeningAngle, |theta| theta >= S::ZERO
}

#[cfg(test)]
mod tests;
