
if (global.loop_timer > 0) {
    global.loop_timer -= 1;
    
    // Trigger time loop on the exact frame timer hits 0
    if (global.loop_timer <= 0) {
        scr_trigger_timeloop();
    }
}

// cheat codes
if (keyboard_check(vk_control)) {
    
    // CTRL + R: Full Game Restart (Back to title screen/start)
    if (keyboard_check_pressed(ord("R"))) {
		global.room1_unlocked = false;
		global.janitor_unlocked = false;
        game_restart(); 
    }
    
    // CTRL + L: Add 1 Extra Life
    if (keyboard_check_pressed(ord("L"))) {
        global.player_lives += 1;
    }
    
    // CTRL + O: Open/Unlock all puzzle doors
    if (keyboard_check_pressed(ord("O"))) {
        global.room1_unlocked = true;
        global.bathroom_unlocked = true;
        global.janitor_unlocked = true;
        global.has_exit_key = true;
        global.has_note = true;
        global.monster_door_has_circuit = true;
        global.monster_door_has_battery = true;
        
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
    
    // CTRL + T: Add 1 minute to timer
    if (keyboard_check_pressed(ord("T"))) {
        global.loop_timer += 60 * game_get_speed(gamespeed_fps);
    }

    // CTRL + K: Kill active enemy globally and prepare key spawn
    if (keyboard_check_pressed(ord("K"))) {
        global.enemy_defeated = true;
        
        // If enemy is currently in this room, kill it instantly and spawn the key
        if (instance_exists(enemy_obj)) {
            with (enemy_obj) {
                instance_create_layer(x, y, layer, obj_exit_key);
                instance_destroy();
            }
        }
    }
}