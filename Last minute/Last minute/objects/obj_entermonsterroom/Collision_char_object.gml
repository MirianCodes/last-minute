if (!variable_global_exists("monster_door_has_battery")) global.monster_door_has_battery = false;
if (!variable_global_exists("monster_door_has_circuit")) global.monster_door_has_circuit = false;

var _interact_key = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space);
var _dialogue_open = variable_global_exists("dialogue_active") && global.dialogue_active;

// deposit battery
if (!global.monster_door_has_battery && global.held_item == "battery") {
    global.monster_door_has_battery = true;
    global.held_item = "";
    global.battery_collected = true;

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
    show_debug_message("--- ENTERING ROOM 4 NOW ---");

    global.spawn_x = 240;
    global.spawn_y = 220;

    other.x = global.spawn_x;
    other.y = global.spawn_y;
    other.hspeed = 0;
    other.vspeed = 0;

    room_goto(Room4);
    exit;
}

// dialogue
if (_dialogue_open) exit;

if (_interact_key && global.held_item != "") {
    show_dialogue(["That doesn't go here!"]);
    exit;
}

if (_interact_key) {
    if (!global.monster_door_has_battery && !global.monster_door_has_circuit) {
        show_dialogue(["The door is unpowered.", "Needed items: Battery and Circuit."]);
    } 
    else if (!global.monster_door_has_battery) {
        show_dialogue(["Circuit installed.", "Still needed: Battery."]);
    } 
    else if (!global.monster_door_has_circuit) {
        show_dialogue(["Battery installed.", "Still needed: Circuit."]);
    }
}

