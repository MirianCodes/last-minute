var _w = display_get_gui_width();
var _h = display_get_gui_height();



draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// credits panel: dim the art and show text
if (panel == "credits") {
    draw_set_alpha(0.85);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _w, _h, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_text_ext(_w/2, 450, "CREDITS\n\nProgramming: NAME\nArt: NAME\nDesign: NAME\nSound: NAME", 50, 1400);
}

// buttons
var _labels, _y0;
if (panel == "main") {
    _labels = ["START GAME", "CREDITS"];
    _y0 = btn_y0;
} else {
    _labels = ["BACK"];
    _y0 = 900; //900
}

for (var i = 0; i < array_length(_labels); i++) {
    var _by = _y0 + i * btn_gap;
    var _hov = (i == hover);

    draw_set_alpha(0.8);
    draw_set_color(_hov ? c_dkgray : c_black);
    draw_rectangle(btn_x - btn_w/2, _by - btn_h/2, btn_x + btn_w/2, _by + btn_h/2, false);

    draw_set_alpha(1);
    draw_set_color(_hov ? c_yellow : c_white);
    draw_rectangle(btn_x - btn_w/2, _by - btn_h/2, btn_x + btn_w/2, _by + btn_h/2, true);
    draw_text(btn_x, _by, _labels[i]);
}
// reset drawing state
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);