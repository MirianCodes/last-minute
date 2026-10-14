if (!variable_global_exists("held_item")) {
    global.held_item = "";
}
if (instance_exists(char_object)) {
    var _interact_key = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space);
    var _clicked = mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id);
    var _dist = point_distance(x, y, char_object.x, char_object.y);
 
    persistent = is_held; //fixed to room 1
    if (is_held) {
        // Hover beside player 
        x = char_object.x + 28;
        y = char_object.y +2 ;
        depth = char_object.depth - 10;
        
        // 2. Press E or Space to drop item at
        if (_interact_key) {
            is_held = false;
            global.held_item = "";
            x = char_object.x; // Drop at player location
            y = char_object.y + 10;
        }
    } 
    else {
		depth = char_object.depth + 10; // fixed depth
        // Left click while near item to pick up
        if (_clicked) {
            if (_dist < 50) {
                if (global.held_item == "") {
                    is_held = true;
                    global.held_item = "doorknob";
                    show_message("Picked up Doorknob!");
                } else {
                    show_message("Your hands are full! (Holding: " + global.held_item + ")");
                }
            } else {
                show_message("Get closer to pick that up!");
            }
        }
    }
}