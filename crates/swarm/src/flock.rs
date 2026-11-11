//! [`Flock`]: the boids, double-buffered as structure of arrays, and the
//! step (`docs/15-swarm.md`, "Double buffering").

use math::SplitMix64;
use math::convert::f64_to_f32;

use crate::grid::Grid;
use crate::rules::{Ranges, Seen, finish, steer};
use crate::{Arena, Params};

/// The most boids a flock holds: 2¹⁸ (TASKS S1 decision 10).
pub const MAX_BOIDS: usize = 1 << 18;

/// How a step finds each boid's neighbours (`docs/15-swarm.md`, "Finding
/// neighbours"). The same neighbours either way; the sums over them run
/// in a different order, so trajectories agree only to rounding.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub enum Neighbours {
    /// Every other boid: n(n − 1) checks a step. The reference.
    Brute,
    /// A cell list by counting sort: the 3 × 3 cells around each boid.
    Grid,
    /// The grid, with the boids themselves moved into cell order every
    /// step, so a block's candidates are three contiguous runs of the
    /// arrays, read by a branchless loop in independent lanes (vector
    /// instructions). The default: 10k boids in 1.4 ms natively against
    /// the grid's 7.3. Boids' indices change every step.
    Sorted,
}

/// One boid's state: position (pixels, y down) and velocity (pixels per
/// step).
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Boid {
    pub x: f32,
    pub y: f32,
    pub vx: f32,
    pub vy: f32,
}

/// Every boid's state, one array per component.
#[derive(Clone, Debug, Default)]
struct Boids {
    x: Vec<f32>,
    y: Vec<f32>,
    vx: Vec<f32>,
    vy: Vec<f32>,
}

impl Boids {
    fn get(&self, i: usize) -> Option<Boid> {
        Some(Boid {
            x: *self.x.get(i)?,
            y: *self.y.get(i)?,
            vx: *self.vx.get(i)?,
            vy: *self.vy.get(i)?,
        })
    }

    fn set(&mut self, i: usize, b: Boid) {
        let slots = (
            self.x.get_mut(i),
            self.y.get_mut(i),
            self.vx.get_mut(i),
            self.vy.get_mut(i),
        );
        if let (Some(x), Some(y), Some(vx), Some(vy)) = slots {
            (*x, *y, *vx, *vy) = (b.x, b.y, b.vx, b.vy);
        }
    }

    fn push(&mut self, b: Boid) {
        self.x.push(b.x);
        self.y.push(b.y);
        self.vx.push(b.vx);
        self.vy.push(b.vy);
    }

    fn len(&self) -> usize {
        self.x.len()
    }

    /// `src`'s boids in the order `order` lists them.
    fn gather(&mut self, src: &Self, order: &[u32]) {
        let pick = |v: &[f32], out: &mut Vec<f32>| {
            out.clear();
            out.extend(
                order
                    .iter()
                    .filter_map(|&i| v.get(usize::try_from(i).ok()?).copied()),
            );
        };
        pick(&src.x, &mut self.x);
        pick(&src.y, &mut self.y);
        pick(&src.vx, &mut self.vx);
        pick(&src.vy, &mut self.vy);
    }
}

/// A flock: the boids now (`cur`) and the buffer the next step is written
/// into (`next`), swapped after every step, so every boid sees the same
/// instant whatever order they're stored in.
#[derive(Clone, Debug)]
pub struct Flock {
    cur: Boids,
    next: Boids,
    params: Params,
    arena: Arena,
    steps: u64,
    neighbours: Neighbours,
    grid: Grid,
}

impl Flock {
    /// `n` boids (1 to [`MAX_BOIDS`]) at random inside the margins (the
    /// whole arena if it's narrower than two margins), heading in random
    /// directions at random speeds in the band; `seed` makes it
    /// repeatable. `None` for a bad count or unusable `params`.
    #[must_use]
    pub fn new(n: usize, arena: Arena, params: Params, seed: u64) -> Option<Self> {
        let params = params.checked()?;
        if !(1..=MAX_BOIDS).contains(&n) {
            return None;
        }
        let mut rng = SplitMix64::new(seed);
        let span = |side: f32| {
            let m = f64::from(params.margin);
            let side = f64::from(side);
            if side > 2.0 * m {
                (m, side - m)
            } else {
                (0.0, side)
            }
        };
        let (xs, ys) = (span(arena.width()), span(arena.height()));
        let (lo, hi) = (f64::from(params.min_speed), f64::from(params.max_speed));
        let boids = (0..n).map(|_| {
            let (x, y) = (rng.range(xs.0, xs.1), rng.range(ys.0, ys.1));
            // A direction: a point in the unit disc (rejection, no trig),
            // normalized; the speed uniform in the band.
            let (dx, dy, len) = loop {
                let (dx, dy) = (rng.range(-1.0, 1.0), rng.range(-1.0, 1.0));
                let len = (dx * dx + dy * dy).sqrt();
                if len > 1e-3 && len <= 1.0 {
                    break (dx, dy, len);
                }
            };
            let speed = if hi > lo { rng.range(lo, hi) } else { lo };
            Boid {
                x: f64_to_f32(x),
                y: f64_to_f32(y),
                vx: f64_to_f32(dx / len * speed),
                vy: f64_to_f32(dy / len * speed),
            }
        });
        Self::with_boids(arena, params, boids)
    }

    /// A flock of exactly `boids`; `None` if there are none or more than
    /// [`MAX_BOIDS`], or `params` are unusable.
    #[must_use]
    pub fn with_boids(
        arena: Arena,
        params: Params,
        boids: impl IntoIterator<Item = Boid>,
    ) -> Option<Self> {
        let params = params.checked()?;
        let mut cur = Boids::default();
        for b in boids.into_iter().take(MAX_BOIDS + 1) {
            cur.push(b);
        }
        if cur.len() == 0 || cur.len() > MAX_BOIDS {
            return None;
        }
        Some(Self {
            next: cur.clone(),
            cur,
            params,
            arena,
            steps: 0,
            neighbours: Neighbours::Sorted,
            grid: Grid::default(),
        })
    }

    /// One step: every boid's update from the current state into the
    /// next buffer, then the swap. Neighbours found as [`Self::neighbours`]
    /// says ([`Neighbours::Sorted`] by default: the fastest, measured).
    pub fn step(&mut self) {
        let n = self.cur.len();
        let (cur, p, arena) = (&self.cur, &self.params, self.arena);
        match self.neighbours {
            Neighbours::Brute => {
                for i in 0..n {
                    let Some(me) = cur.get(i) else { continue };
                    let others = (0..n).filter(|&j| j != i).filter_map(|j| cur.get(j));
                    self.next.set(i, steer(p, arena, me, others));
                }
            }
            Neighbours::Grid => {
                let grid = &mut self.grid;
                grid.rebuild(
                    arena.width(),
                    arena.height(),
                    p.visual_range,
                    &cur.x,
                    &cur.y,
                );
                for i in 0..n {
                    let Some(me) = cur.get(i) else { continue };
                    let others = grid
                        .around(me.x, me.y)
                        .filter(|&j| j != i)
                        .filter_map(|j| cur.get(j));
                    self.next.set(i, steer(p, arena, me, others));
                }
            }
            Neighbours::Sorted => {
                let grid = &mut self.grid;
                grid.rebuild(
                    arena.width(),
                    arena.height(),
                    p.visual_range,
                    &cur.x,
                    &cur.y,
                );
                // Into cell order (in `next`, then swapped to be `cur`):
                // cell c's boids are now slots start[c]..start[c + 1], and
                // a block's candidates three runs of the arrays, read
                // whole by the lane loop.
                self.next.gather(cur, grid.order());
                core::mem::swap(&mut self.cur, &mut self.next);
                let (cur, ranges) = (&self.cur, Ranges::of(p));
                for i in 0..n {
                    let Some(me) = cur.get(i) else { continue };
                    let mut seen = Seen::default();
                    for span in grid.spans_around(me.x, me.y) {
                        let (x, y, vx, vy) = (
                            cur.x.get(span.clone()).unwrap_or_default(),
                            cur.y.get(span.clone()).unwrap_or_default(),
                            cur.vx.get(span.clone()).unwrap_or_default(),
                            cur.vy.get(span).unwrap_or_default(),
                        );
                        seen.add_span(ranges, me, x, y, vx, vy);
                    }
                    self.next.set(i, finish(p, arena, me, &seen));
                }
            }
        }
        core::mem::swap(&mut self.cur, &mut self.next);
        self.steps += 1;
    }

    /// How neighbours are found, from the next step.
    pub const fn set_neighbours(&mut self, how: Neighbours) {
        self.neighbours = how;
    }

    #[must_use]
    pub const fn neighbours(&self) -> Neighbours {
        self.neighbours
    }

    #[must_use]
    pub fn len(&self) -> usize {
        self.cur.len()
    }

    /// Never true: a flock has at least one boid.
    #[must_use]
    pub fn is_empty(&self) -> bool {
        self.cur.len() == 0
    }

    #[must_use]
    pub fn boid(&self, i: usize) -> Option<Boid> {
        self.cur.get(i)
    }

    /// Every boid, in storage order.
    pub fn boids(&self) -> impl Iterator<Item = Boid> + '_ {
        (0..self.len()).filter_map(|i| self.cur.get(i))
    }

    #[must_use]
    pub const fn params(&self) -> Params {
        self.params
    }

    /// Replaces the rules' constants from the next step; `false` (and
    /// nothing changed) if they're unusable.
    pub fn set_params(&mut self, params: Params) -> bool {
        params.checked().map(|p| self.params = p).is_some()
    }

    #[must_use]
    pub const fn arena(&self) -> Arena {
        self.arena
    }

    #[must_use]
    pub const fn steps(&self) -> u64 {
        self.steps
    }

    /// The order parameter: `|Σ vᵢ / |vᵢ|| / n`, 1 when every boid heads
    /// the same way, about `1/√n` for random headings (Couzin et al.'s
    /// group polarization; Vicsek et al.'s `v_a`). Summed in `f64`.
    #[must_use]
    pub fn polarization(&self) -> f64 {
        let (mut sx, mut sy, mut n) = (0.0_f64, 0.0_f64, 0.0_f64);
        for b in self.boids() {
            let (vx, vy) = (f64::from(b.vx), f64::from(b.vy));
            let s = (vx * vx + vy * vy).sqrt();
            if s > 0.0 {
                sx += vx / s;
                sy += vy / s;
            }
            n += 1.0;
        }
        (sx * sx + sy * sy).sqrt() / n
    }

    /// The state's bytes for hashing (goldens): every component's bits,
    /// boid by boid.
    pub fn state_bytes(&self) -> impl Iterator<Item = u8> + '_ {
        self.boids()
            .flat_map(|b| [b.x, b.y, b.vx, b.vy])
            .flat_map(f32::to_le_bytes)
    }
}

#[cfg(test)]
mod tests;
