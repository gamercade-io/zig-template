// Raw bindings directly from WASM.

// Audio
pub extern fn play_bgm(bgm_index: i32) void;
pub extern fn play_sfx(sfx_index: i32, channel: i32) void;
pub extern fn stop_bgm() void;
pub extern fn stop_channel(channel: i32) void;
pub extern fn play_note(note_id: i32, instrument_index: i32, channel: i32) void;
pub extern fn play_frequency(frequency: f32, instrument_index: i32, channel: i32) void;

// Data
pub extern fn height() i32;
pub extern fn width() i32;
pub extern fn fps() i32;
pub extern fn frame_time() f32;
pub extern fn sprite_sheet_count() i32;
pub extern fn palette_count() i32;
pub extern fn sprite_height(sprite_sheet: i32) i32;
pub extern fn sprite_width(sprite_sheet: i32) i32;
pub extern fn sprite_count(sprite_sheet: i32) i32;
pub extern fn bgm_length_secs(bgm_index: i32) f32;
pub extern fn bgm_length_frames(bgm_index: i32) i32;
pub extern fn sfx_length_secs(sfx_index: i32) f32;
pub extern fn sfx_length_frames(sfx_index: i32) i32;

// Graphics Params
pub extern fn palette_index(palette_index: i32) i32;
pub extern fn sprite_sheet_index(sprite_sheet_index: i32) i32;
pub extern fn sprite_index(sprite_index: i32) i32;
pub extern fn color_index(color_index: i32) i32;
pub extern fn flip_x(flip_x: i32) i32;
pub extern fn flip_y(flip_y: i32) i32;
pub extern fn graphics_parameters(
    palette_index: i32,
    sprite_sheet_index: i32,
    sprite_index: i32,
    color_index: i32,
    flip_x: i32,
    flip_y: i32,
) i32;

// Draw
pub extern fn clear_screen(graphics_parameters: i32) void;
pub extern fn set_pixel(graphics_parameters: i32, x: i32, y: i32) void;
pub extern fn circle(graphics_parameters: i32, x: i32, y: i32, radius: i32) void;
pub extern fn circle_filled(graphics_parameters: i32, x: i32, y: i32, radius: i32) void;
pub extern fn rect(graphics_parameters: i32, x: i32, y: i32, width: i32, height: i32) void;
pub extern fn rect_filled(graphics_parameters: i32, x: i32, y: i32, width: i32, height: i32) void;
pub extern fn line(graphics_parameters: i32, x0: i32, y0: i32, x1: i32, y1: i32) void;
pub extern fn sprite(graphics_parameters: i32, transparency_mask: i64, x: i32, y: i32) void;

//Text
pub extern fn console_log(text_ptr: [*]const u8, len: usize) void;

// Random
pub extern fn set_seed(seed: i32) void;
pub extern fn random_int_range(min: i32, max: i32) i32;
pub extern fn random_float() f32;
pub extern fn random_float_range(min: f32, max: f32) f32;

// Input
pub extern fn button_a_pressed(player_id: i32) i32;
pub extern fn button_a_released(player_id: i32) i32;
pub extern fn button_a_held(player_id: i32) i32;
pub extern fn button_b_pressed(player_id: i32) i32;
pub extern fn button_b_released(player_id: i32) i32;
pub extern fn button_b_held(player_id: i32) i32;
pub extern fn button_c_pressed(player_id: i32) i32;
pub extern fn button_c_released(player_id: i32) i32;
pub extern fn button_c_held(player_id: i32) i32;
pub extern fn button_d_pressed(player_id: i32) i32;
pub extern fn button_d_released(player_id: i32) i32;
pub extern fn button_d_held(player_id: i32) i32;
pub extern fn button_up_pressed(player_id: i32) i32;
pub extern fn button_up_released(player_id: i32) i32;
pub extern fn button_up_held(player_id: i32) i32;
pub extern fn button_down_pressed(player_id: i32) i32;
pub extern fn button_down_released(player_id: i32) i32;
pub extern fn button_down_held(player_id: i32) i32;
pub extern fn button_left_pressed(player_id: i32) i32;
pub extern fn button_left_released(player_id: i32) i32;
pub extern fn button_left_held(player_id: i32) i32;
pub extern fn button_right_pressed(player_id: i32) i32;
pub extern fn button_right_released(player_id: i32) i32;
pub extern fn button_right_held(player_id: i32) i32;
pub extern fn button_start_pressed(player_id: i32) i32;
pub extern fn button_start_released(player_id: i32) i32;
pub extern fn button_start_held(player_id: i32) i32;
pub extern fn button_select_pressed(player_id: i32) i32;
pub extern fn button_select_released(player_id: i32) i32;
pub extern fn button_select_held(player_id: i32) i32;
pub extern fn button_left_shoulder_pressed(player_id: i32) i32;
pub extern fn button_left_shoulder_released(player_id: i32) i32;
pub extern fn button_left_shoulder_held(player_id: i32) i32;
pub extern fn button_right_shoulder_pressed(player_id: i32) i32;
pub extern fn button_right_shoulder_released(player_id: i32) i32;
pub extern fn button_right_shoulder_held(player_id: i32) i32;
pub extern fn button_left_stick_pressed(player_id: i32) i32;
pub extern fn button_left_stick_released(player_id: i32) i32;
pub extern fn button_left_stick_held(player_id: i32) i32;
pub extern fn button_right_stick_pressed(player_id: i32) i32;
pub extern fn button_right_stick_released(player_id: i32) i32;
pub extern fn button_right_stick_held(player_id: i32) i32;
pub extern fn button_left_trigger_pressed(player_id: i32) i32;
pub extern fn button_left_trigger_released(player_id: i32) i32;
pub extern fn button_left_trigger_held(player_id: i32) i32;
pub extern fn button_right_trigger_pressed(player_id: i32) i32;
pub extern fn button_right_trigger_released(player_id: i32) i32;
pub extern fn button_right_trigger_held(player_id: i32) i32;
pub extern fn analog_left_x(player_id: i32) f32;
pub extern fn analog_left_y(player_id: i32) f32;
pub extern fn analog_right_x(player_id: i32) f32;
pub extern fn analog_right_y(player_id: i32) f32;
pub extern fn trigger_left(player_id: i32) f32;
pub extern fn trigger_right(player_id: i32) f32;
pub extern fn raw_input_state(played_id: i32) i64;

// Multiplayer
pub extern fn num_players() i32;
pub extern fn is_local_player(player_id: i32) i32;
pub extern fn is_remote_player(player_id: i32) i32;
