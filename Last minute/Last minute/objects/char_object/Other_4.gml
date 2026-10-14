if (!variable_global_exists("spawn_x")) {
    global.spawn_x = -1;
    global.spawn_y = -1;
}
if (global.spawn_x != -1) {
    x = global.spawn_x;
    y = global.spawn_y;
    global.spawn_x = -1;
    global.spawn_y = -1;
}