global.held_item = "";
global.room1_unlocked = false;
global.bathroom_unlocked = false;

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