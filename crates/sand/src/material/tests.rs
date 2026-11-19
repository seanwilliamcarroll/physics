use super::{Material, cell, material, shade, unpack};

#[test]
fn codes_round_trip_and_unknown_codes_are_none() {
    for each in Material::ALL {
        assert_eq!(Material::from_code(each.code()), Some(each));
    }
    assert_eq!(Material::from_code(7), None);
}

#[test]
fn a_cell_keeps_its_material_and_shade_apart() {
    for each in Material::ALL {
        for each_shade in 0..16 {
            let cell_byte = cell(each, each_shade);
            assert_eq!((material(cell_byte), shade(cell_byte)), (each, each_shade));
            assert_eq!(unpack(cell_byte), (each, each_shade));
        }
    }
    assert_eq!(shade(cell(Material::Sand, 0xff)), 15, "only 4 shade bits");
}
