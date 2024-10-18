const std = @import("std");
const raylib = @import("raylib-lib");

// expose helper functions to user's build.zig
pub fn addRaylib(b: *std.Build, target: std.Build.ResolvedTarget, optimize: std.builtin.OptimizeMode, options: Options) !*std.Build.Step.Compile {
    return raylib.addRaylibType(b, @This(), target, optimize, options);
}
//pub const addRaygui = raylib.addRaygui;

// expose options for compiling
pub const Options = raylib.Options;

// This has been tested to work with zig 0.12.0
pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = try raylib.addRaylibType(b, raylib, target, optimize, Options.getOptions(b));
    b.installArtifact(lib);
}
