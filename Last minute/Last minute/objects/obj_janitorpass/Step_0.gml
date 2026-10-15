// If room is unlocked while holding or present, destroy immediately
if (variable_global_exists("janitor_unlocked") && global.janitor_unlocked) {
    instance_destroy();
    exit;
}

if (!variable_global_exists("held_item")) {
    global.held_item = "";
}

if (instance_exists(char_object)) {
    var _interact_key = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space);
    var _clicked = mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id);

    persistent = is_held;

    if (is_held) {
        x = char_object.x + 28;
        y = char_object.y + 2;
        depth = char_object.depth - 10;
        
        // Drop
        if (_interact_key) {
            if (!place_meeting(x, y, obj_janitor_entrance_trigger)) {
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
                global.held_item = "janitorpass";
            } else {
                show_message("Your hands are full!");
            }
        }
    }
}