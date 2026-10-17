// fix for monster room(?)
if (!variable_global_exists("spawn_x")) global.spawn_x = -1;
if (!variable_global_exists("spawn_y")) global.spawn_y = -1;
if (!variable_global_exists("input_locked")) global.input_locked = false;

//key tracking 
if (!variable_global_exists("has_exit_key")) {
    global.has_exit_key = false;
}
if (!variable_global_exists("intro_active")) global.intro_active = false;