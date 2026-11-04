use super::{Report, judge, judge_audio, judge_panic};

/// Real line shapes from Chrome's `--enable-logging=stderr` output.
fn console(msg: &str) -> String {
    format!(
        "[1:2:1102/150000.000:INFO:CONSOLE:42] \"{msg}\", source: http://127.0.0.1:1/x.js (42)\n"
    )
}
const SERIALIZE: &str = "[1:2:1102/150000.000:ERROR:gpu/command_buffer/client/raster_implementation.cc:337] Failed to serialize op in 16777152 bytes.\n";

#[test]
fn accepts_a_healthy_report() {
    let log = format!("noise\n{}", console("SMOKE ok steps=30 particle_px=1502"));
    assert_eq!(
        judge(&log),
        Ok(Report {
            steps: 30,
            particle_px: 1502
        })
    );
}

#[test]
fn rejects_dropped_draw_commands_even_if_the_page_reports_ok() {
    let log = format!("{SERIALIZE}{}", console("SMOKE ok steps=30 particle_px=9"));
    assert!(judge(&log).unwrap_err().contains("serialize"));
}

#[test]
fn rejects_a_missing_report() {
    assert!(judge("just noise\n").unwrap_err().contains("no SMOKE line"));
}

#[test]
fn rejects_page_errors() {
    let err = judge(&console("SMOKE error demo_new returned null")).unwrap_err();
    assert!(err.contains("demo_new returned null"), "{err}");
}

#[test]
fn rejects_no_steps_or_no_particles_drawn() {
    assert!(judge(&console("SMOKE ok steps=0 particle_px=10")).is_err());
    assert!(judge(&console("SMOKE ok steps=30 particle_px=0")).is_err());
}

#[test]
fn rejects_malformed_reports() {
    assert!(judge(&console("SMOKE ok steps=many particle_px=1")).is_err());
    assert!(judge(&console("SMOKE ok steps=30")).is_err());
}

const PANIC_CONSOLE: &str =
    "engine.wasm panicked at crates/web/src/exports.rs:99:5:\\ndeliberate test panic";

#[test]
fn panic_case_needs_both_the_page_report_and_the_console_line() {
    let good = format!(
        "{}{}",
        console(PANIC_CONSOLE),
        console("SMOKE ok panic_logged=1")
    );
    assert!(judge_panic(&good).is_ok(), "{:?}", judge_panic(&good));

    let no_console = console("SMOKE ok panic_logged=1");
    assert!(judge_panic(&no_console).unwrap_err().contains("console"));

    let page_error = format!(
        "{}{}",
        console(PANIC_CONSOLE),
        console("SMOKE error hook did not report")
    );
    assert!(
        judge_panic(&page_error)
            .unwrap_err()
            .contains("hook did not report")
    );

    assert!(
        judge_panic(&console(PANIC_CONSOLE))
            .unwrap_err()
            .contains("no SMOKE line")
    );
}

#[test]
fn audio_reports_need_an_audible_unclipped_peak() {
    let line = |msg: &str| console(&format!("SMOKE {msg}"));
    assert!(judge_audio(&line("ok audio_peak=0.4210 samples=48000")).is_ok());
    assert!(
        judge_audio(&line("ok audio_peak=0.0001 samples=48000")).is_err(),
        "silent"
    );
    assert!(
        judge_audio(&line("ok audio_peak=1.5 samples=48000")).is_err(),
        "clipped"
    );
    assert!(
        judge_audio(&line("ok audio_peak=0.5 samples=0")).is_err(),
        "nothing rendered"
    );
    assert!(judge_audio(&line("error non-finite sample")).is_err());
}

#[test]
fn a_rendered_song_must_be_on_time() {
    let line = |msg: &str| console(&format!("SMOKE {msg}"));
    let ok = "ok audio_peak=0.2 samples=120000 song_notes=3 onsets=3 onset_worst_ms=5.0";
    assert!(judge_audio(&line(ok)).unwrap().contains("onset_worst_ms=5"));
    let late = "ok audio_peak=0.2 samples=120000 song_notes=3 onsets=3 onset_worst_ms=25.0";
    assert!(judge_audio(&line(late)).is_err(), "late");
    let missing = "ok audio_peak=0.2 samples=120000 song_notes=3 onsets=2 onset_worst_ms=5.0";
    assert!(judge_audio(&line(missing)).is_err(), "a note never sounded");
}
