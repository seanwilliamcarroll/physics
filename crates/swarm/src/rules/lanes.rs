//! The lane loop: candidates without branches, each one's terms times 0 or
//! 1, into `LANES` independent partial sums per quantity, so the loop runs
//! as vector instructions (float addition isn't associative, so the
//! compiler won't split one running sum into lanes by itself). Lane `i`
//! adds candidates `i`, `i + LANES`, `i + 2·LANES`, … in that order, and
//! the lanes are added in order at the end: that order is the results'
//! bits, whatever the loop's shape (`SWARM_LOOP`, `knobs.rs`).

use super::knobs::{GROUP, LANES, Loop, SUM, Sum};
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
    let lanes = match super::knobs::LOOP {
        Loop::Lanes => {
            let mut lanes = Lanes::<LANES>::new();
            for (((a, b), c), d) in x.iter().zip(y).zip(vx).zip(vy) {
                lanes.add(r, me, a, b, c, d);
            }
            lanes
        }
        Loop::Grouped => grouped(r, me, x, y, vx, vy),
    };
    lanes.into(seen);
}

/// The same sums, one pass per `GROUP` lanes: pass `g` adds lanes
/// `g·GROUP..(g+1)·GROUP` of every block, so only `GROUP` lanes' sums are
/// live at once (a register's worth each, by default). Each lane adds the
/// same candidates in the same order as in one pass: the same bits.
fn grouped(
    r: Ranges,
    me: Boid,
    x: &[[f32; LANES]],
    y: &[[f32; LANES]],
    vx: &[[f32; LANES]],
    vy: &[[f32; LANES]],
) -> Lanes<LANES> {
    let mut all = Lanes::<LANES>::new();
    let part = |row: &[f32; LANES], g: usize| row.as_chunks::<GROUP>().0.get(g).copied();
    for g in 0..LANES / GROUP {
        let mut pass = Lanes::<GROUP>::new();
        for (((a, b), c), d) in x.iter().zip(y).zip(vx).zip(vy) {
            // `g` is below the chunk count, a constant: always `Some`.
            if let (Some(a), Some(b), Some(c), Some(d)) =
                (part(a, g), part(b, g), part(c, g), part(d, g))
            {
                pass.add(r, me, &a, &b, &c, &d);
            }
        }
        all.set(g, &pass);
    }
    all
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

/// `N` lanes' partial sums of each quantity.
struct Lanes<const N: usize> {
    sum_x: [f32; N],
    sum_y: [f32; N],
    sum_vx: [f32; N],
    sum_vy: [f32; N],
    count: [f32; N],
    close_dx: [f32; N],
    close_dy: [f32; N],
}

impl<const N: usize> Lanes<N> {
    const fn new() -> Self {
        Self {
            sum_x: [0.0; N],
            sum_y: [0.0; N],
            sum_vx: [0.0; N],
            sum_vy: [0.0; N],
            count: [0.0; N],
            close_dx: [0.0; N],
            close_dy: [0.0; N],
        }
    }

    /// One block of `N` candidates, candidate `i` into lane `i`.
    fn add(
        &mut self,
        r: Ranges,
        me: Boid,
        x: &[f32; N],
        y: &[f32; N],
        vx: &[f32; N],
        vy: &[f32; N],
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

    /// Puts a pass's `M` lanes in as lanes `g·M..(g+1)·M`.
    fn set<const M: usize>(&mut self, g: usize, pass: &Lanes<M>) {
        let put = |to: &mut [f32; N], from: &[f32; M]| {
            if let Some(slot) = to.as_chunks_mut::<M>().0.get_mut(g) {
                *slot = *from;
            }
        };
        put(&mut self.sum_x, &pass.sum_x);
        put(&mut self.sum_y, &pass.sum_y);
        put(&mut self.sum_vx, &pass.sum_vx);
        put(&mut self.sum_vy, &pass.sum_vy);
        put(&mut self.count, &pass.count);
        put(&mut self.close_dx, &pass.close_dx);
        put(&mut self.close_dy, &pass.close_dy);
    }

    /// Adds the lanes, in order, into `seen`.
    fn into(self, seen: &mut Seen) {
        let total = |a: [f32; N]| a.iter().sum::<f32>();
        seen.sum_x += total(self.sum_x);
        seen.sum_y += total(self.sum_y);
        seen.sum_vx += total(self.sum_vx);
        seen.sum_vy += total(self.sum_vy);
        seen.count += total(self.count);
        seen.close_dx += total(self.close_dx);
        seen.close_dy += total(self.close_dy);
    }
}
