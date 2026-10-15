// test for clipping

if (global.held_item != "battery") {
    persistent = false; 
    if (mouse_check_button_pressed(mb_left)) {
        if (position_meeting(mouse_x, mouse_y, id)) {
            if (global.held_item == "") {
                global.held_item = "battery";
                global.battery_collected = true;
            } else {
                show_message("Your hands are full!");
            }
        }
    }
}

else if (global.held_item == "battery") {
    persistent = true; // Follow player only while held
    
    // Float beside player
    if (instance_exists(char_object)) {
        x = char_object.x + 16;
        y = char_object.y - 12;
        depth = char_object.depth - 1;
    }
    
    // Drop on E press
    if (keyboard_check_pressed(ord("E"))) {
        global.held_item = "";
        global.battery_collected = false;
        persistent = false; // Stop following across rooms when dropped
        
        if (instance_exists(char_object)) {
            x = char_object.x;
            y = char_object.y;
        }
    }
}