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
/// circles are found in the sorted list (by cursors that follow the
/// visiting order). Memory is proportional to the
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
    // Each run of equal cells is one occupied cell: listed once, in
    // order. The cells are visited in that order, so each of the four
    // neighbors' positions in the list only moves forward: a cursor per
    // offset finds it in a step or two (not two binary searches over
    // every circle, per neighbor: that was over half of this function;
    // `docs/profiling.md`).
    let mut runs: Vec<Run> = Vec::new();
    let mut at = 0;
    for here in keys.chunk_by(|p, q| (p.0, p.1) == (q.0, q.1)) {
        if let Some(&(cx, cy, _)) = here.first() {
            runs.push((cx, cy, at));
        }
        at += here.len();
    }
    let mut cursors = [0_usize; 4];
    for (r, &(cx, cy, start)) in runs.iter().enumerate() {
        let here = run_at(&keys, &runs, r, start);
        let mut rest = here;
        while let Some((&(_, _, a), tail)) = rest.split_first() {
            for &(_, _, b) in tail {
                out.push(ordered(a, b));
            }
            rest = tail;
        }
        // At the edge of the `i64` range an offset saturates: it can land
        // back on this cell (a circle would pair with itself) or on a cell
        // another offset already reached (pairs twice). Each neighbor once,
        // and never this cell (found by the exports' call-sequence property
        // test at the slow tier's 10 000 cases: a runaway particle).
        let mut seen = [(cx, cy); 4];
        for (k, ((dx, dy), cursor)) in HALF_NEIGHBORS.into_iter().zip(&mut cursors).enumerate() {
            let there = (cx.saturating_add(dx), cy.saturating_add(dy));
            if seen.iter().take(k + 1).any(|&c| c == there) {
                continue;
            }
            if let Some(slot) = seen.get_mut(k) {
                *slot = there;
            }
            for &(_, _, b) in cell_run(&keys, &runs, cursor, there) {
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

/// An occupied cell `(cx, cy)` and where its run starts in the sorted
/// keys (it ends where the next begins).
type Run = (i64, i64, usize);

/// The keys of run `r`, which starts at `start`.
fn run_at<'a>(keys: &'a [Key], runs: &[Run], r: usize, start: usize) -> &'a [Key] {
    let end = runs.get(r + 1).map_or(keys.len(), |next| next.2);
    keys.get(start..end).unwrap_or_default()
}

/// The keys in cell `there`: a contiguous run of the sorted `keys`, found
/// through `runs` (the occupied cells in order); empty if the cell is.
///
/// `cursor` is where the last search for this neighbor offset ended: the
/// first run at or after its cell. Visiting cells in order, the next
/// search's cell is later still, so the cursor walks forward to it. The
/// one exception is at the edge of the `i64` range, where the offset
/// saturates and a later cell's neighbor can be an earlier cell (after
/// column `MAX − 1`, which no `f64` coordinate lands in: cells that far
/// out are 1024 apart; handled all the same): seen as a run before the
/// cursor that isn't before `there`, and answered by binary search,
/// leaving the cursor alone.
fn cell_run<'a>(keys: &'a [Key], runs: &[Run], cursor: &mut usize, there: (i64, i64)) -> &'a [Key] {
    let cell = |r: usize| runs.get(r).map(|&(cx, cy, _)| (cx, cy));
    let behind = cursor
        .checked_sub(1)
        .and_then(cell)
        .is_some_and(|c| c >= there);
    let r = if behind {
        runs.partition_point(|&(cx, cy, _)| (cx, cy) < there)
    } else {
        while cell(*cursor).is_some_and(|c| c < there) {
            *cursor += 1;
        }
        *cursor
    };
    match runs.get(r) {
        Some(&(cx, cy, start)) if (cx, cy) == there => run_at(keys, runs, r, start),
        _ => &[],
    }
}

const fn ordered(a: usize, b: usize) -> (usize, usize) {
    if a < b { (a, b) } else { (b, a) }
}

#[cfg(test)]
mod tests;
