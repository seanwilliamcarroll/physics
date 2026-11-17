//! The lane loop: candidates without branches, each one's terms times 0 or
//! 1, into `LANES` independent partial sums per quantity, so the loop runs
//! as vector instructions (float addition isn't associative, so the
//! compiler won't split one running sum into lanes by itself). Lane `i`
//! adds candidates `i`, `i + LANES`, `i + 2·LANES`, … in that order, and
//! the lanes are added in order at the end: that order is the results'
//! bits. (A loop one pass per register's worth of lanes, the same bits
//! without spills, was tried and dropped: `experiments/swarm-lanes/`.)

use super::knobs::{LANES, SUM, Sum};
use super::{Ranges, Seen};
use crate::Boid;

/// Every whole block of `LANES` candidates, into `seen`; the leftovers
/// (fewer than `LANES`) are the caller's.
pub(super) fn add_blocks(
    seen: &mut Seen,
    r: Ranges,
    me: Boid,
    x: &[[f32; LANES]],
    y: &[[f32; LANES]],
    vx: &[[f32; LANES]],
    vy: &[[f32; LANES]],
) {
    let mut lanes = Lanes::new();
    for (((a, b), c), d) in x.iter().zip(y).zip(vx).zip(vy) {
        lanes.add(r, me, a, b, c, d);
    }
    lanes.into(seen);
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
fn unit(cond: bool) -> f32 {
    if cond { 1.0 } else { 0.0 }
}

/// 1.0 if `cond`, else 0.0 (see the `aarch64` version).
#[cfg(not(target_arch = "aarch64"))]
fn unit(cond: bool) -> f32 {
    f32::from(u8::from(cond))
}

/// `LANES` lanes' partial sums of each quantity.
struct Lanes {
    sum_x: [f32; LANES],
    sum_y: [f32; LANES],
    sum_vx: [f32; LANES],
    sum_vy: [f32; LANES],
    count: [f32; LANES],
    close_dx: [f32; LANES],
    close_dy: [f32; LANES],
}

impl Lanes {
    const fn new() -> Self {
        Self {
            sum_x: [0.0; LANES],
            sum_y: [0.0; LANES],
            sum_vx: [0.0; LANES],
            sum_vy: [0.0; LANES],
            count: [0.0; LANES],
            close_dx: [0.0; LANES],
            close_dy: [0.0; LANES],
        }
    }

    /// One block of `LANES` candidates, candidate `i` into lane `i`.
    fn add(
        &mut self,
        r: Ranges,
        me: Boid,
        x: &[f32; LANES],
        y: &[f32; LANES],
        vx: &[f32; LANES],
        vy: &[f32; LANES],
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

    /// Adds the lanes, in order, into `seen`.
    fn into(self, seen: &mut Seen) {
        let total = |a: [f32; LANES]| a.iter().sum::<f32>();
        seen.sum_x += total(self.sum_x);
        seen.sum_y += total(self.sum_y);
        seen.sum_vx += total(self.sum_vx);
        seen.sum_vy += total(self.sum_vy);
        seen.count += total(self.count);
        seen.close_dx += total(self.close_dx);
        seen.close_dy += total(self.close_dy);
    }
}
