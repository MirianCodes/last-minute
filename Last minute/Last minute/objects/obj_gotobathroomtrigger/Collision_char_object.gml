if (!variable_global_exists("bathroom_unlocked")) {
    global.bathroom_unlocked = false;
}
if (!variable_global_exists("held_item")) {
    global.held_item = "";
}

if (!global.bathroom_unlocked) {
    //removed message to save time
    if (global.held_item == "doorknob") {
        global.bathroom_unlocked = true;
        global.held_item = "";
        
        // Destroy knob when open
        with (obj_knob) {
            persistent = false;
            is_held = false;
            instance_destroy();
        }
        
        global.spawn_x = 237; 
        global.spawn_y = 212; 
        room_goto(bathroom);
        exit;
    } 
    // block player from entering w/no knob
    else {
        with (other) {
            x = xprevious;
            y = yprevious;
        }
        
        if (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space)) {
            show_dialogue("Door is missing a knob.");
        }
    }
} 
// perm unlock
else {
    global.spawn_x = 237; 
    global.spawn_y = 212;
    room_goto(bathroom);
}