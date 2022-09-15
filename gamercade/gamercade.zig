const raw = @import("gamercade-raw.zig");
const std = @import("std");

test {
    std.testing.refAllDecls(@This());
}

// Audio Api
pub fn playBgm(bgm_index: usize) void {
    raw.play_bgm(@intCast(i32, bgm_index));
}
pub fn playSfx(sfx_index: usize, channel: usize) void {
    raw.play_sfx(@intCast(i32, sfx_index), @intCast(i32, channel));
}
pub fn stopBgm() void {
    raw.stop_bgm();
}
pub fn stopChannel(channel: usize) void {
    raw.stop_channel(@intCast(i32, channel));
}
pub fn playNote(note_id: usize, instrument_index: usize, channel: usize) void {
    raw.play_note(@intCast(i32, note_id), @intCast(i32, instrument_index), @intCast(i32, channel));
}
pub fn playFrequency(frequency: f32, instrument_index: usize, channel: usize) void {
    raw.play_frequency(frequency, @intCast(i32, instrument_index), @intCast(i32, channel));
}

// Data Api
pub fn height() usize {
    return @intCast(usize, raw.height());
}
pub fn width() usize {
    return @intCast(usize, raw.width());
}
pub fn fps() usize {
    return @intCast(usize, raw.fps());
}
pub fn frameTime() f32 {
    return raw.frame_time();
}
pub fn spriteSheetCount() usize {
    return @intCast(usize, raw.sprite_sheet_count());
}
pub fn paletteCount() usize {
    return @intCast(usize, raw.palette_count());
}
pub fn spriteHeight(sprite_sheet: usize) ?usize {
    return i32ToOptionUsize(raw.sprite_height(@intCast(i32, sprite_sheet)));
}
pub fn spriteWidth(sprite_sheet: usize) ?usize {
    return i32ToOptionUsize(raw.sprite_width(@intCast(i32, sprite_sheet)));
}
pub fn spriteCount(sprite_sheet: usize) ?usize {
    return i32ToOptionUsize(raw.sprite_count(@intCast(i32, sprite_sheet)));
}
pub fn bgmLengthSecs(bgm_index: usize) ?f32 {
    return f32ToOption(raw.bgm_length_secs(@intCast(i32, bgm_index)));
}
pub fn bgmLengthFrames(bgm_index: usize) ?usize {
    return i32ToOptionUsize(raw.bgm_length_frames(@intCast(i32, bgm_index)));
}
pub fn sfxLengthSecs(sfx_index: usize) ?f32 {
    return f32ToOption(raw.sfx_length_secs(@intCast(i32, sfx_index)));
}
pub fn sfxLengthFrames(sfx_index: usize) ?usize {
    return i32ToOptionUsize(raw.sfx_length_frames(@intCast(i32, sfx_index)));
}

// Graphics Params Api
pub fn paletteIndex(palette_index: usize) i32 {
    return raw.palette_index(@intCast(i32, palette_index));
}
pub fn spriteSheetIndex(sprite_sheet_index: usize) i32 {
    return raw.sprite_sheet_index(@intCast(i32, sprite_sheet_index));
}
pub fn spriteIndex(sprite_index: usize) i32 {
    return raw.sprite_index(@intCast(i32, sprite_index));
}
pub fn colorIndex(color_index: usize) i32 {
    return raw.color_index(@intCast(i32, color_index));
}
pub fn flipX(flip_x: bool) i32 {
    return raw.flip_x(@boolToInt(flip_x));
}
pub fn flipY(flip_y: bool) i32 {
    return raw.flip_y(@boolToInt(flip_y));
}
pub fn graphicsParameters(
    palette_index: usize,
    sprite_sheet_index: usize,
    sprite_index: usize,
    color_index: usize,
    flip_x: bool,
    flip_y: bool,
) i32 {
    return raw.graphics_parameters(@intCast(i32, palette_index), @intCast(i32, sprite_sheet_index), @intCast(i32, sprite_index), @intCast(i32, color_index), @boolToInt(flip_x), @boolToInt(flip_y));
}

// Draw Api
pub fn clearScreen(graphics_parameters: i32) void {
    raw.clear_screen(graphics_parameters);
}
pub fn setPixel(graphics_parameters: i32, x: i32, y: i32) void {
    raw.set_pixel(graphics_parameters, x, y);
}
pub fn circle(graphics_parameters: i32, x: i32, y: i32, radius: i32) void {
    raw.circle(graphics_parameters, x, y, radius);
}
pub fn circleFilled(graphics_parameters: i32, x: i32, y: i32, radius: i32) void {
    raw.circle_filled(graphics_parameters, x, y, radius);
}
pub fn rect(graphics_parameters: i32, x: i32, y: i32, rect_width: i32, rect_height: i32) void {
    raw.rect(graphics_parameters, x, y, rect_width, rect_height);
}
pub fn rectFilled(graphics_parameters: i32, x: i32, y: i32, rect_width: i32, rect_height: i32) void {
    raw.rect_filled(graphics_parameters, x, y, rect_width, rect_height);
}
pub fn line(graphics_parameters: i32, x0: i32, y0: i32, x1: i32, y1: i32) void {
    raw.line(graphics_parameters, x0, y0, x1, y1);
}
pub fn sprite(graphics_parameters: i32, transparency_mask: i64, x: i32, y: i32) void {
    raw.sprite(graphics_parameters, transparency_mask, x, y);
}

// Text Api
pub fn consoleLog(text: []const u8) void {
    raw.console_log(text.ptr, text.len);
}

// Random Api
pub fn setSeed(seed: i32) void {
    raw.set_seed(seed);
}
pub fn randomIntRange(min: i32, max: i32) i32 {
    return raw.random_int_range(min, max);
}
pub fn randomFloat() f32 {
    return raw.random_float();
}
pub fn randomFloatRange(min: f32, max: f32) f32 {
    return raw.random_float_range(min, max);
}

// Input Api
pub fn buttonAPressed(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_a_pressed(@intCast(i32, player_id)));
}
pub fn buttonAReleased(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_a_released(@intCast(i32, player_id)));
}
pub fn buttonAHeld(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_a_held(@intCast(i32, player_id)));
}
pub fn buttonBPressed(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_b_pressed(@intCast(i32, player_id)));
}
pub fn buttonBReleased(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_b_released(@intCast(i32, player_id)));
}
pub fn buttonBHeld(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_b_held(@intCast(i32, player_id)));
}
pub fn buttonCPressed(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_c_pressed(@intCast(i32, player_id)));
}
pub fn buttonCReleased(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_c_released(@intCast(i32, player_id)));
}
pub fn buttonCHeld(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_c_held(@intCast(i32, player_id)));
}
pub fn buttonDPressed(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_d_pressed(@intCast(i32, player_id)));
}
pub fn buttonDReleased(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_d_released(@intCast(i32, player_id)));
}
pub fn buttonDHeld(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_d_held(@intCast(i32, player_id)));
}
pub fn buttonUpPressed(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_up_pressed(@intCast(i32, player_id)));
}
pub fn buttonUpReleased(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_up_released(@intCast(i32, player_id)));
}
pub fn buttonUpHeld(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_up_held(@intCast(i32, player_id)));
}
pub fn buttonDownPressed(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_down_pressed(@intCast(i32, player_id)));
}
pub fn buttonDownReleased(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_down_released(@intCast(i32, player_id)));
}
pub fn buttonDownHeld(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_down_held(@intCast(i32, player_id)));
}
pub fn buttonLeftPressed(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_left_pressed(@intCast(i32, player_id)));
}
pub fn buttonLeftReleased(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_left_released(@intCast(i32, player_id)));
}
pub fn buttonLeftHeld(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_left_held(@intCast(i32, player_id)));
}
pub fn buttonRightPressed(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_right_pressed(@intCast(i32, player_id)));
}
pub fn buttonRightReleased(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_right_released(@intCast(i32, player_id)));
}
pub fn buttonRightHeld(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_right_held(@intCast(i32, player_id)));
}
pub fn buttonStartPressed(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_start_pressed(@intCast(i32, player_id)));
}
pub fn buttonStartReleased(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_start_released(@intCast(i32, player_id)));
}
pub fn buttonStartHeld(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_start_held(@intCast(i32, player_id)));
}
pub fn buttonSelectPressed(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_select_pressed(@intCast(i32, player_id)));
}
pub fn buttonSelectReleased(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_select_released(@intCast(i32, player_id)));
}
pub fn buttonSelectHeld(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_select_held(@intCast(i32, player_id)));
}
pub fn buttonLeftShoulderPressed(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_left_shoulder_pressed(@intCast(i32, player_id)));
}
pub fn buttonLeftShoulderReleased(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_left_shoulder_released(@intCast(i32, player_id)));
}
pub fn buttonLeft_shoulder_held(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_left_shoulder_held(@intCast(i32, player_id)));
}
pub fn buttonRightShoulderPressed(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_right_shoulder_pressed(@intCast(i32, player_id)));
}
pub fn buttonRightShoulderReleased(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_right_shoulder_released(@intCast(i32, player_id)));
}
pub fn buttonRight_shoulder_held(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_right_shoulder_held(@intCast(i32, player_id)));
}
pub fn buttonLeftStickPressed(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_left_stick_pressed(@intCast(i32, player_id)));
}
pub fn buttonLeftStickReleased(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_left_stick_released(@intCast(i32, player_id)));
}
pub fn buttonLeftStickHeld(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_left_stick_held(@intCast(i32, player_id)));
}
pub fn buttonRightStickPressed(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_right_stick_pressed(@intCast(i32, player_id)));
}
pub fn buttonRightStickReleased(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_right_stick_released(@intCast(i32, player_id)));
}
pub fn buttonRightStickHeld(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_right_stick_held(@intCast(i32, player_id)));
}
pub fn buttonLeftTriggerPressed(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_left_trigger_pressed(@intCast(i32, player_id)));
}
pub fn buttonLeftTriggerReleased(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_left_trigger_released(@intCast(i32, player_id)));
}
pub fn buttonLeftTriggerHeld(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_left_trigger_held(@intCast(i32, player_id)));
}
pub fn buttonRightRriggerPressed(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_right_trigger_pressed(@intCast(i32, player_id)));
}
pub fn buttonRightTriggerReleased(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_right_trigger_released(@intCast(i32, player_id)));
}
pub fn buttonRightTriggerHeld(player_id: usize) ?bool {
    return i32ToOptionBool(raw.button_right_trigger_held(@intCast(i32, player_id)));
}
pub fn analogLeftX(player_id: usize) ?f32 {
    return f32ToOption(raw.analog_left_x(@intCast(i32, player_id)));
}
pub fn analogLeftY(player_id: usize) ?f32 {
    return f32ToOption(raw.analog_left_y(@intCast(i32, player_id)));
}
pub fn analogRightX(player_id: usize) ?f32 {
    return f32ToOption(raw.analog_right_x(@intCast(i32, player_id)));
}
pub fn analogRightY(player_id: usize) ?f32 {
    return f32ToOption(raw.analog_right_y(@intCast(i32, player_id)));
}
pub fn triggerLeft(player_id: usize) ?f32 {
    return f32ToOption(raw.trigger_left(@intCast(i32, player_id)));
}
pub fn triggerRight(player_id: usize) ?f32 {
    return f32ToOption(raw.trigger_right(@intCast(i32, player_id)));
}
pub fn rawInputState(player_id: usize) ?i64 {
    var val = raw.raw_input_state(@intCast(i32, player_id));
    if (val < 0) {
        return null;
    } else {
        return val;
    }
}

// Multiplayer Api
pub fn numPlayers() usize {
    return @intCast(usize, raw.num_players());
}
pub fn isLocalPlayer(player_id: usize) ?bool {
    return i32ToOptionBool(raw.is_local_player(@intCast(i32, player_id)));
}
pub fn isRemotePlayer(player_id: usize) ?bool {
    return i32ToOptionBool(raw.is_remote_player(@intCast(i32, player_id)));
}

fn f32ToOption(val: f32) ?f32 {
    if (std.math.isFinite(val)) {
        return val;
    } else {
        return null;
    }
}

fn i32ToOptionBool(val: i32) ?bool {
    return switch (val) {
        0 => false,
        1 => true,
        else => null,
    };
}

fn i32ToOptionUsize(val: i32) ?usize {
    if (val < 0) {
        return null;
    } else {
        return @intCast(usize, val);
    }
}
