global.held_item = "";
global.room1_unlocked = false;
global.bathroom_unlocked = false;

//fixed monster door progress 
if (!variable_global_exists("monster_door_has_circuit")) {
    global.monster_door_has_circuit = false;
}
if (!variable_global_exists("monster_door_has_battery")) {
    global.monster_door_has_battery = false;
}

//note variables 
if (!variable_global_exists("has_note")) {
    global.has_note = false;
}
if (!variable_global_exists("room1_unlocked")) {
    global.room1_unlocked = false;
}

//janitor closet door
if (!variable_global_exists("janitor_unlocked")) {
    global.janitor_unlocked = false;
}

if (!variable_global_exists("spawn_x")) {
    global.spawn_x = -1;
    global.spawn_y = -1;
}

if (!variable_global_exists("player_lives")) {
    global.player_lives = 5;
}

if (!variable_global_exists("loop_timer")) {
    global.loop_timer = 60 * game_get_speed(gamespeed_fps); // 1 minute
}

//background music
audio_master_gain(1.0);
if (!audio_is_playing(snd_background_music)) {
    audio_play_sound(snd_background_music, 10, true);
}