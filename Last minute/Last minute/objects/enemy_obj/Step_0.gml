//flash red when hit
if (hit_timer > 0) {
    hit_timer--;
    image_blend = c_red;
} else {
    image_blend = c_white;
}

// fade out upon death
if (is_dying) {
    image_alpha -= 0.05;
    if (image_alpha <= 0) {
        instance_destroy();
    }
    exit; 
}

// chase player when in room
if (instance_exists(char_object)) {
    //move around walls
    mp_potential_step(char_object.x, char_object.y, run_speed, false);
}