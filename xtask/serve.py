"""Static file server for `cargo xtask serve` and `cargo xtask smoke`.

Python's `http.server`, plus `Cache-Control: no-store` on every response
and a deeper listen backlog.

`no-store`: without it, the browser may reuse a cached `engine.wasm`
(http.server sends `Last-Modified` but no caching policy, so browsers apply
heuristics), and a new page then calls into an old engine: M3's pendulum
page got `demo_new` returning null from a pre-M3 wasm. `no-store` makes
every reload fetch the latest build.

The backlog: `socketserver`'s default `request_queue_size` is 5, and a page
asks for its dozen JS modules at once. When the queue overflows, macOS
resets the connection (measured on Darwin 27: `ERR_CONNECTION_RESET` on
some module, so the import graph fails and the page never starts; about 1
smoke load in 10). With 128, 0 in 40.

Dev only: never use this for hosting (docs/hosting.md).
"""

import argparse
import functools
import http.server
import sys


# Pending connections the kernel holds for us (see the module docstring).
LISTEN_BACKLOG = 128


class Server(http.server.ThreadingHTTPServer):
    request_queue_size = LISTEN_BACKLOG


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
        server = Server((args.bind, args.port), handler)
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
