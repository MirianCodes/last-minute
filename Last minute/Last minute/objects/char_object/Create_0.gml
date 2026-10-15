if (variable_global_exists("spawn_x") && global.spawn_x != -1) {
    x = global.spawn_x;
    y = global.spawn_y;
    
    // Reset spawn targets so it won't override future spawns fix
    global.spawn_x = -1;
    global.spawn_y = -1;
}
if (!variable_global_exists("input_locked")) global.input_locked = false