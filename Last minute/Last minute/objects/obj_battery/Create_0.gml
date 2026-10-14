if (!variable_global_exists("battery_collected")) {
    global.battery_collected = false;
}
if (!variable_global_exists("monster_door_has_battery")) {
    global.monster_door_has_battery = false;
}

// fix for duplicate batteries spawning
if (global.battery_collected || global.monster_door_has_battery) {
    instance_destroy();
    exit;
}