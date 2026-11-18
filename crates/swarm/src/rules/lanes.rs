//! The lane loop: candidates without branches, each one's terms times 0 or
//! 1, into `L` independent partial sums per quantity, so the loop runs
//! as vector instructions (float addition isn't associative, so the
//! compiler won't split one running sum into lanes by itself). Lane `i`
//! adds candidates `i`, `i + L`, `i + 2·L`, … in that order, and
//! the lanes are added in order at the end: that order is the results'
//! bits. (A loop one pass per register's worth of lanes, the same bits
//! without spills, was tried and dropped: `experiments/swarm-lanes/`.)

use super::knobs::{SUM, Sum, Tail};
use super::{Ranges, Seen};
use crate::Boid;

/// Every whole block of `L` candidates, into `seen`; the leftovers
/// (fewer than `L`) are the caller's.
pub(super) fn add_blocks<const L: usize>(
    seen: &mut Seen,
    r: Ranges,
    me: Boid,
    x: &[[f32; L]],
    y: &[[f32; L]],
    vx: &[[f32; L]],
    vy: &[[f32; L]],
) {
    let mut lanes = Lanes::new();
    for (((a, b), c), d) in x.iter().zip(y).zip(vx).zip(vy) {
        lanes.add(r, me, a, b, c, d);
    }
    lanes.into(seen);
}

/// Sorted's spans of the flock's arrays (`[x, y, vx, vy]`, cell order)
/// into `seen`: each span's whole blocks through the lane loop, its
/// leftovers one at a time (`Seen::add`) or as one more block with the
/// lanes outside them masked out, the mask from compares or a table
/// (`SWARM_TAIL`); each span's lanes added
/// into `seen` at its end, or one set for all the spans, added once
/// (`SWARM_SPAN`). The settings are arguments for the tests; the build
/// passes constants (`Seen::add_spans`).
pub(super) fn add_spans<const L: usize>(
    seen: &mut Seen,
    r: Ranges,
    me: Boid,
    [x, y, vx, vy]: [&[f32]; 4],
    spans: impl Iterator<Item = core::ops::Range<usize>>,
    (per_boid, leftovers): (bool, Tail),
) {
    let mut lanes = Lanes::<L>::new();
    for span in spans {
        let ((cx, rx), (cy, ry), (cvx, rvx), (cvy, rvy)) = (
            part(x, &span).as_chunks::<L>(),
            part(y, &span).as_chunks::<L>(),
            part(vx, &span).as_chunks::<L>(),
            part(vy, &span).as_chunks::<L>(),
        );
        for (((a, b), c), d) in cx.iter().zip(cy).zip(cvx).zip(cvy) {
            lanes.add(r, me, a, b, c, d);
        }
        let rem = rx.len();
        // The block of `L` ending at the span's end (or the arrays' first
        // `L`): its last `rem` within the span are the leftovers.
        let tail = span.end.saturating_sub(L)..span.end.saturating_sub(L) + L;
        let masked = (leftovers != Tail::Scalar && rem > 0)
            .then(|| {
                Some((
                    block(x, &tail)?,
                    block(y, &tail)?,
                    block(vx, &tail)?,
                    block(vy, &tail)?,
                ))
            })
            .flatten();
        if let Some((a, b, c, d)) = masked {
            // The leftovers are the block's lanes `first..end`: its last
            // `rem`, unless the block is the arrays' first `L` (`end < L`).
            let end = span.end - tail.start;
            let first = end - rem;
            let compared;
            let mask = match window::<L>(rem) {
                Some(w) if leftovers == Tail::Table && end == L => w,
                _ => {
                    compared = core::array::from_fn(|k| unit((first..end).contains(&k)));
                    &compared
                }
            };
            lanes.add_masked(r, me, a, b, c, d, mask);
        }
        // Per span, the lanes go in before the leftovers: as `add_span`.
        if !per_boid {
            core::mem::replace(&mut lanes, Lanes::new()).into(seen);
        }
        if masked.is_none() {
            for (((&x, &y), &vx), &vy) in rx.iter().zip(ry).zip(rvx).zip(rvy) {
                seen.add(r, me, Boid { x, y, vx, vy });
            }
        }
    }
    if per_boid {
        lanes.into(seen);
    }
}

/// The most lanes there can be (`SWARM_LANES`, `knobs.rs`).
const MAX_LANES: usize = 64;

/// Zeros then ones, [`MAX_LANES`] of each: a window of `L` on it is a
/// block's mask for its last few lanes (`window`).
static STEPS: [f32; 2 * MAX_LANES] = steps();

const fn steps() -> [f32; 2 * MAX_LANES] {
    let mut a = [0.0; 2 * MAX_LANES];
    let mut i = MAX_LANES;
    while i < 2 * MAX_LANES {
        #[expect(
            clippy::indexing_slicing,
            reason = "const evaluation, in bounds by the loop; a slip fails the build"
        )]
        {
            a[i] = 1.0;
        }
        i += 1;
    }
    a
}

/// A block's mask counting only its last `rem` lanes: 1.0 in each, 0.0
/// in the others, from [`STEPS`] (one load, no compares).
fn window<const L: usize>(rem: usize) -> Option<&'static [f32; L]> {
    let start = (MAX_LANES + rem).checked_sub(L)?;
    STEPS
        .get(start..start + L)
        .and_then(|w| <&[f32; L]>::try_from(w).ok())
}

/// `a`'s elements `r`, empty if out of range.
fn part<'a>(a: &'a [f32], r: &core::ops::Range<usize>) -> &'a [f32] {
    a.get(r.clone()).unwrap_or_default()
}

/// `a`'s elements `r` as one block of `L`, if they're in range and `L`.
fn block<'a, const L: usize>(a: &'a [f32], r: &core::ops::Range<usize>) -> Option<&'a [f32; L]> {
    a.get(r.clone()).and_then(|s| <&[f32; L]>::try_from(s).ok())
}

/// `a += x`, in the lane loop: as written, or reassociable when the build
/// says so (`SWARM_SUM`, `knobs.rs`).
fn accumulate(a: &mut f32, x: f32) {
    *a = match SUM {
        Sum::Ordered => *a + x,
        Sum::Algebraic => a.algebraic_add(x),
    };
}

/// 1.0 if `cond`, else 0.0: the lane loop's masks. The same values, so the
/// same bits, everywhere; written per architecture for the code each gets
/// (`docs/15-swarm.md`, "The lane loop's masks"). On `aarch64` as a select:
/// through an integer it compiled to five instructions a mask (compare,
/// narrow, mask, widen, convert), the select to a compare and an AND with
/// 1.0's bits (Brute 14–16% faster on an M4). Elsewhere through an integer:
/// x86 compiles that well already, and the select made its loop longer
/// (Brute 2.6% slower on Zen 5); wasm gets the same code either way.
#[cfg(target_arch = "aarch64")]
pub(super) fn unit(cond: bool) -> f32 {
    if cond { 1.0 } else { 0.0 }
}

/// 1.0 if `cond`, else 0.0 (see the `aarch64` version).
#[cfg(not(target_arch = "aarch64"))]
pub(super) fn unit(cond: bool) -> f32 {
    f32::from(u8::from(cond))
}

/// `L` lanes' partial sums of each quantity.
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

    /// One block of `L` candidates, candidate `i` into lane `i`.
    fn add(
        &mut self,
        r: Ranges,
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
        for (((((((sx, sy), svx), svy), n), cdx), cdy), (((&ox, &oy), &ovx), &ovy)) in
            sums.zip(others)
        {
            let (dx, dy) = (me.x - ox, me.y - oy);
            let d_sq = dx * dx + dy * dy;
            let close = unit(d_sq < r.protected_sq);
            let near = unit(d_sq >= r.protected_sq && d_sq < r.visual_sq && d_sq > 0.0);
            accumulate(cdx, close * dx);
            accumulate(cdy, close * dy);
            accumulate(sx, near * ox);
            accumulate(sy, near * oy);
            accumulate(svx, near * ovx);
            accumulate(svy, near * ovy);
            accumulate(n, near);
        }
    }

    /// One block of `L` with each lane's terms times its `mask` (1.0
    /// counted, 0.0 not).
    #[expect(
        clippy::too_many_arguments,
        reason = "a block's four arrays, as `add`, and its mask"
    )]
    fn add_masked(
        &mut self,
        r: Ranges,
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
        for ((((((((sx, sy), svx), svy), n), cdx), cdy), (((&ox, &oy), &ovx), &ovy)), &m) in
            sums.zip(others).zip(mask)
        {
            let (dx, dy) = (me.x - ox, me.y - oy);
            let d_sq = dx * dx + dy * dy;
            let close = m * unit(d_sq < r.protected_sq);
            let near = m * unit(d_sq >= r.protected_sq && d_sq < r.visual_sq && d_sq > 0.0);
            accumulate(cdx, close * dx);
            accumulate(cdy, close * dy);
            accumulate(sx, near * ox);
            accumulate(sy, near * oy);
            accumulate(svx, near * ovx);
            accumulate(svy, near * ovy);
            accumulate(n, near);
        }
    }

    /// Adds the lanes, in order, into `seen`.
    fn into(self, seen: &mut Seen) {
        let total = |a: [f32; L]| a.iter().sum::<f32>();
        seen.sum_x += total(self.sum_x);
        seen.sum_y += total(self.sum_y);
        seen.sum_vx += total(self.sum_vx);
        seen.sum_vy += total(self.sum_vy);
        seen.count += total(self.count);
        seen.close_dx += total(self.close_dx);
        seen.close_dy += total(self.close_dy);
    }
}
