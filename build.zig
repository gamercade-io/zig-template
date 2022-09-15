const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const mode = b.standardReleaseOptions();
    const lib = b.addSharedLibrary("zig-template", "src/main.zig", .unversioned);
    lib.setBuildMode(mode);

    lib.addPackagePath("gamercade", "gamercade/gamercade.zig");
    lib.setTarget(.{ .cpu_arch = .wasm32, .os_tag = .freestanding });
    lib.export_symbol_names = &[_][]const u8{ "init", "update", "draw" };

    lib.install();
}