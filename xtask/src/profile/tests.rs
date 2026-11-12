use std::path::PathBuf;

use super::{Target, executable, run_args};

#[test]
fn the_executable_is_the_last_one_cargo_reports() {
    let json = concat!(
        r#"{"reason":"compiler-artifact","target":{"name":"math"},"executable":null,"fresh":true}"#,
        "\n",
        r#"{"reason":"compiler-artifact","target":{"name":"dep"},"executable":"/t/profiling/deps/dep-1","fresh":true}"#,
        "\n",
        r#"{"reason":"compiler-artifact","target":{"name":"step"},"executable":"/t/profiling/deps/step-7d27","fresh":false}"#,
        "\n",
        r#"{"reason":"build-finished","success":true}"#,
        "\n",
    );
    assert_eq!(
        executable(json),
        Some(PathBuf::from("/t/profiling/deps/step-7d27"))
    );
}

#[test]
fn no_executable_is_none() {
    assert_eq!(
        executable(r#"{"reason":"compiler-artifact","executable":null}"#),
        None
    );
    assert_eq!(executable(""), None);
}

#[test]
fn a_bench_runs_for_the_time_without_measuring_and_an_example_as_given() {
    let args = ["ants".to_owned()];
    assert_eq!(
        run_args(&Target::Bench("step".to_owned()), 4, &args),
        ["--bench", "--profile-time", "4", "ants"]
    );
    assert_eq!(
        run_args(&Target::Example("workload".to_owned()), 4, &args),
        ["ants"]
    );
}
