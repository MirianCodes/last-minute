if (!variable_global_exists("held_item")) {
    global.held_item = "";
}

if (instance_exists(char_object)) {
    var _interact_key = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space);
    var _clicked = mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id);

    persistent = is_held;

    if (is_held) {
        // Hover beside player
        x = char_object.x + 28;
        y = char_object.y + 2;
        depth = char_object.depth - 10;
        
        // Drop 
        if (_interact_key) {
            is_held = false;
            global.held_item = "";
            x = char_object.x;
            y = char_object.y + 10;
        }
    } 
    else {
        depth = char_object.depth + 10;
        
        // removed distance requirement
        if (_clicked) {
            if (global.held_item == "") {
                is_held = true;
                global.held_item = "circuit";
                global.circuit_collected = true;
            }
        }
    }
}