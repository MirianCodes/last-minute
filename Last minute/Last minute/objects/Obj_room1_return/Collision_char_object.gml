global.spawn_x = 76;
global.spawn_y = 110;

if (instance_exists(other)) {
    other.x = global.spawn_x;
    other.y = global.spawn_y;
    other.hspeed = 0;
    other.vspeed = 0;
}

audio_play_sound(OpenDoor_Sound, 1, false);
room_goto(Room1);