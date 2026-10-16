//cleared dialogue to hopefully fix endless loop 
if (!variable_global_exists("monster_door_has_battery")) global.monster_door_has_battery = false;
if (!variable_global_exists("monster_door_has_circuit")) global.monster_door_has_circuit = false;

// deposit battery
if (!global.monster_door_has_battery && global.held_item == "battery") {
    global.monster_door_has_battery = true;
    global.held_item = "";
    global.battery_collected = false;

    with (obj_battery) {
        instance_destroy();
    }
}

// deposit circuit
if (!global.monster_door_has_circuit && (global.held_item == "circuit" || global.held_item == "obj_circuit")) {
    global.monster_door_has_circuit = true;
    global.held_item = "";

    with (obj_circuit) {
        instance_destroy();
    }
}

// entry
if (global.monster_door_has_battery && global.monster_door_has_circuit) {
    global.spawn_x = 240;
    global.spawn_y = 220;

    other.x = global.spawn_x;
    other.y = global.spawn_y;
    other.hspeed = 0;
    other.vspeed = 0;

    room_goto(Room4);
    exit;
}