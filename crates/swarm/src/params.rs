//! [`Params`] and [`Arena`]: the rules' constants and the box they run in,
//! each checked once (`docs/15-swarm.md`, "The model").

/// The rules' constants, in pixels and pixels per step (Δt = 1). The
/// defaults, [`Params::ECE4760`], are the course's published values.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Params {
    /// Boids closer than this (each axis, then the distance) are seen.
    pub visual_range: f32,
    /// Boids closer than this are avoided, and count toward nothing else.
    pub protected_range: f32,
    /// Gain toward the neighbours' mean position (cohesion).
    pub centering: f32,
    /// Gain away from boids inside the protected range (separation).
    pub avoid: f32,
    /// Gain toward the neighbours' mean velocity (alignment).
    pub matching: f32,
    /// The push back inside, per step, past the margin (edge turning).
    pub turn: f32,
    /// Distance from each side of the arena where turning starts.
    pub margin: f32,
    /// The speed band every boid ends a step in.
    pub min_speed: f32,
    pub max_speed: f32,
}

impl Params {
    /// The ECE 4760 boids algorithm's recommended values (Hunter Adams,
    /// Cornell; read 2026-11-11): a course's tuning, not measurements.
    pub const ECE4760: Self = Self {
        visual_range: 40.0,
        protected_range: 8.0,
        centering: 0.0005,
        avoid: 0.05,
        matching: 0.05,
        turn: 0.2,
        margin: 100.0,
        min_speed: 3.0,
        max_speed: 6.0,
    };

    /// `self` if every value is finite and usable: ranges `0 ≤ protected <
    /// visual`, gains and margin `≥ 0`, speeds `0 < min ≤ max`; else
    /// `None`.
    #[must_use]
    pub fn checked(self) -> Option<Self> {
        let all = [
            self.visual_range,
            self.protected_range,
            self.centering,
            self.avoid,
            self.matching,
            self.turn,
            self.margin,
            self.min_speed,
            self.max_speed,
        ];
        let ok = all.iter().all(|v| v.is_finite() && *v >= 0.0)
            && self.protected_range < self.visual_range
            && self.min_speed > 0.0
            && self.min_speed <= self.max_speed;
        ok.then_some(self)
    }
}

/// The box the boids fly in, `[0, width] × [0, height]` pixels, y down
/// (screen order). Its sides are soft: boids are turned back, not stopped.
#[derive(Copy, Clone, Debug, PartialEq)]
pub struct Arena {
    width: f32,
    height: f32,
}

impl Arena {
    /// `None` unless both sides are finite and positive.
    #[must_use]
    pub fn new(width: f32, height: f32) -> Option<Self> {
        let ok = |v: f32| v.is_finite() && v > 0.0;
        (ok(width) && ok(height)).then_some(Self { width, height })
    }

    #[must_use]
    pub const fn width(self) -> f32 {
        self.width
    }

    #[must_use]
    pub const fn height(self) -> f32 {
        self.height
    }
}

#[cfg(test)]
mod tests;
