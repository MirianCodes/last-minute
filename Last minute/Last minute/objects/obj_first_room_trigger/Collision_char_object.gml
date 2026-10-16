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
	audio_play_sound(OpenDoor_Sound, 1, false);
    room_goto(hall);
}