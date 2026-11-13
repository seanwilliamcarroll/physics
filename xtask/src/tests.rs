use clap::{CommandFactory, Parser, error::ErrorKind};

use super::{Cli, Command};

/// Parses `cargo xtask <args>` (argv[0] is the binary name).
fn parse(args: &[&str]) -> Result<Command, ErrorKind> {
    Cli::try_parse_from(std::iter::once("xtask").chain(args.iter().copied()))
        .map(|cli| cli.command)
        .map_err(|e| e.kind())
}

#[test]
fn cli_definition_is_consistent() {
    // clap's own check for mistakes in the definition (duplicate names,
    // conflicting flags) that would otherwise only show at runtime.
    Cli::command().debug_assert();
}

#[test]
fn parses_known_commands() {
    assert_eq!(parse(&["site"]), Ok(Command::Site));
    assert_eq!(parse(&["smoke"]), Ok(Command::Smoke));
    assert_eq!(parse(&["test-wasm"]), Ok(Command::TestWasm));
    assert_eq!(parse(&["install-hooks"]), Ok(Command::InstallHooks));
    assert_eq!(parse(&["api"]), Ok(Command::Api { check: false }));
    assert_eq!(parse(&["api", "--check"]), Ok(Command::Api { check: true }));
    assert_eq!(
        parse(&["mutants", "-f", "x.rs", "--list"]),
        Ok(Command::Mutants {
            args: vec!["-f".to_owned(), "x.rs".to_owned(), "--list".to_owned()]
        })
    );
    assert_eq!(
        parse(&["bench-wasm"]),
        Ok(Command::BenchWasm { budget_ms: 500 })
    );
    assert_eq!(
        parse(&["bench-wasm", "--budget-ms", "100"]),
        Ok(Command::BenchWasm { budget_ms: 100 })
    );
    assert!(
        parse(&["bench-wasm", "--budget-ms", "0"]).is_err(),
        "too short"
    );
    assert_eq!(
        parse(&["coverage"]),
        Ok(Command::Coverage { record: false })
    );
}

#[test]
fn coverage_takes_only_record() {
    // Rust and JS always run together: the JS half takes about a second.
    assert_eq!(
        parse(&["coverage", "--js"]),
        Err(ErrorKind::UnknownArgument)
    );
    assert_eq!(
        parse(&["coverage", "--record"]),
        Ok(Command::Coverage { record: true })
    );
}

#[test]
fn serve_takes_an_optional_port() {
    assert_eq!(parse(&["serve"]), Ok(Command::Serve { port: 8000 }));
    assert_eq!(
        parse(&["serve", "--port", "9001"]),
        Ok(Command::Serve { port: 9001 })
    );
    assert!(parse(&["serve", "--port"]).is_err(), "missing value");
    assert!(parse(&["serve", "--port", "0"]).is_err(), "port 0");
    assert!(parse(&["serve", "--port", "http"]).is_err(), "not a number");
    assert!(parse(&["serve", "--port", "70000"]).is_err(), "over 65535");
    assert!(parse(&["serve", "--fast"]).is_err(), "unknown flag");
}

#[test]
fn no_args_or_help_shows_usage() {
    assert_eq!(
        parse(&[]),
        Err(ErrorKind::DisplayHelpOnMissingArgumentOrSubcommand)
    );
    assert_eq!(parse(&["--help"]), Err(ErrorKind::DisplayHelp));
    assert_eq!(parse(&["help"]), Err(ErrorKind::DisplayHelp));
}

#[test]
fn rejects_unknown_commands_and_extra_args() {
    assert_eq!(parse(&["deploy"]), Err(ErrorKind::InvalidSubcommand));
    assert_eq!(parse(&["site", "--fast"]), Err(ErrorKind::UnknownArgument));
}
