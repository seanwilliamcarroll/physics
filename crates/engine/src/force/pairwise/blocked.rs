//! The blocked loop (`PairLoop::Blocked`): one pass per body i, in blocks
//! of `L` pairs, body i's lanes updated as it goes. Each step of a
//! block is one operation on `[S; L]`, so the compiler packs a block
//! into vector instructions; no scratch arrays, but at most `L` wide.
//! The same arithmetic in the same order as the two-pass loop.

use super::{Bodies, PairwiseGravity, lane_total};
use crate::{Scalar, Vec2};

pub(super) fn accumulate<S: Scalar, const L: usize>(
    g: &PairwiseGravity<S>,
    b: &Bodies<S>,
    acc: &mut [Vec2<S>],
) {
    // The accelerations as separate arrays too, copied in and out: body j's
    // additions keep their order, so its bits don't change.
    let mut ax: Vec<S> = acc.iter().map(|a| a.x).collect();
    let mut ay: Vec<S> = acc.iter().map(|a| a.y).collect();

    let mut rest = Rest {
        x: &b.x,
        y: &b.y,
        m: &b.m,
        w: &b.w,
        ax: &mut ax,
        ay: &mut ay,
    };
    while let Some((i, later)) = rest.split_first() {
        let (lx, ly) = sweep::<S, L>(
            Body {
                x: i.x,
                y: i.y,
                gm: g.g_const * i.m,
            },
            g.softening_sq,
            (later.x, later.y, later.m, later.w),
            (&mut *later.ax, &mut *later.ay),
        );
        *i.ax += lane_total(&lx) * i.w;
        *i.ay += lane_total(&ly) * i.w;
        rest = later;
    }
    for ((a, &x), &y) in acc.iter_mut().zip(&ax).zip(&ay) {
        *a = Vec2::new(x, y);
    }
}

/// Body i, as the sweep needs it: its position and `G m_i`.
#[derive(Clone, Copy)]
struct Body<S> {
    x: S,
    y: S,
    gm: S,
}

/// What's left of the arrays: body i and the bodies after it.
struct Rest<'a, S> {
    x: &'a [S],
    y: &'a [S],
    m: &'a [S],
    w: &'a [S],
    ax: &'a mut [S],
    ay: &'a mut [S],
}

/// The first body of a [`Rest`]: its values, and its acceleration to add to.
struct First<'a, S> {
    x: S,
    y: S,
    m: S,
    w: S,
    ax: &'a mut S,
    ay: &'a mut S,
}

impl<'a, S: Copy> Rest<'a, S> {
    /// The first body, and the rest after it; `None` when empty.
    fn split_first(self) -> Option<(First<'a, S>, Self)> {
        let ((&x, x_rest), (&y, y_rest)) = (self.x.split_first()?, self.y.split_first()?);
        let ((&m, m_rest), (&w, w_rest)) = (self.m.split_first()?, self.w.split_first()?);
        let ((ax, ax_rest), (ay, ay_rest)) =
            (self.ax.split_first_mut()?, self.ay.split_first_mut()?);
        Some((
            First { x, y, m, w, ax, ay },
            Self {
                x: x_rest,
                y: y_rest,
                m: m_rest,
                w: w_rest,
                ax: ax_rest,
                ay: ay_rest,
            },
        ))
    }
}

/// Lane by lane: `[f(a0, b0), f(a1, b1), ..]`. A fixed-length loop, so
/// the compiler unrolls it.
fn map2<S: Copy, const L: usize>(a: [S; L], b: [S; L], f: impl Fn(S, S) -> S) -> [S; L] {
    let mut out = a;
    for (o, (&x, &y)) in out.iter_mut().zip(a.iter().zip(&b)) {
        *o = f(x, y);
    }
    out
}

/// Body `i` against every later body: each pair's force, subtracted from
/// body j's acceleration (times `w_j`) and added to body i's lanes
/// (returned, to be multiplied by `w_i`). The slices are parameters of a
/// function that isn't inlined, so the compiler knows they don't overlap.
#[inline(never)]
fn sweep<S: Scalar, const L: usize>(
    i: Body<S>,
    eps_sq: S,
    (xs, ys, ms, ws): (&[S], &[S], &[S], &[S]),
    (ax, ay): (&mut [S], &mut [S]),
) -> ([S; L], [S; L]) {
    let (mut lx, mut ly) = ([S::ZERO; L], [S::ZERO; L]);
    let (xb, x_rest) = xs.as_chunks::<L>();
    let (yb, y_rest) = ys.as_chunks::<L>();
    let (mb, m_rest) = ms.as_chunks::<L>();
    let (wb, w_rest) = ws.as_chunks::<L>();
    let (axb, ax_rest) = ax.as_chunks_mut::<L>();
    let (ayb, ay_rest) = ay.as_chunks_mut::<L>();
    let blocks = xb
        .iter()
        .zip(yb)
        .zip(mb)
        .zip(wb)
        .zip(axb.iter_mut().zip(ayb.iter_mut()));
    for ((((xk, yk), mk), wk), (axk, ayk)) in blocks {
        let rx = xk.map(|x| x - i.x);
        let ry = yk.map(|y| y - i.y);
        let d_sq = map2(rx, ry, |rx, ry| rx * rx + ry * ry + eps_sq);
        let s = map2(d_sq, *mk, |d_sq, m| {
            let s = i.gm * m / (d_sq * d_sq.sqrt());
            // Coincident and unsoftened: 0/0, selected away (no branch).
            if d_sq == S::ZERO { S::ZERO } else { s }
        });
        let fx = map2(rx, s, |r, s| r * s);
        let fy = map2(ry, s, |r, s| r * s);
        *axk = map2(*axk, map2(fx, *wk, |f, w| f * w), |a, f| a - f);
        *ayk = map2(*ayk, map2(fy, *wk, |f, w| f * w), |a, f| a - f);
        lx = map2(lx, fx, |l, f| l + f);
        ly = map2(ly, fy, |l, f| l + f);
    }
    // The last few, into the same lanes in the same order.
    let lanes = lx.iter_mut().zip(ly.iter_mut());
    let tail = x_rest
        .iter()
        .zip(y_rest)
        .zip(m_rest)
        .zip(w_rest)
        .zip(ax_rest.iter_mut().zip(ay_rest.iter_mut()));
    for ((lx_k, ly_k), ((((&x, &y), &m), &w), (ax_j, ay_j))) in lanes.zip(tail) {
        let (rx, ry) = (x - i.x, y - i.y);
        let d_sq = rx * rx + ry * ry + eps_sq;
        let s = i.gm * m / (d_sq * d_sq.sqrt());
        let s = if d_sq == S::ZERO { S::ZERO } else { s };
        let (fx, fy) = (rx * s, ry * s);
        *ax_j -= fx * w;
        *ay_j -= fy * w;
        *lx_k += fx;
        *ly_k += fy;
    }
    (lx, ly)
}
