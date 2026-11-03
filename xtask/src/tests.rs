use super::{Command, parse};

fn args(a: &[&str]) -> Vec<String> {
    a.iter().map(|s| (*s).to_owned()).collect()
}

#[test]
fn parses_known_commands() {
    assert_eq!(parse(&args(&["site"])), Ok(Command::Site));
    assert_eq!(parse(&args(&["smoke"])), Ok(Command::Smoke));
    assert_eq!(parse(&args(&["test-wasm"])), Ok(Command::TestWasm));
    assert_eq!(parse(&args(&["install-hooks"])), Ok(Command::InstallHooks));
}

#[test]
fn serve_takes_an_optional_port() {
    assert_eq!(parse(&args(&["serve"])), Ok(Command::Serve { port: 8000 }));
    assert_eq!(
        parse(&args(&["serve", "--port", "9001"])),
        Ok(Command::Serve { port: 9001 })
    );
    assert!(parse(&args(&["serve", "--port"])).is_err(), "missing value");
    assert!(parse(&args(&["serve", "--port", "0"])).is_err(), "port 0");
    assert!(
        parse(&args(&["serve", "--port", "http"])).is_err(),
        "not a number"
    );
    assert!(parse(&args(&["serve", "--fast"])).is_err(), "unknown flag");
}

#[test]
fn no_args_or_help_shows_usage() {
    assert_eq!(parse(&args(&[])), Ok(Command::Help));
    assert_eq!(parse(&args(&["help"])), Ok(Command::Help));
    assert_eq!(parse(&args(&["--help"])), Ok(Command::Help));
}

#[test]
fn rejects_unknown_commands_and_extra_args() {
    assert!(parse(&args(&["deploy"])).is_err());
    assert!(parse(&args(&["site", "--fast"])).is_err());
}
