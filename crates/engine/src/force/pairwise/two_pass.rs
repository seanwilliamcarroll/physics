//! The two-pass loop (`PairLoop::TwoPass`): for each body i, pass 1
//! computes every later pair's force (body j's share applied, the force
//! kept in scratch arrays) with nothing summed across pairs, so the
//! compiler vectorizes it at whatever width the target has; pass 2 sums
//! the kept forces into `LANES` lanes.

use super::{Bodies, LANES, PairwiseGravity, lane_total};
use crate::{Scalar, Vec2};

pub(super) fn accumulate<S: Scalar>(g: &PairwiseGravity<S>, b: &Bodies<S>, acc: &mut [Vec2<S>]) {
    let n = b.x.len();
    // Each pair's force on body i, x and y, for pass 2.
    let (mut fx, mut fy) = (vec![S::ZERO; n], vec![S::ZERO; n]);

    let mut acc_rest = acc;
    let (mut x_rest, mut y_rest, mut m_rest, mut w_rest) = (
        b.x.as_slice(),
        b.y.as_slice(),
        b.m.as_slice(),
        b.w.as_slice(),
    );
    while let (
        Some((a_i, acc_tail)),
        Some((&px_i, x_tail)),
        Some((&py_i, y_tail)),
        Some((&m_i, m_tail)),
        Some((&w_i, w_tail)),
    ) = (
        core::mem::take(&mut acc_rest).split_first_mut(),
        x_rest.split_first(),
        y_rest.split_first(),
        m_rest.split_first(),
        w_rest.split_first(),
    ) {
        pass_one(
            (px_i, py_i, g.g_const * m_i, g.softening_sq),
            (x_tail, y_tail, m_tail, w_tail),
            acc_tail,
            (&mut fx, &mut fy),
        );
        let len = acc_tail.len();
        let (sum_x, sum_y) = (
            lane_sum(fx.get(..len).unwrap_or_default()),
            lane_sum(fy.get(..len).unwrap_or_default()),
        );
        *a_i += Vec2::new(sum_x, sum_y) * w_i;
        acc_rest = acc_tail;
        (x_rest, y_rest, m_rest, w_rest) = (x_tail, y_tail, m_tail, w_tail);
    }
}

/// Body i against every later body j: the force, body j's share (`acc`),
/// and the force kept for body i's sum (`fx`, `fy`). A function of its own
/// so its slices are parameters: Rust tells the compiler that `&mut`
/// parameters don't overlap, so the vectorized loop needs no runtime
/// overlap checks (with local slices, it took a scalar path, 2× slower).
#[inline(never)]
fn pass_one<S: Scalar>(
    (px_i, py_i, g_mi, eps_sq): (S, S, S, S),
    (xs, ys, ms, ws): (&[S], &[S], &[S], &[S]),
    acc: &mut [Vec2<S>],
    (fx, fy): (&mut [S], &mut [S]),
) {
    let others = xs.iter().zip(ys).zip(ms).zip(ws);
    let kept = fx.iter_mut().zip(fy.iter_mut());
    for ((a_j, (((&px_j, &py_j), &m_j), &w_j)), (fx_j, fy_j)) in
        acc.iter_mut().zip(others).zip(kept)
    {
        let (rx, ry) = (px_j - px_i, py_j - py_i);
        let d_sq = rx * rx + ry * ry + eps_sq;
        let s = g_mi * m_j / (d_sq * d_sq.sqrt());
        // Coincident and unsoftened: 0/0, selected away (no branch).
        let s = if d_sq == S::ZERO { S::ZERO } else { s };
        let (f_x, f_y) = (rx * s, ry * s);
        a_j.x -= f_x * w_j;
        a_j.y -= f_y * w_j;
        (*fx_j, *fy_j) = (f_x, f_y);
    }
}

/// `values` summed in `LANES` partial sums (value k in lane k mod LANES),
/// then the lanes as a tree ([`lane_total`]).
fn lane_sum<S: Scalar>(values: &[S]) -> S {
    let mut lanes = [S::ZERO; LANES];
    let (chunks, rest) = values.as_chunks::<LANES>();
    for chunk in chunks {
        for (lane, &v) in lanes.iter_mut().zip(chunk) {
            *lane += v;
        }
    }
    for (lane, &v) in lanes.iter_mut().zip(rest) {
        *lane += v;
    }
    lane_total(&lanes)
}
