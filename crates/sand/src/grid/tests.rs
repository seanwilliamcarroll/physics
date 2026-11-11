use super::{Grid, MAX_CELLS};
use crate::Material;

#[test]
fn sizes_are_checked() {
    assert!(Grid::new(0, 10, 1).is_none());
    assert!(Grid::new(10, 0, 1).is_none());
    assert!(Grid::new(MAX_CELLS, 2, 1).is_none());
    assert!(
        Grid::new(usize::MAX, 2, 1).is_none(),
        "overflow is refused, not wrapped"
    );
    let g = Grid::new(4, 3, 1).unwrap();
    assert_eq!((g.width(), g.height(), g.cells().len()), (4, 3, 12));
    assert_eq!(g.count(Material::Empty), 12);
}

#[test]
fn painting_sets_a_material_inside_and_refuses_outside() {
    let mut g = Grid::new(4, 3, 1).unwrap();
    assert!(g.set(3, 2, Material::Water));
    assert!(!g.set(4, 0, Material::Sand) && !g.set(0, 3, Material::Sand));
    assert_eq!((g.get(3, 2), g.get(4, 0)), (Some(Material::Water), None));
    assert_eq!(g.count(Material::Water), 1);
}
