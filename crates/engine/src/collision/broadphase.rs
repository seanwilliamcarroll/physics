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
/// `cell_size` m, sorted. With `cell_size` at least the largest diameter
/// (plus any margin), that's a superset of the pairs that overlap
/// (`tests/broadphase_properties.rs`). Points (radius 0) never pair. A
/// `cell_size` that isn't positive and finite gives no pairs.
///
/// A *sorted cell list* rather than a dense array: memory is proportional
/// to the circles, not to the area they span, so one runaway particle
/// can't make the grid huge, and the sort makes the output deterministic.
pub fn candidate_pairs<S: Scalar>(
    positions: &[Vec2<S>],
    radii: &[S],
    cell_size: S,
    out: &mut Vec<(usize, usize)>,
) {
    out.clear();
    let cell_size = cell_size.to_f64();
    // `cell_size > 0` is false for NaN too.
    let usable = cell_size > 0.0 && cell_size.is_finite();
    if !usable {
        return;
    }
    let mut keys: Vec<Key> = positions
        .iter()
        .zip(radii)
        .enumerate()
        .filter(|(_, (_, radius))| **radius > S::ZERO)
        .map(|(index, (position, _))| {
            (
                cell_of(position.x.to_f64(), cell_size),
                cell_of(position.y.to_f64(), cell_size),
                index,
            )
        })
        .collect();
    sort(&mut keys);
    // Each run of equal cells is one occupied cell. Cells are visited in
    // order, so a neighbor's position only moves forward: a cursor per
    // offset finds it in a step or two (binary searches were over half of
    // this function; `docs/profiling.md`).
    let mut runs: Vec<Run> = Vec::new();
    let mut run_start = 0;
    for run_keys in keys.chunk_by(|first, second| (first.0, first.1) == (second.0, second.1)) {
        if let Some(&(cell_x, cell_y, _)) = run_keys.first() {
            runs.push((cell_x, cell_y, run_start));
        }
        run_start += run_keys.len();
    }
    let mut cursors = [0_usize; 4];
    for (run_index, &(cell_x, cell_y, start)) in runs.iter().enumerate() {
        let here = run_at(&keys, &runs, run_index, start);
        let mut rest = here;
        while let Some((&(_, _, first), tail)) = rest.split_first() {
            for &(_, _, second) in tail {
                out.push(ordered(first, second));
            }
            rest = tail;
        }
        // At the edge of the `i64` range an offset saturates: it can land
        // back on this cell (a circle would pair with itself) or on a cell
        // another offset already reached (pairs twice). Each neighbor once,
        // and never this cell.
        let mut seen = [(cell_x, cell_y); 4];
        for (offset_index, ((dx, dy), cursor)) in
            HALF_NEIGHBORS.into_iter().zip(&mut cursors).enumerate()
        {
            let neighbor = (cell_x.saturating_add(dx), cell_y.saturating_add(dy));
            if seen
                .iter()
                .take(offset_index + 1)
                .any(|&visited| visited == neighbor)
            {
                continue;
            }
            if let Some(slot) = seen.get_mut(offset_index) {
                *slot = neighbor;
            }
            for &(_, _, second) in cell_run(&keys, &runs, cursor, neighbor) {
                for &(_, _, first) in here {
                    out.push(ordered(first, second));
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
        .map(|&(first, second)| (index_key(first), index_key(second), second))
        .collect();
    sort(&mut keys);
    pairs.clear();
    pairs.extend(keys.iter().filter_map(|&(first, _, second)| {
        usize::try_from(first)
            .ok()
            .map(|first_index| (first_index, second))
    }));
}

/// The cell index of coordinate `coordinate` (m): `⌊coordinate / cell_size⌋`.
/// Saturates at the `i64` range, and NaN goes to 0: a runaway or broken
/// particle lands in some cell rather than panicking (its pairs are then
/// the narrowphase's problem, which rejects NaN).
#[expect(
    clippy::cast_possible_truncation,
    reason = "saturating float-to-int: out-of-range coordinates share an edge cell, by design"
)]
fn cell_of(coordinate: f64, cell_size: f64) -> i64 {
    (coordinate / cell_size).floor() as i64
}

/// An occupied cell `(cell_x, cell_y)` and where its run starts in the
/// sorted keys (it ends where the next begins).
type Run = (i64, i64, usize);

/// The keys of run `run_index`, which starts at `start`.
fn run_at<'a>(keys: &'a [Key], runs: &[Run], run_index: usize, start: usize) -> &'a [Key] {
    let end = runs.get(run_index + 1).map_or(keys.len(), |next| next.2);
    keys.get(start..end).unwrap_or_default()
}

/// The keys in cell `neighbor`: a contiguous run of the sorted `keys`,
/// found through `runs` (the occupied cells in order); empty if the cell
/// is.
///
/// `cursor` is where the last search for this neighbor offset ended: the
/// first run at or after its cell. Visiting cells in order, the next
/// search's cell is later still, so the cursor walks forward to it. The
/// one exception is at the edge of the `i64` range, where the offset
/// saturates and a later cell's neighbor can be an earlier cell (after
/// column `MAX − 1`, which no `f64` coordinate lands in: cells that far
/// out are 1024 apart; handled all the same): seen as a run before the
/// cursor that isn't before `neighbor`, and answered by binary search,
/// leaving the cursor alone.
fn cell_run<'a>(
    keys: &'a [Key],
    runs: &[Run],
    cursor: &mut usize,
    neighbor: (i64, i64),
) -> &'a [Key] {
    let run_cell = |run_index: usize| {
        runs.get(run_index)
            .map(|&(cell_x, cell_y, _)| (cell_x, cell_y))
    };
    let behind = cursor
        .checked_sub(1)
        .and_then(run_cell)
        .is_some_and(|cell| cell >= neighbor);
    let run_index = if behind {
        runs.partition_point(|&(cell_x, cell_y, _)| (cell_x, cell_y) < neighbor)
    } else {
        while run_cell(*cursor).is_some_and(|cell| cell < neighbor) {
            *cursor += 1;
        }
        *cursor
    };
    match runs.get(run_index) {
        Some(&(cell_x, cell_y, start)) if (cell_x, cell_y) == neighbor => {
            run_at(keys, runs, run_index, start)
        }
        _ => &[],
    }
}

const fn ordered(first: usize, second: usize) -> (usize, usize) {
    if first < second {
        (first, second)
    } else {
        (second, first)
    }
}

#[cfg(test)]
mod tests;
