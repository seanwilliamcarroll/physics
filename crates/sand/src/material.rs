//! [`Material`] and the cell byte: 3 bits of material, 4 of shade.

#[derive(Copy, Clone, Debug, PartialEq, Eq, Hash)]
#[repr(u8)]
pub enum Material {
    Empty = 0,
    Sand = 1,
    Water = 2,
    Stone = 3,
    Lava = 4,
    Steam = 5,
}

impl Material {
    pub const ALL: [Self; 6] = [
        Self::Empty,
        Self::Sand,
        Self::Water,
        Self::Stone,
        Self::Lava,
        Self::Steam,
    ];

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

const MATERIAL_MASK: u8 = 0b0000_0111;
const SHADE_SHIFT: u32 = 3;
const SHADE_MASK: u8 = 0b1111;

/// Cells are only written through [`cell`], so an unknown code can't occur.
pub(crate) const fn material(cell_byte: u8) -> Material {
    match Material::from_code(cell_byte & MATERIAL_MASK) {
        Some(known) => known,
        None => Material::Empty,
    }
}

pub(crate) const fn shade(cell_byte: u8) -> u8 {
    (cell_byte >> SHADE_SHIFT) & SHADE_MASK
}

/// A cell byte (from [`Grid::cells`](crate::Grid::cells)) as its material
/// and shade (`0..16`), for renderers.
#[must_use]
pub const fn unpack(cell_byte: u8) -> (Material, u8) {
    (material(cell_byte), shade(cell_byte))
}

pub(crate) const fn cell(material: Material, shade: u8) -> u8 {
    material.code() | ((shade & SHADE_MASK) << SHADE_SHIFT)
}

#[cfg(test)]
mod tests;
