"""Static file server for `cargo xtask serve`.

Python's `http.server`, plus `Cache-Control: no-store` on every response.
Without it, the browser may reuse a cached `engine.wasm` (http.server sends
`Last-Modified` but no caching policy, so browsers apply heuristics), and a
new page then calls into an old engine: M3's pendulum page got `demo_new`
returning null from a pre-M3 wasm. `no-store` makes every reload fetch the
latest build. Dev only: never use this for hosting (docs/hosting.md).
"""

import argparse
import functools
import http.server
import sys


class NoStoreHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self) -> None:
        self.send_header("Cache-Control", "no-store")
        super().end_headers()


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--port", type=int, required=True)
    parser.add_argument("--bind", default="127.0.0.1")
    parser.add_argument("--directory", required=True)
    args = parser.parse_args()

    handler = functools.partial(NoStoreHandler, directory=args.directory)
    try:
        server = http.server.ThreadingHTTPServer((args.bind, args.port), handler)
    except OSError as e:
        print(f"serve.py: can't listen on {args.bind}:{args.port}: {e}", file=sys.stderr)
        return 1
    with server:
        try:
            server.serve_forever()
        except KeyboardInterrupt:
            pass  # Ctrl-C: a normal stop
    return 0


if __name__ == "__main__":
    sys.exit(main())
