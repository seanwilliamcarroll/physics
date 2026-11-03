//! [`Baumgarte`]: the impulse solver's β ∈ [0, 1] (M3).

/// `Box2D` v2's `b2_baumgarte` (`b2Settings.h`): a common default, and the β
/// in `01-solvers.md`'s measured table.
pub const DEFAULT_BAUMGARTE: f64 = 0.2;

checked_param! {
    /// The impulse solver's Baumgarte factor β: a value known to be in
    /// `[0, 1]`. 0 is no feedback (the rod drifts); 1 asks for the whole
    /// position error back in one substep; above 1 overshoots, so it's
    /// rejected, as is NaN. A world setting rather than part of `Solver`,
    /// so `Solver` stays a plain enum.
    Baumgarte, |beta| beta >= S::ZERO && beta <= S::ONE
}

#[cfg(test)]
mod tests;
