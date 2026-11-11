//! Parsing at the C ABI: what JS passes is a bare number, checked here
//! once, before it reaches a simulation.

/// `n` as a size, if it's at most `max` (an ABI cap: the most work one
/// call may ask for).
#[must_use]
pub fn capped(n: u32, max: u32) -> Option<usize> {
    if n > max {
        return None;
    }
    usize::try_from(n).ok()
}

#[cfg(test)]
mod tests;
