//! The broadphase: a uniform grid, as a sorted cell list
//! (`docs/08-collision.md`, "Contact generation").

use crate::sort_key::{SortKey, index_key, sort};
use crate::{Scalar, Vec2};

/// A circle's cell and index, sorted by cell: the engine's one sort key
/// (`sort_key.rs`).
type Key = SortKey;

/// Neighbor offsets checked from each cell besides itself: four of the
/// eight, so each neighboring pair of cells is visited once (the other
/// four are visited from the other side).
const HALF_NEIGHBORS: [(i64, i64); 4] = [(1, 0), (-1, 1), (0, 1), (1, 1)];

/// Writes into `out` (cleared first) every pair `(a, b)`, `a < b`, of
/// circles (radius > 0) in the same or neighboring grid cells of size
/// `cell` m, sorted. With `cell` at least the largest diameter (plus any
/// margin), that's a superset of the pairs that overlap
/// (`tests/broadphase_properties.rs`). Points (radius 0) never pair. A
/// `cell` that isn't positive and finite gives no pairs.
///
/// A *sorted cell list* rather than a dense array of cells: each circle's
/// cell `(⌊x / cell⌋, ⌊y / cell⌋)` is sorted, and a neighbor cell's
/// circles are found by binary search. Memory is proportional to the
/// circles, not to the area they span, so one runaway particle can't make
/// the grid huge; and the sort makes the output deterministic.
pub fn candidate_pairs<S: Scalar>(
    pos: &[Vec2<S>],
    radius: &[S],
    cell: S,
    out: &mut Vec<(usize, usize)>,
) {
    out.clear();
    let cell = cell.to_f64();
    // `cell > 0` is false for NaN too.
    let usable = cell > 0.0 && cell.is_finite();
    if !usable {
        return;
    }
    let mut keys: Vec<Key> = pos
        .iter()
        .zip(radius)
        .enumerate()
        .filter(|(_, (_, r))| **r > S::ZERO)
        .map(|(i, (x, _))| (cell_of(x.x.to_f64(), cell), cell_of(x.y.to_f64(), cell), i))
        .collect();
    sort(&mut keys);
    // Each run of equal cells is one occupied cell.
    for here in keys.chunk_by(|p, q| (p.0, p.1) == (q.0, q.1)) {
        let Some(&(cx, cy, _)) = here.first() else {
            continue;
        };
        let mut rest = here;
        while let Some((&(_, _, a), tail)) = rest.split_first() {
            for &(_, _, b) in tail {
                out.push(ordered(a, b));
            }
            rest = tail;
        }
        for (dx, dy) in HALF_NEIGHBORS {
            for &(_, _, b) in cell_run(&keys, cx.saturating_add(dx), cy.saturating_add(dy)) {
                for &(_, _, a) in here {
                    out.push(ordered(a, b));
                }
            }
        }
    }
    sort_pairs(out);
}

/// Sorts `pairs` by `(a, b)` through the shared key (`(a, b, b)`: the
/// third field only carries `b` back), so no `(usize, usize)` sort is
/// compiled.
fn sort_pairs(pairs: &mut Vec<(usize, usize)>) {
    let mut keys: Vec<SortKey> = pairs
        .iter()
        .map(|&(a, b)| (index_key(a), index_key(b), b))
        .collect();
    sort(&mut keys);
    pairs.clear();
    pairs.extend(
        keys.iter()
            .filter_map(|&(a, _, b)| usize::try_from(a).ok().map(|a| (a, b))),
    );
}

/// The cell index of coordinate `v` (m): `⌊v / cell⌋`. Saturates at the
/// `i64` range, and NaN goes to 0: a runaway or broken particle lands in
/// some cell rather than panicking (its pairs are then the narrowphase's
/// problem, which rejects NaN).
#[expect(
    clippy::cast_possible_truncation,
    reason = "saturating float-to-int: out-of-range coordinates share an edge cell, by design"
)]
fn cell_of(v: f64, cell: f64) -> i64 {
    (v / cell).floor() as i64
}

/// The keys in cell `(cx, cy)`: a contiguous run of the sorted `keys`.
fn cell_run(keys: &[Key], cx: i64, cy: i64) -> &[Key] {
    let lo = keys.partition_point(|k| (k.0, k.1) < (cx, cy));
    let hi = keys.partition_point(|k| (k.0, k.1) <= (cx, cy));
    keys.get(lo..hi).unwrap_or_default()
}

const fn ordered(a: usize, b: usize) -> (usize, usize) {
    if a < b { (a, b) } else { (b, a) }
}

#[cfg(test)]
mod tests;
