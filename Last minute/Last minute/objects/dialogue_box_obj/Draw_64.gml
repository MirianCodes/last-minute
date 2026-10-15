var _w = display_get_gui_width();
var _h = display_get_gui_height();
var _shown = string_copy(lines[index], 1, chars);

draw_set_color(c_white);

draw_sprite_stretched(dialogue_box, 0, 100, _h - 240, _w - 200, 200);

// making text more readable
var _scale = 1.8; 
draw_text_ext_transformed(
    140, 
    _h - 210, 
    _shown, 
    25,                      
    (_w - 280) / _scale,      
    _scale,                 
    _scale,                 
    0                        
);
//fixed so continue button isnt cropped
if (chars >= string_length(lines[index])) {
    draw_text_transformed(_w - 380, _h - 100, "[E] continue", _scale, _scale, 0);
}