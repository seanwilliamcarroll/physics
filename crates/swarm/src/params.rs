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
    /// The push back inside, per step, past the margin.
    pub turn: f32,
    /// Distance from each side where turning starts.
    pub margin: f32,
    /// The speed band every boid ends a step in.
    pub min_speed: f32,
    pub max_speed: f32,
}

impl Params {
    /// ECE 4760's recommended values (Hunter Adams, Cornell).
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

    /// `self` if every value is finite and `≥ 0`, `protected < visual`
    /// and `0 < min ≤ max` speed; else `None`.
    #[must_use]
    pub fn checked(self) -> Option<Self> {
        let every_value = [
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
        let usable = every_value
            .iter()
            .all(|value| value.is_finite() && *value >= 0.0)
            && self.protected_range < self.visual_range
            && self.min_speed > 0.0
            && self.min_speed <= self.max_speed;
        usable.then_some(self)
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
        let usable = |side: f32| side.is_finite() && side > 0.0;
        (usable(width) && usable(height)).then_some(Self { width, height })
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
