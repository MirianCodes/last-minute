var _w = display_get_gui_width();
var _h = display_get_gui_height();
var _shown = string_copy(lines[index], 1, chars);



draw_sprite_stretched(dialogue_box, 0, 100, _h - 240, _w - 200, 200);

draw_text_ext(140, _h - 215, _shown, 40, _w - 280);

if (chars >= string_length(lines[index])) {
    draw_text(_w - 260, _h - 90, "[E] continue");
}