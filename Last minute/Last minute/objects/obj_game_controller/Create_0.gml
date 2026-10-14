global.held_item = ""; //inventory variable
global.room1_unlocked = false;
global.bathroom_unlocked = false;
if (!variable_global_exists("spawn_x")) { //spawn controller for enter/exit rooms
    global.spawn_x = -1;
    global.spawn_y = -1;
}