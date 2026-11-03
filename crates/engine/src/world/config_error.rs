//! [`ConfigError`]: every way a world or scene configuration can be
//! invalid.

use core::fmt;

/// Invalid `World` configuration.
#[derive(Copy, Clone, Debug, PartialEq, Eq)]
pub enum ConfigError {
    /// A softening length ε must be `≥ 0` (not negative, not NaN); see
    /// [`crate::Softening`].
    InvalidSoftening,
    /// A mass must be positive and finite, with a finite inverse; see
    /// [`crate::Mass`].
    InvalidMass,
    /// A constraint names a particle this world doesn't have (e.g. it was
    /// built from another world's particles).
    UnknownParticle,
    /// A spring stiffness must be positive and finite (force-based
    /// springs), or positive (constraints, where ∞ means rigid); see
    /// [`crate::Stiffness`].
    InvalidStiffness,
    /// A damping coefficient must be `≥ 0` and finite; see
    /// [`crate::Damping`].
    InvalidDamping,
}

impl fmt::Display for ConfigError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Self::InvalidSoftening => f.write_str("softening must be at least 0 (and not NaN)"),
            Self::InvalidMass => {
                f.write_str("mass must be positive and finite, with a finite inverse")
            }
            Self::UnknownParticle => f.write_str("constraint names a particle not in this world"),
            Self::InvalidStiffness => {
                f.write_str("stiffness must be positive (and finite for springs)")
            }
            Self::InvalidDamping => f.write_str("damping must be at least 0 and finite"),
        }
    }
}

impl std::error::Error for ConfigError {}
