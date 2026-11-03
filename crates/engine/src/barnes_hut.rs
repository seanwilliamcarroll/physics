//! [`BarnesHut`]: softened gravity approximated with a quadtree, O(n log n).
//!
//! Design, accuracy, and what it gives up (momentum): `docs/barnes-hut.md`.
//! Reference: Barnes & Hut (1986), <https://doi.org/10.1038/324446a0>.

use crate::{Force, Particles, Scalar, Softening, Vec2};

/// Quadtree levels resolved by the Morton key: two bits per level in a
/// `u64`. Bodies still sharing a cell at this depth (closer than
/// `side / 2³²`, or coincident) form one bucket, summed directly: exact,
/// so the limit costs time in pathological cases, never accuracy. Also
/// bounds the build's recursion depth.
const MAX_DEPTH: u32 = u64::BITS / 2;

/// Same physics as [`PairwiseGravity`](crate::PairwiseGravity) (softened
/// Newtonian gravity between dynamic particles), but a group of bodies far
/// enough away is felt as one point mass at its center of mass.
///
/// "Far enough": a quadtree cell of side `s` at distance `d` is used whole
/// when `s / d < θ`. θ = 0 never uses a cell, which is direct summation;
/// larger θ is faster and less accurate. Forces are no longer equal and
/// opposite, so momentum is only conserved up to the force error.
///
/// Static particles (`inv_mass = 0`) neither pull nor are pulled.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct BarnesHut<S> {
    g_const: S,
    /// ε², as in `PairwiseGravity`: nonnegative ε is guaranteed by
    /// [`Softening`], checked where it was built.
    softening_sq: S,
    /// θ², so the opening test `s² < θ² d²` needs no sqrt.
    theta_sq: S,
}

impl<S: Scalar> BarnesHut<S> {
    /// `g_const` and `softening` as for `PairwiseGravity::new`. `theta`:
    /// the opening angle, `None` unless θ ≥ 0 (a NaN is rejected too).
    /// 0 is exact direct summation; Barnes & Hut used about 1.
    #[must_use]
    pub fn new(g_const: S, softening: Softening<S>, theta: S) -> Option<Self> {
        (theta >= S::ZERO).then(|| Self {
            g_const,
            softening_sq: softening.squared(),
            theta_sq: theta * theta,
        })
    }

    #[must_use]
    pub const fn g_const(&self) -> S {
        self.g_const
    }

    #[must_use]
    pub const fn softening_sq(&self) -> S {
        self.softening_sq
    }

    #[must_use]
    pub const fn theta_sq(&self) -> S {
        self.theta_sq
    }

    /// Softened pull toward a point mass `mass` at offset `r` (unsoftened
    /// `|r|² = dist_sq`): `G m r / (|r|² + ε²)^(3/2)`. Zero, not 0/0, for
    /// a coincident unsoftened pair (no direction).
    fn pull(&self, r: Vec2<S>, dist_sq: S, mass: S) -> Vec2<S> {
        let d_sq = dist_sq + self.softening_sq;
        if d_sq == S::ZERO {
            return Vec2::ZERO;
        }
        r * (self.g_const * mass / (d_sq * d_sq.sqrt()))
    }

    /// Acceleration of a body at `x` (Morton key `key`, particle `index`)
    /// from the tree in `nodes` (postorder: see [`Node`]).
    fn accel_on(&self, nodes: &[Node<S>], x: Vec2<S>, key: u64, index: usize) -> Vec2<S> {
        let mut a = Vec2::ZERO;
        // One past the next node to visit; the root is last. Reading the
        // postorder array backwards is a preorder walk: "open" moves one
        // node down, "accept" skips the node's whole subtree. Running off
        // the front ends the walk.
        let mut cursor = nodes.len();
        while let Some(node) = cursor.checked_sub(1).and_then(|i| nodes.get(i)) {
            let r = node.com - x;
            let dist_sq = r.length_sq();
            let open = match node.kind {
                NodeKind::Body { index: j } => {
                    if j != index {
                        a += self.pull(r, dist_sq, node.mass);
                    }
                    false
                }
                NodeKind::Cell {
                    width_sq,
                    keys: (lo, hi),
                } => {
                    // Never accept a cell containing the target: that
                    // would include its own mass (a self-force).
                    let contains = lo <= key && key <= hi;
                    let far = width_sq < self.theta_sq * dist_sq;
                    if !contains && far {
                        a += self.pull(r, dist_sq, node.mass);
                    }
                    contains || !far
                }
            };
            cursor = if open {
                cursor - 1
            } else {
                // size ≥ 1 and ≤ cursor by construction; saturating keeps
                // the walk total (it just ends) even if that were violated.
                cursor.saturating_sub(node.size)
            };
        }
        a
    }
}

/// A dynamic body, as the tree build sees it.
#[derive(Copy, Clone, Debug)]
struct Body<S> {
    pos: Vec2<S>,
    mass: S,
    key: u64,
    /// Index into `Particles`, to recognize the target itself.
    index: usize,
}

/// A tree node: a single body or a cell, with the monopole (total mass,
/// center of mass) the walk needs.
///
/// Nodes are stored in postorder (children before parents), and `size`
/// counts the node and all its descendants, so a node's subtree is the
/// `size` entries ending at it.
#[derive(Copy, Clone, Debug)]
struct Node<S> {
    com: Vec2<S>,
    mass: S,
    size: usize,
    kind: NodeKind<S>,
}

#[derive(Copy, Clone, Debug)]
enum NodeKind<S> {
    /// A leaf: one particle, at `com` exactly.
    Body { index: usize },
    /// A cell of side `√width_sq` whose bodies have Morton keys in
    /// `keys.0..=keys.1` (a contiguous range: the containment test).
    Cell { width_sq: S, keys: (u64, u64) },
}

/// The root square: its center and half its side.
#[derive(Copy, Clone, Debug)]
struct Root<S> {
    center: Vec2<S>,
    half_side: S,
    /// ½, converted once (`from_f64` is for setup, not loops).
    half: S,
}

impl<S: Scalar> Root<S> {
    /// The smallest square containing every point, or `None` if empty.
    fn around(points: impl Iterator<Item = Vec2<S>>, half: S) -> Option<Self> {
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
    fn key(&self, x: Vec2<S>) -> u64 {
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

/// Builds the subtree for `bodies` (sorted by key, all inside the cell at
/// `level` of side `width`) into `nodes`, in postorder. Returns its total
/// mass and `Σ m x`, for the parent's aggregate.
fn build<S: Scalar>(
    bodies: &[Body<S>],
    mut level: u32,
    mut width: S,
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
        level += 1;
        width = width * half;
    }
    let start = nodes.len();
    let (mut mass, mut moment) = (S::ZERO, Vec2::ZERO);
    if level == MAX_DEPTH {
        // Identical keys: a bucket, every body its own leaf.
        for b in bodies {
            let (m, mx) = build(core::slice::from_ref(b), level, width, half, nodes);
            mass += m;
            moment += mx;
        }
    } else {
        // Sorted by key, each quadrant is one consecutive run.
        for group in bodies.chunk_by(|a, b| quadrant(a.key, level) == quadrant(b.key, level)) {
            let (m, mx) = build(group, level + 1, width * half, half, nodes);
            mass += m;
            moment += mx;
        }
    }
    nodes.push(Node {
        // Dynamic masses are positive, so `mass > 0` here.
        com: moment / mass,
        mass,
        size: nodes.len() - start + 1,
        kind: NodeKind::Cell {
            width_sq: width * width,
            keys: (first.key, last.key),
        },
    });
    (mass, moment)
}

impl<S: Scalar> Force<S> for BarnesHut<S> {
    fn accumulate(&self, p: &Particles<S>, acc: &mut [Vec2<S>]) {
        let dynamic = || {
            p.pos()
                .iter()
                .zip(p.inv_mass())
                .enumerate()
                .filter(|&(_, (_, &w))| w != S::ZERO)
        };
        let Some(root) = Root::around(dynamic().map(|(_, (&x, _))| x), S::from_f64(0.5)) else {
            return; // no dynamic bodies: nothing pulls, nothing is pulled
        };

        let mut bodies: Vec<Body<S>> = dynamic()
            .map(|(index, (&pos, &w))| Body {
                pos,
                mass: S::ONE / w,
                key: root.key(pos),
                index,
            })
            .collect();
        // (key, index) is unique, so the order is fully determined by the
        // input whatever the sort algorithm: unstable is safe, and
        // doesn't allocate.
        bodies.sort_unstable_by_key(|b| (b.key, b.index));

        // A cell with ≥ 2 children per stored node (path compression) and
        // one leaf per body: at most 2n − 1 nodes, so this never regrows.
        let mut nodes = Vec::with_capacity(2 * bodies.len());
        let side = root.half_side + root.half_side;
        let _ = build(&bodies, 0, side, root.half, &mut nodes);

        for (index, (a, (&x, &w))) in acc
            .iter_mut()
            .zip(p.pos().iter().zip(p.inv_mass()))
            .enumerate()
        {
            if w != S::ZERO {
                *a += self.accel_on(&nodes, x, root.key(x), index);
            }
        }
    }
}

#[cfg(test)]
mod tests;
