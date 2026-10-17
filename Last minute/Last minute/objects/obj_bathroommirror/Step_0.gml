// Start dragging only if the player is close to the mirror
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id) && player_near(64)) {
    is_dragging = true;
    drag_offset_x = x - mouse_x;
    drag_offset_y = y - mouse_y;
}

if (is_dragging) {
    // Let go when the mouse is released or the player walks away
    if (!mouse_check_button(mb_left) || !player_near(80)) {
        is_dragging = false;
    }
    else {
        x = mouse_x + drag_offset_x;
        y = mouse_y + drag_offset_y;
    }
}