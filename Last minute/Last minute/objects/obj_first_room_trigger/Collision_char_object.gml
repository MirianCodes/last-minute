if (!global.room1_unlocked) {
    if (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space)) {
        var _entered_code = get_string("Enter the door code:", "");
        
        if (_entered_code == "1234") { 
            global.room1_unlocked = true; // Unlocked 
            show_message("Door Unlocked!");
            room_goto(hall);
        } else if (_entered_code != "") {
            show_message("Incorrect passcode!");
        }
    }
    
    // Block player from walking through until unlocked
    with (other) {
        x = xprevious;
        y = yprevious;
    }
} else {
    // Door is unlocked forever
    room_goto(hall);
}