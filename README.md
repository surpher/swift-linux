# swift-linux

## SwiftHTTP

Just testing out how Swift runs on Linux by tryingt o create a simple API client that fetches data from [https://swapi.dev/api](https://swapi.dev.api).

```shell
git clone https://github.com/pact-foundation/pact-reference
cd pact-reference/rust/pact_ffi
cargo build --release
export LD_LIBRARY_PATH=/absolute/path/to/pact-reference/rust/target/release/
swift build && .build/debug/SwiftHTTP
swift test -Xlinker -L/absolute/path/to/pact-reference/rust/target/release/
```
