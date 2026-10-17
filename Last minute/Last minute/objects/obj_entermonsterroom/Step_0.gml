if (place_meeting(x, y, char_object)) {
    
    // deposit battery 
	if (!global.monster_door_has_battery && global.held_item == "battery") {
	    global.monster_door_has_battery = true;
	    global.held_item = "";
	    global.battery_collected = true; // Prevents respawning
    
	    // Destroy all battery instances
	    with (obj_battery) {
	        instance_destroy();
	    }
    
	    show_dialogue("Deposited Battery!");
		if(!global.monster_door_has_circuit)
		{
			show_dialogue("Circuit still needed.");
		}
	    exit;
	}
    
    // deposit circuit
    if (!global.monster_door_has_circuit && global.held_item == "circuit") {
        global.monster_door_has_circuit = true;
        global.held_item = "";
        
        // Remove floating circuit from player
        if (variable_global_exists("obj_circuit") && instance_exists(obj_circuit)) {
            instance_destroy(obj_circuit);
        }
        
        show_dialogue("Deposited Circuit!");
		if(!global.monster_door_has_battery)
		{
			show_dialogue("Battery still needed.");
		}
        exit;
    }
    
    // entering requires battery and circuit
    if (global.monster_door_has_circuit && global.monster_door_has_battery) {
        if (keyboard_check_pressed(ord("E"))) {
            if (global.held_item != "weapon") {
                show_dialogue("WARNING: You hear growling ahead... You might need a weapon!");
            }
			global.spawn_x = 235; 
            global.spawn_y = 255;
            room_goto(Room4);
            exit;
        }
    }
}