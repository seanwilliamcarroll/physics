//! [`Vicsek`]: the Vicsek model (`docs/15-swarm.md`, "The Vicsek model";
//! Vicsek et al. 1995). Constant speed v; each step every particle takes
//! the average heading of the particles within `r` of it (itself included)
//! plus a uniform angle in `[−η/2, η/2]`; a periodic square box of side L.

use math::SplitMix64;
use math::convert::f64_to_f32;

use crate::grid::Grid;

pub const MAX_PARTICLES: usize = 1 << 18;

#[derive(Copy, Clone, Debug, PartialEq)]
pub struct VicsekParams {
    pub radius: f32,
    pub speed: f32,
    /// The noise amplitude η: `Δθ` is uniform on `[−η/2, η/2]`, so η =
    /// 2π is no alignment at all.
    pub noise: f32,
}

impl VicsekParams {
    /// The paper's `r = 1`, `v = 0.03`, and a given η.
    #[must_use]
    pub const fn paper(noise: f32) -> Self {
        Self {
            radius: 1.0,
            speed: 0.03,
            noise,
        }
    }

    /// `self` if usable: radius and speed finite and positive, the noise
    /// finite in `[0, 2π]`.
    #[must_use]
    pub fn checked(self) -> Option<Self> {
        let ok = self.radius.is_finite()
            && self.radius > 0.0
            && self.speed.is_finite()
            && self.speed > 0.0
            && (0.0..=core::f32::consts::TAU).contains(&self.noise);
        ok.then_some(self)
    }
}

#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Particle {
    pub x: f32,
    pub y: f32,
    pub cos: f32,
    pub sin: f32,
}

#[derive(Clone, Debug, Default)]
struct State {
    x: Vec<f32>,
    y: Vec<f32>,
    cos: Vec<f32>,
    sin: Vec<f32>,
}

impl State {
    fn get(&self, index: usize) -> Option<Particle> {
        Some(Particle {
            x: *self.x.get(index)?,
            y: *self.y.get(index)?,
            cos: *self.cos.get(index)?,
            sin: *self.sin.get(index)?,
        })
    }

    fn set(&mut self, index: usize, particle: Particle) {
        let slots = (
            self.x.get_mut(index),
            self.y.get_mut(index),
            self.cos.get_mut(index),
            self.sin.get_mut(index),
        );
        if let (Some(x), Some(y), Some(cos), Some(sin)) = slots {
            (*x, *y, *cos, *sin) = (particle.x, particle.y, particle.cos, particle.sin);
        }
    }

    fn push(&mut self, particle: Particle) {
        self.x.push(particle.x);
        self.y.push(particle.y);
        self.cos.push(particle.cos);
        self.sin.push(particle.sin);
    }

    fn len(&self) -> usize {
        self.x.len()
    }
}

/// A Vicsek system: the particles now and the buffer the next step goes
/// into (swapped every step), the noise's random stream, and how often a
/// neighbourhood's headings cancelled exactly.
#[derive(Clone, Debug)]
pub struct Vicsek {
    side: f32,
    params: VicsekParams,
    current: State,
    next: State,
    rng: SplitMix64,
    steps: u64,
    annihilations: u64,
    /// Neighbours through the periodic grid (when ≥ 3 cells fit), or
    /// every pair.
    brute_force: bool,
    grid: Grid,
}

impl Vicsek {
    #[must_use]
    pub fn new(particle_count: usize, side: f32, params: VicsekParams, seed: u64) -> Option<Self> {
        if !(1..=MAX_PARTICLES).contains(&particle_count) {
            return None;
        }
        let mut rng = SplitMix64::new(seed);
        let side_f64 = f64::from(side);
        let particles: Vec<Particle> = (0..particle_count)
            .map(|_| {
                let (x, y) = (rng.range(0.0, side_f64), rng.range(0.0, side_f64));
                let (cos, sin) = loop {
                    let (disc_x, disc_y) = (rng.range(-1.0, 1.0), rng.range(-1.0, 1.0));
                    let length = (disc_x * disc_x + disc_y * disc_y).sqrt();
                    if length > 1e-3 && length <= 1.0 {
                        break (disc_x / length, disc_y / length);
                    }
                };
                Particle {
                    x: f64_to_f32(x),
                    y: f64_to_f32(y),
                    cos: f64_to_f32(cos),
                    sin: f64_to_f32(sin),
                }
            })
            .collect();
        Self::with_particles(side, params, particles, rng.next_u64())
    }

    #[must_use]
    pub fn with_particles(
        side: f32,
        params: VicsekParams,
        particles: impl IntoIterator<Item = Particle>,
        seed: u64,
    ) -> Option<Self> {
        let params = params.checked()?;
        if !(side.is_finite() && side > 0.0) {
            return None;
        }
        let mut current = State::default();
        for particle in particles.into_iter().take(MAX_PARTICLES + 1) {
            current.push(Particle {
                x: wrap_into_box(particle.x, side),
                y: wrap_into_box(particle.y, side),
                ..particle
            });
        }
        if current.len() == 0 || current.len() > MAX_PARTICLES {
            return None;
        }
        Some(Self {
            side,
            params,
            next: current.clone(),
            current,
            rng: SplitMix64::new(seed),
            steps: 0,
            annihilations: 0,
            brute_force: false,
            grid: Grid::default(),
        })
    }

    pub fn step(&mut self) {
        let particle_count = self.current.len();
        let (side, params) = (self.side, self.params);
        let gridded = !self.brute_force
            && self
                .grid
                .rebuild_periodic(side, params.radius, &self.current.x, &self.current.y)
                .is_some();
        for index in 0..particle_count {
            let Some(particle) = self.current.get(index) else {
                continue;
            };
            // The neighbourhood's heading sum, the particle included
            // (distance 0).
            let mut sum = (0.0_f32, 0.0_f32);
            if gridded {
                for cell in self.grid.cells_wrapped(particle.x, particle.y) {
                    let candidates = cell.iter().filter_map(|&j| usize::try_from(j).ok());
                    add_headings(
                        &mut sum,
                        &self.current,
                        particle,
                        side,
                        params.radius,
                        candidates,
                    );
                }
            } else {
                add_headings(
                    &mut sum,
                    &self.current,
                    particle,
                    side,
                    params.radius,
                    0..particle_count,
                );
            }
            let (sum_cos, sum_sin) = sum;
            let next = self.turn(particle, sum_cos, sum_sin);
            self.next.set(index, next);
        }
        core::mem::swap(&mut self.current, &mut self.next);
        self.steps += 1;
    }

    fn turn(&mut self, particle: Particle, sum_cos: f32, sum_sin: f32) -> Particle {
        let length = (sum_cos * sum_cos + sum_sin * sum_sin).sqrt();
        let (mean_cos, mean_sin) = if length > 0.0 {
            (sum_cos / length, sum_sin / length)
        } else {
            self.annihilations += 1;
            (particle.cos, particle.sin)
        };
        // Δθ uniform on [−η/2, η/2], one draw per particle per step in
        // storage order.
        let noise_angle =
            f64_to_f32((self.rng.next_unit_f64() - 0.5) * f64::from(self.params.noise));
        let (noise_sin, noise_cos) = (libm::sinf(noise_angle), libm::cosf(noise_angle));
        let speed = self.params.speed;
        Particle {
            x: wrap_into_box(particle.x + speed * particle.cos, self.side),
            y: wrap_into_box(particle.y + speed * particle.sin, self.side),
            cos: mean_cos * noise_cos - mean_sin * noise_sin,
            sin: mean_cos * noise_sin + mean_sin * noise_cos,
        }
    }

    /// Every pair (`true`) or the periodic grid (`false`, the default;
    /// brute force anyway when fewer than 3 cells fit across the box).
    /// The same neighbours either way.
    pub const fn set_brute_force(&mut self, on: bool) {
        self.brute_force = on;
    }

    #[must_use]
    pub fn len(&self) -> usize {
        self.current.len()
    }

    /// Never true: a system has at least one particle.
    #[must_use]
    pub fn is_empty(&self) -> bool {
        self.current.len() == 0
    }

    #[must_use]
    pub fn particle(&self, index: usize) -> Option<Particle> {
        self.current.get(index)
    }

    pub fn particles(&self) -> impl Iterator<Item = Particle> + '_ {
        (0..self.len()).filter_map(|index| self.current.get(index))
    }

    #[must_use]
    pub const fn side(&self) -> f32 {
        self.side
    }

    #[must_use]
    pub const fn params(&self) -> VicsekParams {
        self.params
    }

    /// Replaces the constants from the next step; `false` (and nothing
    /// changed) if unusable.
    pub fn set_params(&mut self, params: VicsekParams) -> bool {
        params
            .checked()
            .map(|checked| self.params = checked)
            .is_some()
    }

    #[must_use]
    pub const fn steps(&self) -> u64 {
        self.steps
    }

    /// How many times a neighbourhood's headings summed to exactly zero
    /// (the heading was kept): Chen & Zhang's "direction annihilation".
    #[must_use]
    pub const fn annihilations(&self) -> u64 {
        self.annihilations
    }

    /// The order parameter `v_a = |Σ vᵢ| / (N v)`: with every speed v,
    /// the length of the mean heading. Summed in `f64`.
    #[must_use]
    pub fn order(&self) -> f64 {
        let (mut sum_cos, mut sum_sin, mut count) = (0.0_f64, 0.0_f64, 0.0_f64);
        for particle in self.particles() {
            sum_cos += f64::from(particle.cos);
            sum_sin += f64::from(particle.sin);
            count += 1.0;
        }
        (sum_cos * sum_cos + sum_sin * sum_sin).sqrt() / count
    }

    /// The paper's measurement: `transient` steps discarded, then the mean
    /// of [`Self::order`] over the next `window` steps (NaN for an empty
    /// window).
    pub fn mean_order(&mut self, transient: u32, window: u32) -> f64 {
        for _ in 0..transient {
            self.step();
        }
        let mut sum = 0.0;
        for _ in 0..window {
            self.step();
            sum += self.order();
        }
        sum / f64::from(window)
    }

    pub fn state_bytes(&self) -> impl Iterator<Item = u8> + '_ {
        self.particles()
            .flat_map(|particle| [particle.x, particle.y, particle.cos, particle.sin])
            .flat_map(f32::to_le_bytes)
    }
}

/// Adds to `sum` the headings of the `candidates` within `radius` of
/// `particle` (minimum image), the particle included if it's among them.
/// Called once per cell on the grid: the sum carries on from cell to cell,
/// in the same order as one pass over them all.
fn add_headings(
    sum: &mut (f32, f32),
    state: &State,
    particle: Particle,
    side: f32,
    radius: f32,
    candidates: impl Iterator<Item = usize>,
) {
    let radius_squared = radius * radius;
    let (mut sum_cos, mut sum_sin) = *sum;
    for candidate in candidates {
        let Some(other) = state.get(candidate) else {
            continue;
        };
        let (dx, dy) = (
            minimum_image(particle.x - other.x, side),
            minimum_image(particle.y - other.y, side),
        );
        if dx * dx + dy * dy < radius_squared {
            sum_cos += other.cos;
            sum_sin += other.sin;
        }
    }
    *sum = (sum_cos, sum_sin);
}

/// `delta` as the minimum image in a box of `side`: in `[−side/2, side/2]`.
fn minimum_image(delta: f32, side: f32) -> f32 {
    if delta > 0.5 * side {
        delta - side
    } else if delta < -0.5 * side {
        delta + side
    } else {
        delta
    }
}

fn wrap_into_box(coordinate: f32, side: f32) -> f32 {
    let wrapped = if coordinate >= side {
        coordinate - side
    } else if coordinate < 0.0 {
        coordinate + side
    } else {
        coordinate
    };
    // `coordinate + side` can round up to exactly `side` for a tiny
    // negative coordinate.
    if wrapped >= side { 0.0 } else { wrapped }
}

#[cfg(test)]
mod tests;
