if (entering) {
    var _w = display_get_gui_width();
    var _h = display_get_gui_height();

    draw_set_alpha(0.85);
    draw_set_color(c_black);
    draw_rectangle(_w/2 - 300, _h/2 - 100, _w/2 + 300, _h/2 + 100, false);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_rectangle(_w/2 - 300, _h/2 - 100, _w/2 + 300, _h/2 + 100, true);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(_w/2, _h/2 - 50, "Enter the door code (Enter = confirm, Esc = cancel)");
    draw_text(_w/2, _h/2, input + "_");
    if (msg_timer > 0) draw_text(_w/2, _h/2 + 50, msg);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}