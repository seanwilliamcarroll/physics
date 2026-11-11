use super::{
    DEFAULT_RATE_HZ, MATERIAL_EMPTY, MATERIAL_LAVA, MATERIAL_SAND, MATERIAL_STEAM, MATERIAL_STONE,
    MATERIAL_WATER, MAX_BRUSH, MAX_RATE_HZ, MAX_SIDE,
};
use sand::Material;

const ABI_JS: &str = include_str!("../../../../site/js/sand-abi.ts");

#[test]
fn js_mirror_matches() {
    for (name, value) in [
        ("MATERIAL_EMPTY", MATERIAL_EMPTY),
        ("MATERIAL_SAND", MATERIAL_SAND),
        ("MATERIAL_WATER", MATERIAL_WATER),
        ("MATERIAL_STONE", MATERIAL_STONE),
        ("MATERIAL_LAVA", MATERIAL_LAVA),
        ("MATERIAL_STEAM", MATERIAL_STEAM),
        ("MAX_SIDE", MAX_SIDE),
        ("MAX_BRUSH", MAX_BRUSH),
        ("DEFAULT_RATE_HZ", DEFAULT_RATE_HZ),
        ("MAX_RATE_HZ", MAX_RATE_HZ),
    ] {
        let line = format!("export const {name} = {value};");
        assert!(
            ABI_JS.contains(&line),
            "site/js/sand-abi.ts is missing `{line}`"
        );
    }
}

#[test]
fn material_codes_are_the_automatons() {
    let codes = [
        (MATERIAL_EMPTY, Material::Empty),
        (MATERIAL_SAND, Material::Sand),
        (MATERIAL_WATER, Material::Water),
        (MATERIAL_STONE, Material::Stone),
        (MATERIAL_LAVA, Material::Lava),
        (MATERIAL_STEAM, Material::Steam),
    ];
    assert_eq!(codes.len(), Material::ALL.len());
    for (code, m) in codes {
        assert_eq!(u32::from(m.code()), code);
    }
}
