//drag when clicked
if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        is_dragging = true;
        drag_offset_x = x - mouse_x;
        drag_offset_y = y - mouse_y;
    }
}

//drag follows mouse
if (is_dragging) {
    x = mouse_x + drag_offset_x;
    y = mouse_y + drag_offset_y;
    // Stop dragging on mouse release
    if (mouse_check_button_released(mb_left)) {
        is_dragging = false;
    }
}