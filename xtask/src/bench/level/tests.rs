use std::path::{Path, PathBuf};

use super::{Cpu, Host, Level, available, executables};

#[test]
fn levels_parse_by_name_and_name_their_records() {
    for l in Level::ALL {
        assert_eq!(Level::parse(l.name()), Some(l));
    }
    assert_eq!(Level::parse("avx9"), None);
    assert_eq!(
        Level::Baseline.record_name("llm"),
        "llm",
        "the baseline keeps the old name"
    );
    assert_eq!(Level::Native.record_name("llm"), "llm-native");
    assert_eq!(Level::X86V3.record_name("llm"), "llm-x86-64-v3");
    assert_eq!(Level::V8.record_name("macbook-air-5"), "macbook-air-5-v8");
}

#[test]
fn each_level_builds_with_its_flags_in_its_own_directory() {
    let t = Path::new("/w/target");
    assert_eq!(Level::Baseline.target_dir(t), PathBuf::from("/w/target"));
    assert_eq!(
        Level::Native.target_dir(t),
        PathBuf::from("/w/target/bench-native")
    );
    assert_eq!(Level::V8.target_dir(t), PathBuf::from("/w/target/bench-v8"));
    assert_eq!(Level::Baseline.rustflags(), None);
    assert_eq!(
        Level::V8.rustflags(),
        None,
        "wasm's simd128 is the repository's"
    );
    assert_eq!(Level::X86V3.rustflags(), Some("-C target-cpu=x86-64-v3"));
    assert_eq!(Level::Native.rustflags(), Some("-C target-cpu=native"));
    assert!(Level::V8.is_wasm() && !Level::Native.is_wasm());
    assert!(Level::Native.describe().contains("target-cpu=native"));
}

#[test]
fn a_machine_runs_the_levels_it_has() {
    let m4 = Host {
        node: true,
        ..Host::default()
    };
    assert_eq!(available(m4), [Level::Baseline, Level::V8]);
    let zen5 = Host {
        cpu: Cpu::X86Avx512,
        node: true,
    };
    assert_eq!(available(zen5), Level::ALL);
    let older = Host {
        cpu: Cpu::X86Avx2,
        node: false,
    };
    assert_eq!(
        available(older),
        [Level::Baseline, Level::X86V3],
        "native would be v3 again"
    );
    let bare = Host {
        cpu: Cpu::X86,
        node: false,
    };
    assert_eq!(available(bare), [Level::Baseline]);
}

#[test]
fn every_executable_is_read_from_cargo_s_json() {
    let json = concat!(
        "{\"reason\":\"compiler-artifact\",\"executable\":null}\n",
        "{\"reason\":\"compiler-artifact\",\"executable\":\"/t/step-1.wasm\"}\n",
        "{\"reason\":\"build-finished\"}\n",
        "{\"reason\":\"compiler-artifact\",\"executable\":\"/t/fft-2.wasm\"}\n",
    );
    assert_eq!(
        executables(json),
        [
            PathBuf::from("/t/step-1.wasm"),
            PathBuf::from("/t/fft-2.wasm")
        ]
    );
}
