//! A small dense linear solve, for the note-on and offline fits
//! (`dispersion`'s refinement, `hammer`'s smoothing).

/// Solves the augmented system `[A | b]` in place by Gaussian elimination
/// with partial pivoting; `None` if it's singular.
pub(crate) fn solve(system: &mut [Vec<f64>]) -> Option<Vec<f64>> {
    let size = system.len();
    for column in 0..size {
        let pivot = (column..size).max_by(|&first, &second| {
            let (first_value, second_value) = (
                system.get(first).and_then(|row| row.get(column)),
                system.get(second).and_then(|row| row.get(column)),
            );
            first_value
                .map_or(0.0, |value| value.abs())
                .total_cmp(&second_value.map_or(0.0, |value| value.abs()))
        })?;
        system.swap(column, pivot);
        let (top, rest) = system.split_at_mut(column + 1);
        let pivot_row = top.last()?;
        let lead = *pivot_row.get(column)?;
        if lead == 0.0 {
            return None;
        }
        let tail = pivot_row.get(column..).unwrap_or_default();
        for other in rest {
            let factor = other.get(column).copied().unwrap_or(0.0) / lead;
            // Over the slices from `column` on, not `zip(…).skip(column)`: a
            // known length, so the loop vectorizes (it didn't).
            for (entry, &pivot_entry) in other
                .get_mut(column..)
                .unwrap_or_default()
                .iter_mut()
                .zip(tail)
            {
                *entry -= factor * pivot_entry;
            }
        }
    }
    let mut solution = vec![0.0; size];
    for column in (0..size).rev() {
        let row = system.get(column)?;
        let tail: f64 = row
            .iter()
            .zip(&solution)
            .skip(column + 1)
            .take(size - column - 1)
            .map(|(coefficient, unknown)| coefficient * unknown)
            .sum();
        let value = (row.get(size)? - tail) / row.get(column)?;
        *solution.get_mut(column)? = value;
    }
    Some(solution)
}
