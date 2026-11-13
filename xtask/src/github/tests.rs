use super::{json_string, tree_entry};

#[test]
fn json_strings_escape_what_json_needs() {
    assert_eq!(json_string("plain"), "\"plain\"");
    assert_eq!(
        json_string("a \"b\" \\ c\nd\te\u{1}"),
        "\"a \\\"b\\\" \\\\ c\\nd\\te\\u0001\""
    );
    assert_eq!(json_string("± µs"), "\"± µs\"", "non-ASCII as is");
}

#[test]
fn a_tree_entry_writes_content_or_removes() {
    assert_eq!(
        tree_entry("docs/x.md", Some("hi")),
        r#"{"path":"docs/x.md","mode":"100644","type":"blob","content":"hi"}"#
    );
    assert_eq!(
        tree_entry("docs/x.md", None),
        r#"{"path":"docs/x.md","mode":"100644","type":"blob","sha":null}"#
    );
}
