# Zig Bindings & Example Project

For [Gamercade](https://gamercade.io) and the [Gamercade Console](https://github.com/gamercade-io/gamercade_console).

## Zig Bindings for Gamercade

Bindings are located at `/gamercade`.

Import the bindings into your project with `const gc = @import("gamercade")`.

You can also use the `raw` api, by going through `gc.raw`. For example, `gc.raw.set_pixel(0, 10, 10)`.

## Building the Example project

Build the project with `zig build`.

The file will be output at `zig-out/lib/zig-template.wasm`.

Then, follow the [guide on bundling](https://github.com/gamercade-io/gamercade_console/#bundling-a-game-with-the-editor---how-to-create-a-gcrom-file) a game with the editor.

## Zig Version

This was built and is compatible with **Zig 0.9.1**.

## License

Licensed under either of

 * Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or https://www.apache.org/licenses/LICENSE-2.0)
 * MIT license ([LICENSE-MIT](LICENSE-MIT) or https://opensource.org/licenses/MIT)

at your option.

#### Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the Apache-2.0 license, shall be
dual licensed as above, without any additional terms or conditions.
