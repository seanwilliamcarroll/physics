use super::{is_release_version, js_specifiers, package_json, tarball_name, workspace_version};

#[test]
fn the_version_is_read_from_the_workspace_table_only() {
    let toml = r#"
[workspace]
members = ["crates/*"]

[workspace.package]
edition = "2024"
version = "0.3.1"
license = "MIT"

[workspace.dependencies]
version = "9.9.9"
"#;
    assert_eq!(workspace_version(toml), Some("0.3.1"));
    // Not another table's `version`, and not a key that only contains it.
    let other = "[workspace.package]\nrust-version = \"1.99\"\n\n[package]\nversion = \"1.0.0\"\n";
    assert_eq!(workspace_version(other), None);
    assert_eq!(workspace_version("[package]\nversion = \"1.0.0\"\n"), None);
}

#[test]
fn a_release_version_is_three_numbers() {
    for good in ["0.1.0", "1.20.300"] {
        assert!(is_release_version(good), "{good}");
    }
    for bad in ["", "1.0", "1.0.0.0", "1.0.x", "v1.0.0", "1..0", "1.0.0-rc1"] {
        assert!(!is_release_version(bad), "{bad}");
    }
}

#[test]
fn the_package_json_names_the_entry_the_types_and_the_wasm() {
    let json = package_json("0.1.0");
    for needed in [
        r#""name": "physics-engine""#,
        r#""version": "0.1.0""#,
        r#""type": "module""#,
        r#""types": "./engine-package.d.ts""#,
        r#""default": "./engine-package.js""#,
        r#""./engine.wasm": "./engine.wasm""#,
        r#""license": "MIT""#,
    ] {
        assert!(json.contains(needed), "missing {needed} in\n{json}");
    }
    // Braces balance (it's assembled by format!, where `{{` is one).
    assert_eq!(json.matches('{').count(), json.matches('}').count());
    assert_eq!(tarball_name("0.1.0"), "physics-engine-0.1.0.tgz");
}

#[test]
fn declarations_point_at_the_js_that_ships() {
    let dts = concat!(
        "import type { WasmSource } from \"./engine-loader.ts\";\n",
        "import type { EngineExports } from \"./engine\";\n",
        "export * from \"./abi.ts\";\n",
        "/** A file named notes.ts\" in a comment stays. */\n",
        "export declare const NAME = \"x.ts\";\n",
    );
    assert_eq!(
        js_specifiers(dts),
        concat!(
            "import type { WasmSource } from \"./engine-loader.js\";\n",
            "import type { EngineExports } from \"./engine\";\n",
            "export * from \"./abi.js\";\n",
            "/** A file named notes.ts\" in a comment stays. */\n",
            "export declare const NAME = \"x.ts\";\n",
        )
    );
}
