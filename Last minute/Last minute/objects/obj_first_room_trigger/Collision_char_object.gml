if (!global.room1_unlocked) {
    // Solid while locked
    with (other) {
        x = xprevious;
        y = yprevious;
    }
} else {
    // Perm unlock
    global.spawn_x = 95;
    global.spawn_y = 215;
    room_goto(hall);
}