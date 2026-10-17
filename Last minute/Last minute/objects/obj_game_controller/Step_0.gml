if (global.loop_timer > 0) {
    global.loop_timer -= 1;
    
    // Trigger loop script on the exact frame timer hits 0
    if (global.loop_timer <= 0) {
        scr_trigger_timeloop();
    }
}

// --- 2. DEVELOPER CHEAT CODES ---
if (keyboard_check(vk_control)) {
    
    // CTRL + R: Full Game Restart (Resets all state & returns to title screen)
    if (keyboard_check_pressed(ord("R"))) {
        game_restart(); 
    }
    
    // CTRL + L: Add 1 Extra Life
    if (keyboard_check_pressed(ord("L"))) {
        global.player_lives += 1;
    }
    
    // CTRL + O: Unlock all puzzle doors & override room triggers
    if (keyboard_check_pressed(ord("O"))) {
        global.room1_unlocked = true;
        global.bathroom_unlocked = true;
        global.janitor_unlocked = true; 
        global.has_exit_key = true;
        global.has_note = true;
        global.monster_door_has_circuit = true;
        global.monster_door_has_battery = true;
        
        // Immediate room transition if player is near room 1 keypad trigger
        if (instance_exists(obj_first_room_trigger) && instance_exists(char_object)) {
            with (obj_first_room_trigger) {
                if (distance_to_object(char_object) < 24) {
                    global.spawn_x = 95;
                    global.spawn_y = 215;
                    room_goto(hall);
                }
            }
        }
    }
    
    // CTRL + T: Add 1 Minute to loop timer
    if (keyboard_check_pressed(ord("T"))) {
        global.loop_timer += 60 * game_get_speed(gamespeed_fps);
    }
}