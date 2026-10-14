function scr_trigger_timeloop() {
    global.player_lives -= 1;
    
    if (global.player_lives > 0) {
        global.held_item = "";
        global.bathroom_unlocked = false;
        
        // Reset timer back to 60s and send player back to starting spawn
        global.loop_timer = 60 * game_get_speed(gamespeed_fps);
        global.spawn_x = 75;
        global.spawn_y = 110;
        room_goto(Room1);
    } else {
        game_restart();
    }
}