//updated so note wont dissapear unless code is put in.
if (!variable_global_exists("room1_unlocked")) {
    global.room1_unlocked = false;
}

var _interact_key = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space);

if (!global.room1_unlocked) {
    // Solid while locked
    with (other) {
        x = xprevious;
        y = yprevious;
    }
    
    if (_interact_key) {
        // Player must have note
        if (global.has_note || global.held_item == "code_clue") {
            var _entered_code = get_string("Turn in the note and enter the door code:", "");
            
            if (_entered_code == "1234") { 
                global.room1_unlocked = true;
                global.held_item = "";
                
                // Destroy the note only upon unlocking door
                with (code_clue_obj) {
                    persistent = false;
                    is_held = false;
                    instance_destroy();
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
            show_message("The keypad is locked. Find and turn in the note for the passcode first!");
        }
    }
} 
// Perm unlock
else {
    global.spawn_x = 95; 
    global.spawn_y = 215; 
    room_goto(hall);
}