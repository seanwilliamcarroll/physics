use super::{batches, json_string, tree_entry};

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

#[test]
fn entries_are_batched_in_order_under_the_limit() {
    let e: Vec<String> = ["aaaa", "bb", "cccc", "d", "eeeeeeeeee", "f"]
        .iter()
        .map(|s| (*s).to_owned())
        .collect();
    let got: Vec<Vec<&str>> = batches(&e, 10, 6)
        .iter()
        .map(|b| b.iter().map(String::as_str).collect())
        .collect();
    // Each batch ≤ 6 bytes, except one entry larger than that, alone.
    assert_eq!(
        got,
        [
            vec!["aaaa", "bb"],
            vec!["cccc", "d"],
            vec!["eeeeeeeeee"],
            vec!["f"]
        ]
    );
    assert_eq!(batches(&[], 10, 6).len(), 0);
    // And at most `files` entries a batch, whatever their size.
    let many: Vec<String> = (0..7).map(|k| k.to_string()).collect();
    let sizes: Vec<usize> = batches(&many, 3, 1000).iter().map(|b| b.len()).collect();
    assert_eq!(sizes, [3, 3, 1]);
}
