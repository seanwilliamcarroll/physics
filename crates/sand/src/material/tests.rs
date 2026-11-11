use super::{Material, cell, material, shade};

#[test]
fn codes_round_trip_and_unknown_codes_are_none() {
    for m in Material::ALL {
        assert_eq!(Material::from_code(m.code()), Some(m));
    }
    assert_eq!(Material::from_code(7), None);
}

#[test]
fn a_cell_keeps_its_material_and_shade_apart() {
    for m in Material::ALL {
        for s in 0..16 {
            let c = cell(m, s);
            assert_eq!((material(c), shade(c)), (m, s));
        }
    }
    assert_eq!(shade(cell(Material::Sand, 0xff)), 15, "only 4 shade bits");
}
