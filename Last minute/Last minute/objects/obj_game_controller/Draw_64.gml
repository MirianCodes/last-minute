draw_set_alpha(1.0);

var _gui_width = display_get_gui_width();
var _center_x = _gui_width / 2;

//Time Calculations
var _seconds_left = ceil(global.loop_timer / game_get_speed(gamespeed_fps));
var _minutes = floor(_seconds_left / 60);
var _seconds = _seconds_left mod 60;

var _sec_str = string(_seconds);
if (_seconds < 10) { _sec_str = "0" + _sec_str; }
var _time_text = "Time Left: " + string(_minutes) + ":" + _sec_str;

// fixed overlapping
var _heart_scale = 3.5;   
var _heart_spacing = 40;  
var _total_hearts_width = (global.player_lives - 1) * _heart_spacing;
var _start_x = _center_x - (_total_hearts_width / 2);

// draw hearts
for (var i = 0; i < global.player_lives; i++) {
    draw_sprite_ext(spr_lives, 0, _start_x + (i * _heart_spacing), 30, _heart_scale, _heart_scale, 0, c_white, 1);
}

// 4. Flashing Red Timer Text (<10 Seconds Remaining)
if (_seconds_left <= 10) {
    if ((current_time div 250) mod 2 == 0) {
        draw_set_color(c_red);
    } else {
        draw_set_color(c_white);
    }
} else {
    draw_set_color(c_white);
}

draw_set_halign(fa_center);
draw_set_valign(fa_top);

// fixed heard sizing
draw_text_transformed(_center_x, 70, _time_text, 3, 3, 0);
draw_set_color(c_white);
draw_set_halign(fa_left);