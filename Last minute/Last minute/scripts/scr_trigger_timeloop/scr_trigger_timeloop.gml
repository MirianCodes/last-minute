function scr_trigger_timeloop() {
    global.player_lives -= 1;
    
    if (global.player_lives > 0) { // reset puzzles + doors + timer
        global.held_item = "";
        global.bathroom_unlocked = false;
        global.monster_door_has_circuit = false;
        global.monster_door_has_battery = false;
        global.loop_timer = 60 * game_get_speed(gamespeed_fps);
        global.spawn_x = 75;
        global.spawn_y = 110;
        room_goto(Room1);
    } else {
        // Jump directly to the lose screen
        if (room_exists(rm_lose)) {
            room_goto(rm_lose);
        }
    }
}