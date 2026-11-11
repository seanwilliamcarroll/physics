//! [`Material`] and the cell byte: 3 bits of material, 4 of shade.

/// What a cell holds.
#[derive(Copy, Clone, Debug, PartialEq, Eq, Hash)]
#[repr(u8)]
pub enum Material {
    Empty = 0,
    Sand = 1,
    Water = 2,
    /// Static: never moves.
    Stone = 3,
    /// A slow liquid; with water it makes stone and steam (section 4).
    Lava = 4,
    /// Rises; condenses back to water when it can't (section 4).
    Steam = 5,
}

impl Material {
    /// Every material, in code order.
    pub const ALL: [Self; 6] = [
        Self::Empty,
        Self::Sand,
        Self::Water,
        Self::Stone,
        Self::Lava,
        Self::Steam,
    ];

    /// The material with code `code`, if any.
    #[must_use]
    pub const fn from_code(code: u8) -> Option<Self> {
        match code {
            0 => Some(Self::Empty),
            1 => Some(Self::Sand),
            2 => Some(Self::Water),
            3 => Some(Self::Stone),
            4 => Some(Self::Lava),
            5 => Some(Self::Steam),
            _ => None,
        }
    }

    #[must_use]
    pub const fn code(self) -> u8 {
        self as u8
    }
}

/// The material bits of a cell byte.
const MATERIAL_MASK: u8 = 0b0000_0111;
/// The shade bits: `0..16`, rendering only.
const SHADE_SHIFT: u32 = 3;
const SHADE_MASK: u8 = 0b1111;

/// A cell's material. Cells are only ever written through [`cell`], so an
/// unknown code can't occur; it would read as empty.
pub(crate) const fn material(cell: u8) -> Material {
    match Material::from_code(cell & MATERIAL_MASK) {
        Some(m) => m,
        None => Material::Empty,
    }
}

/// A cell's shade, `0..16`.
pub(crate) const fn shade(cell: u8) -> u8 {
    (cell >> SHADE_SHIFT) & SHADE_MASK
}

/// A cell byte (from [`Grid::cells`](crate::Grid::cells)) as its material
/// and shade (`0..16`): for renderers, which can tabulate all 256.
#[must_use]
pub const fn unpack(cell: u8) -> (Material, u8) {
    (material(cell), shade(cell))
}

/// The byte for `material` with `shade` (its low 4 bits).
pub(crate) const fn cell(material: Material, shade: u8) -> u8 {
    material.code() | ((shade & SHADE_MASK) << SHADE_SHIFT)
}

#[cfg(test)]
mod tests;
