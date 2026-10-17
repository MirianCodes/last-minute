
// Start dragging only if the player is close to the gurney
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id) && player_near(48)) {
    is_dragging = true;
    drag_offset_x = x - mouse_x;
    drag_offset_y = y - mouse_y;
}

if (is_dragging) {
    // Let go if the mouse is released or the player walks away
    if (!mouse_check_button(mb_left) || !player_near(64)) {
        is_dragging = false;
    }
    else {
        var _target_x = mouse_x + drag_offset_x;
        var _target_y = mouse_y + drag_offset_y;

        // Move only if the new spot is free of walls and the player
        if (!place_meeting(_target_x, y, obj_wall) && !place_meeting(_target_x, y, char_object)) {
            x = _target_x;
        }
        if (!place_meeting(x, _target_y, obj_wall) && !place_meeting(x, _target_y, char_object)) {
            y = _target_y;
        }
    }
}