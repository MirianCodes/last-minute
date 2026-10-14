if (!global.bathroom_unlocked) {
    // if player is holding knob, automatically unlock door
    if (global.held_item == "doorknob") {
        global.bathroom_unlocked = true;
        global.held_item = ""; // Clear inventory
        
        // get rid of knob sprite
        if (instance_exists(obj_knob)) {
            instance_destroy(obj_knob);
        }
        
        show_message("You attached the doorknob! The bathroom is unlocked.");
        room_goto(bathroom); 
    } 
    // CASE 2: Player arrives without the knob show message
    else {
        with (other) {
            x = xprevious;
            y = yprevious;
        }
        show_message("Door is missing knob.");
    }
} 
// if already unlocked, just walk in
else {
    room_goto(bathroom);
}