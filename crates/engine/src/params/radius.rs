//! [`Radius`]: a circle's r > 0, finite (M6).

checked_param! {
    /// A circle's radius, m: a value known to be positive and finite
    /// (`docs/08-collision.md`, "Shapes"). Particles without one are points
    /// that never collide (radius 0 in [`Particles`](crate::Particles)), so
    /// a `Radius` is never 0.
    Radius, |r| r > S::ZERO
}

#[cfg(test)]
mod tests;
