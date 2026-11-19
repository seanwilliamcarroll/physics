//! The lane loop: candidates without branches, each one's terms times 0 or
//! 1, into `L` independent partial sums per quantity, so the loop runs
//! as vector instructions (float addition isn't associative, so the
//! compiler won't split one running sum into lanes by itself). Lane `i`
//! adds candidates `i`, `i + L`, …, and the lanes are added in order at
//! the end: that order is the results' bits.

use super::knobs::{SUM, Sum, Tail};
use super::{Ranges, Seen};
use crate::Boid;

/// Every whole block of `L` candidates into `seen`; the leftovers are the
/// caller's.
pub(super) fn add_blocks<const L: usize>(
    seen: &mut Seen,
    ranges: Ranges,
    me: Boid,
    blocks_x: &[[f32; L]],
    blocks_y: &[[f32; L]],
    blocks_vx: &[[f32; L]],
    blocks_vy: &[[f32; L]],
) {
    let mut lanes = Lanes::new();
    for (((block_x, block_y), block_vx), block_vy) in
        blocks_x.iter().zip(blocks_y).zip(blocks_vx).zip(blocks_vy)
    {
        lanes.add(ranges, me, block_x, block_y, block_vx, block_vy);
    }
    lanes.add_into(seen);
}

/// Sorted's spans of the flock's arrays into `seen`: whole blocks through
/// the lane loop, leftovers scalar or as one more masked block
/// (`SWARM_TAIL`), lanes added into `seen` per span or once at the end
/// (`SWARM_SPAN`). The settings are arguments for the tests.
pub(super) fn add_spans<const L: usize>(
    seen: &mut Seen,
    ranges: Ranges,
    me: Boid,
    [x, y, vx, vy]: [&[f32]; 4],
    spans: impl Iterator<Item = core::ops::Range<usize>>,
    (per_boid, leftovers): (bool, Tail),
) {
    let mut lanes = Lanes::<L>::new();
    for span in spans {
        let (
            (blocks_x, leftover_x),
            (blocks_y, leftover_y),
            (blocks_vx, leftover_vx),
            (blocks_vy, leftover_vy),
        ) = (
            part(x, &span).as_chunks::<L>(),
            part(y, &span).as_chunks::<L>(),
            part(vx, &span).as_chunks::<L>(),
            part(vy, &span).as_chunks::<L>(),
        );
        for (((block_x, block_y), block_vx), block_vy) in
            blocks_x.iter().zip(blocks_y).zip(blocks_vx).zip(blocks_vy)
        {
            lanes.add_apart(ranges, me, block_x, block_y, block_vx, block_vy);
        }
        let leftover_count = leftover_x.len();
        // The block of `L` ending at the span's end (or the arrays' first
        // `L`).
        let tail = span.end.saturating_sub(L)..span.end.saturating_sub(L) + L;
        let masked_block = (leftovers != Tail::Scalar && leftover_count > 0)
            .then(|| {
                Some((
                    block(x, &tail)?,
                    block(y, &tail)?,
                    block(vx, &tail)?,
                    block(vy, &tail)?,
                ))
            })
            .flatten();
        if let Some((block_x, block_y, block_vx, block_vy)) = masked_block {
            // The leftovers are lanes `first_lane..end_lane`; `end_lane < L`
            // when the block is the arrays' first `L`.
            let end_lane = span.end - tail.start;
            let first_lane = end_lane - leftover_count;
            let compared;
            let mask = match window::<L>(leftover_count) {
                Some(table_mask) if leftovers == Tail::Table && end_lane == L => table_mask,
                _ => {
                    compared =
                        core::array::from_fn(|lane| unit((first_lane..end_lane).contains(&lane)));
                    &compared
                }
            };
            lanes.add_masked(ranges, me, block_x, block_y, block_vx, block_vy, mask);
        }
        // Per span, the lanes go in before the leftovers.
        if !per_boid {
            core::mem::replace(&mut lanes, Lanes::new()).add_into(seen);
        }
        if masked_block.is_none() {
            for (((&x, &y), &vx), &vy) in leftover_x
                .iter()
                .zip(leftover_y)
                .zip(leftover_vx)
                .zip(leftover_vy)
            {
                seen.add(ranges, me, Boid { x, y, vx, vy });
            }
        }
    }
    if per_boid {
        lanes.add_into(seen);
    }
}

/// The most lanes there can be (`SWARM_LANES`, `knobs.rs`).
const MAX_LANES: usize = 64;

/// Zeros then ones, [`MAX_LANES`] of each: `window` slices a block's mask.
static STEPS: [f32; 2 * MAX_LANES] = steps();

const fn steps() -> [f32; 2 * MAX_LANES] {
    let mut table = [0.0; 2 * MAX_LANES];
    let mut slot = MAX_LANES;
    while slot < 2 * MAX_LANES {
        #[expect(
            clippy::indexing_slicing,
            reason = "const evaluation, in bounds by the loop; a slip fails the build"
        )]
        {
            table[slot] = 1.0;
        }
        slot += 1;
    }
    table
}

/// A block's mask counting only its last `counted` lanes, from [`STEPS`]
/// (one load, no compares).
fn window<const L: usize>(counted: usize) -> Option<&'static [f32; L]> {
    let start = (MAX_LANES + counted).checked_sub(L)?;
    STEPS
        .get(start..start + L)
        .and_then(|slice| <&[f32; L]>::try_from(slice).ok())
}

fn part<'a>(array: &'a [f32], range: &core::ops::Range<usize>) -> &'a [f32] {
    array.get(range.clone()).unwrap_or_default()
}

fn block<'a, const L: usize>(
    array: &'a [f32],
    range: &core::ops::Range<usize>,
) -> Option<&'a [f32; L]> {
    array
        .get(range.clone())
        .and_then(|slice| <&[f32; L]>::try_from(slice).ok())
}

/// `sum += term`, reassociable when the build says so (`SWARM_SUM`).
fn accumulate(sum: &mut f32, term: f32) {
    *sum = match SUM {
        Sum::Ordered => *sum + term,
        Sum::Algebraic => sum.algebraic_add(term),
    };
}

/// 1.0 if `condition`, else 0.0: the lane loop's masks, the same values
/// on every target. On `aarch64` a select: through an integer it took five
/// instructions a mask, the select two (Brute 14–16% faster on an M4).
/// Elsewhere through an integer: the select made x86's loop longer (Brute
/// 2.6% slower on Zen 5).
#[cfg(target_arch = "aarch64")]
pub(super) fn unit(condition: bool) -> f32 {
    if condition { 1.0 } else { 0.0 }
}

#[cfg(not(target_arch = "aarch64"))]
pub(super) fn unit(condition: bool) -> f32 {
    f32::from(u8::from(condition))
}

struct Lanes<const L: usize> {
    sum_x: [f32; L],
    sum_y: [f32; L],
    sum_vx: [f32; L],
    sum_vy: [f32; L],
    count: [f32; L],
    close_dx: [f32; L],
    close_dy: [f32; L],
}

impl<const L: usize> Lanes<L> {
    const fn new() -> Self {
        Self {
            sum_x: [0.0; L],
            sum_y: [0.0; L],
            sum_vx: [0.0; L],
            sum_vy: [0.0; L],
            count: [0.0; L],
            close_dx: [0.0; L],
            close_dy: [0.0; L],
        }
    }

    /// [`Self::add`] for Sorted, out of line in wasm: inlined, it made
    /// `step_sorted` too big for V8 (spills): 2.26 ms a step at 10,000
    /// against 1.63 apart, on the M4. Brute force keeps it inlined (apart,
    /// 22% slower).
    #[cfg_attr(target_arch = "wasm32", inline(never))]
    fn add_apart(
        &mut self,
        ranges: Ranges,
        me: Boid,
        x: &[f32; L],
        y: &[f32; L],
        vx: &[f32; L],
        vy: &[f32; L],
    ) {
        self.add(ranges, me, x, y, vx, vy);
    }

    fn add(
        &mut self,
        ranges: Ranges,
        me: Boid,
        x: &[f32; L],
        y: &[f32; L],
        vx: &[f32; L],
        vy: &[f32; L],
    ) {
        let sums = self
            .sum_x
            .iter_mut()
            .zip(&mut self.sum_y)
            .zip(&mut self.sum_vx)
            .zip(&mut self.sum_vy)
            .zip(&mut self.count)
            .zip(&mut self.close_dx)
            .zip(&mut self.close_dy);
        let others = x.iter().zip(y).zip(vx).zip(vy);
        for (
            ((((((sum_x, sum_y), sum_vx), sum_vy), count), close_dx), close_dy),
            (((&other_x, &other_y), &other_vx), &other_vy),
        ) in sums.zip(others)
        {
            let (dx, dy) = (me.x - other_x, me.y - other_y);
            let distance_sq = dx * dx + dy * dy;
            let close = unit(distance_sq < ranges.protected_sq);
            let near = unit(
                distance_sq >= ranges.protected_sq
                    && distance_sq < ranges.visual_sq
                    && distance_sq > 0.0,
            );
            accumulate(close_dx, close * dx);
            accumulate(close_dy, close * dy);
            accumulate(sum_x, near * other_x);
            accumulate(sum_y, near * other_y);
            accumulate(sum_vx, near * other_vx);
            accumulate(sum_vy, near * other_vy);
            accumulate(count, near);
        }
    }

    /// One block with each lane's terms times its `mask` (1.0 counted).
    #[expect(
        clippy::too_many_arguments,
        reason = "a block's four arrays, as `add`, and its mask"
    )]
    fn add_masked(
        &mut self,
        ranges: Ranges,
        me: Boid,
        x: &[f32; L],
        y: &[f32; L],
        vx: &[f32; L],
        vy: &[f32; L],
        mask: &[f32; L],
    ) {
        let sums = self
            .sum_x
            .iter_mut()
            .zip(&mut self.sum_y)
            .zip(&mut self.sum_vx)
            .zip(&mut self.sum_vy)
            .zip(&mut self.count)
            .zip(&mut self.close_dx)
            .zip(&mut self.close_dy);
        let others = x.iter().zip(y).zip(vx).zip(vy);
        for (
            (
                ((((((sum_x, sum_y), sum_vx), sum_vy), count), close_dx), close_dy),
                (((&other_x, &other_y), &other_vx), &other_vy),
            ),
            &lane_mask,
        ) in sums.zip(others).zip(mask)
        {
            let (dx, dy) = (me.x - other_x, me.y - other_y);
            let distance_sq = dx * dx + dy * dy;
            let close = lane_mask * unit(distance_sq < ranges.protected_sq);
            let near = lane_mask
                * unit(
                    distance_sq >= ranges.protected_sq
                        && distance_sq < ranges.visual_sq
                        && distance_sq > 0.0,
                );
            accumulate(close_dx, close * dx);
            accumulate(close_dy, close * dy);
            accumulate(sum_x, near * other_x);
            accumulate(sum_y, near * other_y);
            accumulate(sum_vx, near * other_vx);
            accumulate(sum_vy, near * other_vy);
            accumulate(count, near);
        }
    }

    fn add_into(self, seen: &mut Seen) {
        let total = |lanes: [f32; L]| lanes.iter().sum::<f32>();
        seen.sum_x += total(self.sum_x);
        seen.sum_y += total(self.sum_y);
        seen.sum_vx += total(self.sum_vx);
        seen.sum_vy += total(self.sum_vy);
        seen.count += total(self.count);
        seen.close_dx += total(self.close_dx);
        seen.close_dy += total(self.close_dy);
    }
}
