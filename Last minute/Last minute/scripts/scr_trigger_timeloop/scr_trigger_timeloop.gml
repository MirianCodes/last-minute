function scr_trigger_timeloop() {
    global.player_lives -= 1;
    
    if (global.player_lives > 0) { // reset puzzles + doors + timer
		with(code_clue_obj){
			persistent = false;
			is_held = false;
		}
		with(gun_obj){
			persistent = false;
			is_held = false;
		}
		with(obj_battery){
			persistent = false;
			is_held = false;
		}
		with(obj_circuit){
			persistent = false;
			is_held = false;
		}
		with(obj_janitorpass){
			persistent = false;
			is_held = false;
		}
		with(obj_knob){
			persistent = false;
			is_held = false;
		}
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