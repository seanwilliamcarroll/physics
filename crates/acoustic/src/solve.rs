//! A small dense linear solve, for the note-on and offline fits
//! (`dispersion`'s refinement, `hammer`'s smoothing).

/// Solves the augmented system `[A | b]` in place by Gaussian elimination
/// with partial pivoting; `None` if it's singular.
pub(crate) fn solve(m: &mut [Vec<f64>]) -> Option<Vec<f64>> {
    let n = m.len();
    for c in 0..n {
        let pivot = (c..n).max_by(|&a, &b| {
            let (x, y) = (
                m.get(a).and_then(|r| r.get(c)),
                m.get(b).and_then(|r| r.get(c)),
            );
            x.map_or(0.0, |v| v.abs())
                .total_cmp(&y.map_or(0.0, |v| v.abs()))
        })?;
        m.swap(c, pivot);
        let (top, rest) = m.split_at_mut(c + 1);
        let row = top.last()?;
        let lead = *row.get(c)?;
        if lead == 0.0 {
            return None;
        }
        for other in rest {
            let f = other.get(c).copied().unwrap_or(0.0) / lead;
            for (o, &v) in other.iter_mut().zip(row.iter()).skip(c) {
                *o -= f * v;
            }
        }
    }
    let mut x = vec![0.0; n];
    for c in (0..n).rev() {
        let row = m.get(c)?;
        let tail: f64 = row
            .iter()
            .zip(&x)
            .skip(c + 1)
            .take(n - c - 1)
            .map(|(a, b)| a * b)
            .sum();
        let value = (row.get(n)? - tail) / row.get(c)?;
        *x.get_mut(c)? = value;
    }
    Some(x)
}
