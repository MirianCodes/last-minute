if (!variable_global_exists("bathroom_unlocked")) {
    global.bathroom_unlocked = false;
}
if (!variable_global_exists("held_item")) {
    global.held_item = "";
}

if (!global.bathroom_unlocked) {
    // if holding knob, go to bathroom
    if (global.held_item == "doorknob") {
        global.bathroom_unlocked = true;
        global.held_item = "";
        
        if (instance_exists(obj_knob)) {
            instance_destroy(obj_knob);
        }
        
        show_message("You attached the doorknob! The bathroom is unlocked.");
        room_goto(bathroom);
    } 
  //if no knob
    else {
        with (other) {
            x = xprevious;
            y = yprevious;
        }
        
        if (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space)) {
            show_message("Door is missing knob.");
        }
    }
} 
// perm unlock
else {
    room_goto(bathroom);
}