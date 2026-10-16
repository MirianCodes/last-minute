var _labels, _y0;
if (panel == "main") {
    _labels = ["START GAME", "CREDITS"];
    _y0 = btn_y0;
} else {
    _labels = ["BACK"];
    _y0 = 900;
}

// mouse position in GUI coordinates
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

hover = -1;
for (var i = 0; i < array_length(_labels); i++) {
    var _by = _y0 + i * btn_gap;
   if (point_in_rectangle(_mx, _my, btn_x - btn_w/2, _by - btn_h/2, btn_x + btn_w/2, _by + btn_h/2)) {
    hover = i;
    }
}

// clicks
if (mouse_check_button_pressed(mb_left) && hover != -1) {
    if (panel == "main") {
        if (hover == 0) room_goto(Room1);
        if (hover == 1) panel = "credits";
    } else {
        panel = "main";
    }
}

// keyboard shortcuts
if (panel == "main" && keyboard_check_pressed(vk_enter)) room_goto(Room1);
if (panel == "credits" && keyboard_check_pressed(vk_escape)) panel = "main";