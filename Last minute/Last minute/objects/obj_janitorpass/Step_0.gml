// If room is unlocked while holding or present, destroy immediately
if (variable_global_exists("janitor_unlocked") && global.janitor_unlocked) {
    instance_destroy();
    exit;
}

if (!variable_global_exists("held_item")) {
    global.held_item = "";
}

if (instance_exists(char_object)) {
    var _clicked = mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id) && player_near(32);


    persistent = is_held;

    if (is_held) {
        x = char_object.x + 28;
        y = char_object.y + 2;
        depth = char_object.depth - 10;
        
        // When held, position tracking is active.
        // fix being stuck at door
    } 
    else {
        depth = char_object.depth + 10;
        if (_clicked) {
            if (global.held_item == "") {
                is_held = true;
                global.held_item = "janitorpass";
            } else {
                show_dialogue(["Your hands are full!"]);
            }
        }
    }
}