// Grab gurney when left-clicked
if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        is_dragging = true;
        drag_offset_x = x - mouse_x;
        drag_offset_y = y - mouse_y;
    }
}

// 2. Move gurney with mouse while holding
if (is_dragging) {
    var _target_x = mouse_x + drag_offset_x;
    var _target_y = mouse_y + drag_offset_y;
    
    // Only move horizontally if free of walls
    if (!place_meeting(_target_x, y, obj_wall)) {
        x = _target_x;
    }
    
    // Only move vertically if free of walls
    if (!place_meeting(x, _target_y, obj_wall)) {
        y = _target_y;
    }
    
    // Release gurney when left click is released
    if (mouse_check_button_released(mb_left)) {
        is_dragging = false;
    }
}