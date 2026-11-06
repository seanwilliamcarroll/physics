//! The quadtree: Morton keys, the root square, and the postorder build
//! (`docs/barnes-hut.md`).

use crate::{Scalar, Vec2};

/// Quadtree levels resolved by the Morton key: two bits per level in a
/// `u64`. Bodies still sharing a cell at this depth (closer than
/// `side / 2³²`, or coincident) form one bucket, summed directly: exact,
/// so the limit costs time in pathological cases, never accuracy. Also
/// bounds the build's recursion depth.
pub(super) const MAX_DEPTH: u32 = u64::BITS / 2;

/// A dynamic body, as the tree build sees it.
#[derive(Copy, Clone, Debug)]
pub(super) struct Body<S> {
    pub(super) pos: Vec2<S>,
    pub(super) mass: S,
    pub(super) key: u64,
    /// Index into `Particles`, to recognize the target itself.
    pub(super) index: usize,
}

/// A tree node: a single body or a cell, with the monopole (total mass,
/// center of mass) the walk needs.
///
/// Nodes are stored in postorder (children before parents), and `size`
/// counts the node and all its descendants, so a node's subtree is the
/// `size` entries ending at it.
#[derive(Copy, Clone, Debug)]
pub(super) struct Node<S> {
    pub(super) com: Vec2<S>,
    pub(super) mass: S,
    pub(super) size: usize,
    pub(super) kind: NodeKind<S>,
}

#[derive(Copy, Clone, Debug)]
pub(super) enum NodeKind<S> {
    /// A leaf: one particle, at `com` exactly.
    Body { index: usize },
    /// A cell of side `width` whose bodies have Morton keys in
    /// `keys.0..=keys.1` (a contiguous range: the containment test), and
    /// whose center of mass is `offset` from its geometric center (δ, for
    /// the opening test: a lopsided cell must be farther away to be used
    /// whole).
    Cell {
        width: S,
        keys: (u64, u64),
        offset: S,
    },
}

/// The root square: its center and half its side.
#[derive(Copy, Clone, Debug)]
pub(super) struct Root<S> {
    pub(super) center: Vec2<S>,
    pub(super) half_side: S,
    /// ½, as `1 / (1 + 1)`: exact, and no `from_f64` (setup only) in the
    /// force path, as in `integrate.rs`.
    pub(super) half: S,
}

impl<S: Scalar> Root<S> {
    /// The smallest square containing every point, or `None` if empty.
    pub(super) fn around(points: impl Iterator<Item = Vec2<S>>, half: S) -> Option<Self> {
        let (lo, hi) = points.fold(None, |bounds: Option<(Vec2<S>, Vec2<S>)>, x| {
            Some(match bounds {
                None => (x, x),
                Some((lo, hi)) => (
                    Vec2::new(min(lo.x, x.x), min(lo.y, x.y)),
                    Vec2::new(max(hi.x, x.x), max(hi.y, x.y)),
                ),
            })
        })?;
        let half_side = max(hi.x - lo.x, hi.y - lo.y) * half;
        Some(Self {
            center: lo + Vec2::new(half_side, half_side),
            half_side,
            half,
        })
    }

    /// Z-order (Morton) key: the quadrant at each of [`MAX_DEPTH`]
    /// levels, two bits per level, most significant first (bit 1 =
    /// north, bit 0 = east). Built from comparisons against cell centers,
    /// computed by the same operations for every body, so it is exact and
    /// identical on every platform; no float-to-integer casts.
    pub(super) fn key(&self, x: Vec2<S>) -> u64 {
        let (mut c, mut h) = (self.center, self.half_side);
        let mut key = 0;
        for _ in 0..MAX_DEPTH {
            h = h * self.half;
            let (east, north) = (x.x >= c.x, x.y >= c.y);
            key = (key << 2) | (u64::from(north) << 1) | u64::from(east);
            c += Vec2::new(if east { h } else { -h }, if north { h } else { -h });
        }
        key
    }
}

fn min<S: Scalar>(a: S, b: S) -> S {
    if b < a { b } else { a }
}

fn max<S: Scalar>(a: S, b: S) -> S {
    if b > a { b } else { a }
}

/// The two key bits choosing the child below level `level`.
const fn quadrant(key: u64, level: u32) -> u64 {
    (key >> (2 * (MAX_DEPTH - 1 - level))) & 0b11
}

/// The center of `center`'s child in quadrant `q` (its two key bits) for a
/// cell of side `width`: a quarter of the side toward it, as
/// [`Root::key`] steps.
fn child_center<S: Scalar>(center: Vec2<S>, width: S, half: S, q: u64) -> Vec2<S> {
    let quarter = width * half * half;
    let (east, north) = (q & 0b01 != 0, q & 0b10 != 0);
    center
        + Vec2::new(
            if east { quarter } else { -quarter },
            if north { quarter } else { -quarter },
        )
}

/// Builds the subtree for `bodies` (sorted by key, all inside the cell at
/// `level` of side `width` centered at `center`) into `nodes`, in
/// postorder. Returns its total mass and `Σ m x`, for the parent's
/// aggregate.
pub(super) fn build<S: Scalar>(
    bodies: &[Body<S>],
    mut level: u32,
    mut width: S,
    mut center: Vec2<S>,
    half: S,
    nodes: &mut Vec<Node<S>>,
) -> (S, Vec2<S>) {
    let (Some(first), Some(last)) = (bodies.first(), bodies.last()) else {
        return (S::ZERO, Vec2::ZERO);
    };
    if bodies.len() == 1 {
        nodes.push(Node {
            com: first.pos,
            mass: first.mass,
            size: 1,
            kind: NodeKind::Body { index: first.index },
        });
        return (first.mass, first.pos * first.mass);
    }
    // Path compression: while every body falls in the same child, descend
    // without storing a node. Sorted keys share a prefix iff the first and
    // last do.
    while level < MAX_DEPTH && quadrant(first.key, level) == quadrant(last.key, level) {
        center = child_center(center, width, half, quadrant(first.key, level));
        level += 1;
        width = width * half;
    }
    let start = nodes.len();
    let (mut mass, mut moment) = (S::ZERO, Vec2::ZERO);
    if level == MAX_DEPTH {
        // Identical keys: a bucket, every body its own leaf.
        for b in bodies {
            let (m, mx) = build(core::slice::from_ref(b), level, width, center, half, nodes);
            mass += m;
            moment += mx;
        }
    } else {
        // Sorted by key, each quadrant is one consecutive run.
        for group in bodies.chunk_by(|a, b| quadrant(a.key, level) == quadrant(b.key, level)) {
            let q = group.first().map_or(0, |b| quadrant(b.key, level));
            let child = child_center(center, width, half, q);
            let (m, mx) = build(group, level + 1, width * half, child, half, nodes);
            mass += m;
            moment += mx;
        }
    }
    // Dynamic masses are positive, so `mass > 0` here.
    let com = moment / mass;
    nodes.push(Node {
        com,
        mass,
        size: nodes.len() - start + 1,
        kind: NodeKind::Cell {
            width,
            keys: (first.key, last.key),
            offset: (com - center).length(),
        },
    });
    (mass, moment)
}
