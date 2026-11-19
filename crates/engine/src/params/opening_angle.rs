//! [`OpeningAngle`]: Barnes–Hut θ ≥ 0.

checked_param! {
    /// Barnes–Hut opening angle θ: a value known to be `≥ 0`. θ = 0 is valid
    /// (exact direct summation through the tree); Barnes & Hut used about 1.
    OpeningAngle, |opening_angle| opening_angle >= S::ZERO
}

#[cfg(test)]
mod tests;
