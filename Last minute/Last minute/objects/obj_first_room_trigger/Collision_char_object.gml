//changed to add note into puzzle
if (!variable_global_exists("room1_unlocked")) {
    global.room1_unlocked = false;
}

var _interact_key = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space);

if (!global.room1_unlocked) {
    //keep player from leaving without clue
    with (other) {
        x = xprevious;
        y = yprevious;
    }
    
    if (_interact_key) {
        // Player must collect code_clue_obj first
        if (global.has_note || global.held_item == "code_clue") {
            var _entered_code = get_string("Turn in the note and enter the door code:", "");
            
            if (_entered_code == "1234") { 
                global.room1_unlocked = true;
                
                // Clear held item if holding code_clue
                if (global.held_item == "code_clue") {
                    global.held_item = "";
                }
                
                show_message("Door Unlocked!");
                global.spawn_x = 95; 
                global.spawn_y = 215; 
                room_goto(hall);
            } else if (_entered_code != "") {
                show_message("Incorrect passcode!");
            }
        } 
        else {
            // clue is required before keypad entry
            show_message("The keypad is locked. Find and turn in the note for the passcode first!");
        }
    }
} 
// perm unlock
else {
    global.spawn_x = 95;
    global.spawn_y = 215;
    room_goto(hall);
}