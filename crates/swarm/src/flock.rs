//! [`Flock`]: the boids, double-buffered as structure of arrays, and the
//! step (`docs/15-swarm.md`, "Double buffering").

use math::SplitMix64;
use math::convert::f64_to_f32;

mod brute;
mod grid;
mod sorted;

use crate::grid::Grid;
use crate::{Arena, Params};

/// The most boids a flock holds: 2¹⁸.
pub const MAX_BOIDS: usize = 1 << 18;

/// How a step finds each boid's neighbours (`docs/15-swarm.md`, "Finding
/// neighbours"). The same neighbours either way; the sums over them run
/// in a different order, so trajectories agree only to rounding.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub enum Neighbours {
    /// Every boid: n² checks a step. The reference.
    Brute,
    /// A cell list by counting sort: the 3 × 3 cells around each boid.
    Grid,
    /// The grid, with the boids moved into cell order every step (so
    /// their indices change). The default: 10k boids in 1.4 ms natively
    /// against the grid's 7.3.
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

#[derive(Clone, Debug, Default)]
struct Boids {
    x: Vec<f32>,
    y: Vec<f32>,
    vx: Vec<f32>,
    vy: Vec<f32>,
}

impl Boids {
    fn get(&self, index: usize) -> Option<Boid> {
        Some(Boid {
            x: *self.x.get(index)?,
            y: *self.y.get(index)?,
            vx: *self.vx.get(index)?,
            vy: *self.vy.get(index)?,
        })
    }

    fn set(&mut self, index: usize, boid: Boid) {
        let slots = (
            self.x.get_mut(index),
            self.y.get_mut(index),
            self.vx.get_mut(index),
            self.vy.get_mut(index),
        );
        if let (Some(x), Some(y), Some(vx), Some(vy)) = slots {
            (*x, *y, *vx, *vy) = (boid.x, boid.y, boid.vx, boid.vy);
        }
    }

    fn push(&mut self, boid: Boid) {
        self.x.push(boid.x);
        self.y.push(boid.y);
        self.vx.push(boid.vx);
        self.vy.push(boid.vy);
    }

    fn len(&self) -> usize {
        self.x.len()
    }

    fn gather(&mut self, source: &Self, order: &[u32]) {
        let pick = |values: &[f32], gathered: &mut Vec<f32>| {
            gathered.clear();
            gathered.extend(
                order
                    .iter()
                    .filter_map(|&index| values.get(usize::try_from(index).ok()?).copied()),
            );
        };
        pick(&source.x, &mut self.x);
        pick(&source.y, &mut self.y);
        pick(&source.vx, &mut self.vx);
        pick(&source.vy, &mut self.vy);
    }
}

/// A flock: the boids now (`now`) and the buffer the next step is written
/// into (`next`), swapped after every step, so every boid sees the same
/// instant whatever order they're stored in.
#[derive(Clone, Debug)]
pub struct Flock {
    now: Boids,
    next: Boids,
    params: Params,
    arena: Arena,
    steps: u64,
    neighbours: Neighbours,
    grid: Grid,
    predator: Option<(f32, f32)>,
}

impl Flock {
    /// `boid_count` boids (1 to [`MAX_BOIDS`]) at random inside the margins
    /// (the whole arena if it's narrower than two margins), heading in
    /// random directions at random speeds in the band; `seed` makes it
    /// repeatable. `None` for a bad count or unusable `params`.
    #[must_use]
    pub fn new(boid_count: usize, arena: Arena, params: Params, seed: u64) -> Option<Self> {
        let params = params.checked()?;
        if !(1..=MAX_BOIDS).contains(&boid_count) {
            return None;
        }
        let mut rng = SplitMix64::new(seed);
        let span = |side: f32| {
            let margin = f64::from(params.margin);
            let side = f64::from(side);
            if side > 2.0 * margin {
                (margin, side - margin)
            } else {
                (0.0, side)
            }
        };
        let (x_span, y_span) = (span(arena.width()), span(arena.height()));
        let (min_speed, max_speed) = (f64::from(params.min_speed), f64::from(params.max_speed));
        let boids = (0..boid_count).map(|_| {
            let (x, y) = (rng.range(x_span.0, x_span.1), rng.range(y_span.0, y_span.1));
            // A point in the unit disc (rejection, no trig), normalized.
            let (dx, dy, length) = loop {
                let (dx, dy) = (rng.range(-1.0, 1.0), rng.range(-1.0, 1.0));
                let length = (dx * dx + dy * dy).sqrt();
                if length > 1e-3 && length <= 1.0 {
                    break (dx, dy, length);
                }
            };
            let speed = if max_speed > min_speed {
                rng.range(min_speed, max_speed)
            } else {
                min_speed
            };
            Boid {
                x: f64_to_f32(x),
                y: f64_to_f32(y),
                vx: f64_to_f32(dx / length * speed),
                vy: f64_to_f32(dy / length * speed),
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
        let mut now = Boids::default();
        for boid in boids.into_iter().take(MAX_BOIDS + 1) {
            now.push(boid);
        }
        if now.len() == 0 || now.len() > MAX_BOIDS {
            return None;
        }
        Some(Self {
            next: now.clone(),
            now,
            params,
            arena,
            steps: 0,
            neighbours: Neighbours::Sorted,
            grid: Grid::default(),
            predator: None,
        })
    }

    /// One step, finding neighbours as [`Self::neighbours`] says, then
    /// swapping the buffers.
    pub fn step(&mut self) {
        match self.neighbours {
            Neighbours::Brute => self.step_brute(),
            Neighbours::Grid => self.step_grid(),
            Neighbours::Sorted => self.step_sorted(),
        }
        core::mem::swap(&mut self.now, &mut self.next);
        self.steps += 1;
    }

    /// Puts the predator at `(x, y)` (pixels), or removes it (`None`);
    /// boids within [`PREDATOR_RANGE`](crate::PREDATOR_RANGE) flee it.
    /// `false` (nothing changed) for a non-finite point.
    pub fn set_predator(&mut self, at: Option<(f32, f32)>) -> bool {
        if at.is_some_and(|(x, y)| !x.is_finite() || !y.is_finite()) {
            return false;
        }
        self.predator = at;
        true
    }

    #[must_use]
    pub const fn predator(&self) -> Option<(f32, f32)> {
        self.predator
    }

    pub const fn set_neighbours(&mut self, method: Neighbours) {
        self.neighbours = method;
    }

    #[must_use]
    pub const fn neighbours(&self) -> Neighbours {
        self.neighbours
    }

    #[must_use]
    pub fn len(&self) -> usize {
        self.now.len()
    }

    /// Never true: a flock has at least one boid.
    #[must_use]
    pub fn is_empty(&self) -> bool {
        self.now.len() == 0
    }

    /// The boid at `index`, or `None` past the end.
    #[must_use]
    pub fn boid(&self, index: usize) -> Option<Boid> {
        self.now.get(index)
    }

    pub fn boids(&self) -> impl Iterator<Item = Boid> + '_ {
        (0..self.len()).filter_map(|index| self.now.get(index))
    }

    #[must_use]
    pub const fn params(&self) -> Params {
        self.params
    }

    /// `false` (and nothing changed) if `params` are unusable.
    pub fn set_params(&mut self, params: Params) -> bool {
        params
            .checked()
            .map(|usable| self.params = usable)
            .is_some()
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
        let (mut sum_x, mut sum_y, mut boid_count) = (0.0_f64, 0.0_f64, 0.0_f64);
        for boid in self.boids() {
            let (vx, vy) = (f64::from(boid.vx), f64::from(boid.vy));
            let speed = (vx * vx + vy * vy).sqrt();
            if speed > 0.0 {
                sum_x += vx / speed;
                sum_y += vy / speed;
            }
            boid_count += 1.0;
        }
        (sum_x * sum_x + sum_y * sum_y).sqrt() / boid_count
    }

    /// Every component's bits, boid by boid, for hashing.
    pub fn state_bytes(&self) -> impl Iterator<Item = u8> + '_ {
        self.boids()
            .flat_map(|boid| [boid.x, boid.y, boid.vx, boid.vy])
            .flat_map(f32::to_le_bytes)
    }
}

#[cfg(test)]
mod tests;
