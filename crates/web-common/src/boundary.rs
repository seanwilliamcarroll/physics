//! Parsing at the C ABI: what JS passes is a bare number, checked here
//! once, before it reaches a simulation.

/// `count` as a size, if it's at most `max` (an ABI cap: the most work one
/// call may ask for).
#[must_use]
pub fn capped(count: u32, max: u32) -> Option<usize> {
    if count > max {
        return None;
    }
    usize::try_from(count).ok()
}

#[cfg(test)]
mod tests;
