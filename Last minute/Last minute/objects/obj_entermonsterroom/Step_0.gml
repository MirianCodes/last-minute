if (place_meeting(x, y, char_object) && keyboard_check_pressed(ord("E"))) {
    
    //Deposit Circuit
    if (!global.monster_door_has_circuit && global.held_item == "circuit") {
        global.monster_door_has_circuit = true;
        global.held_item = ""; 
        show_debug_message("Circuit deposited.");
        exit;
    }
    
    // deposit battery
    if (!global.monster_door_has_battery && global.held_item == "battery") {
        global.monster_door_has_battery = true;
        global.held_item = ""; 
        show_debug_message("Battery deposited.");
        exit;
    }
    
    // both deposited, weapon warning
    if (global.monster_door_has_circuit && global.monster_door_has_battery) {
        if (global.held_item != "weapon") {
            show_message("WARNING: You hear growling ahead... You might need a weapon!");
        }
        
        global.spawn_x = 100;
        global.spawn_y = 150;
        room_goto(room_monster);
        exit;
    }
    
    //requirements
    var _msg = "Locked. Requirements:";
    _msg += "\n- Circuit: " + (global.monster_door_has_circuit ? "Installed" : "Missing");
    _msg += "\n- Battery: " + (global.monster_door_has_battery ? "Installed" : "Missing");
    show_message(_msg);
}