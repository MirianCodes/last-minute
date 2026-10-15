if (!variable_global_exists("held_item")) {
    global.held_item = "";
}

if (instance_exists(char_object)) {
    var _interact_key = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space);
    var _clicked = mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id);

    persistent = is_held;

    if (is_held) {
        x = char_object.x + 16;
        y = char_object.y - 12;
        depth = char_object.depth - 1;
        
        // Drop note on E/ Space (if not touching exit trigger)
        if (_interact_key) {
            if (!place_meeting(x, y, obj_first_room_trigger)) {
                is_held = false;
                global.held_item = "";
                persistent = false;
                x = char_object.x;
                y = char_object.y + 10;
            }
        }
    } 
    else {
        depth = char_object.depth + 10;
        if (_clicked) {
            if (global.held_item == "") {
                is_held = true;
                global.has_note = true;
                global.held_item = "code_clue";
                show_message("You picked up a note! It reads: Passcode is 1234");
            } else {
                show_message("Your hands are full!");
            }
        }
    }
}