if (!variable_global_exists("room1_unlocked")) {
    global.room1_unlocked = false;
}

if (!global.room1_unlocked) {

    if (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space)) {
        var _entered_code = get_string("Enter the door code:", "");
        
        if (_entered_code == "1234") { 
            global.room1_unlocked = true;
            show_message("Door Unlocked!");
            room_goto(hall); 
        } else if (_entered_code != "") {
            show_message("Incorrect passcode!");
        }
    }
//block until unlocked
    with (other) {
        x = xprevious;
        y = yprevious;
    }
} else {
    // perm unlock
    room_goto(hall);
}