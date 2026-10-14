if (!is_unlocked) {
    if (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space)) {
        var _entered_code = get_string("Enter the door code:", "");
        
        if (_entered_code == "1234") { 
            is_unlocked = true;
            show_message("Door Unlocked!");
            room_goto(hall);
        } else if (_entered_code != "") {
            show_message("Incorrect passcode!");
        }
    }
    
    // 2. Block player from walking through on normal conditions
    with (other) {
        x = xprevious;
        y = yprevious;
    }
} else {
    // gotohall
    room_goto(hall);
}