if (global.has_exit_key) {
    if (audio_exists(OpenDoor_Sound)) {
        audio_play_sound(OpenDoor_Sound, 1, false);
    }
    
    // Uncomment this once rm_win room is created:
    // room_goto(rm_win);
}