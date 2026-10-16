if (hit_timer > 0) {
    hit_timer--;
    image_blend = c_red;
} else {
    image_blend = c_white;
}

// fade out when dying and spawn key
if (is_dying) {
    image_alpha -= 0.05;
    if (image_alpha <= 0) {
        instance_create_layer(x, y, layer, obj_exit_key);
        instance_destroy();
    }
    exit; 
}

//Chase player
if (instance_exists(char_object) && hit_timer <= 0) {
    mp_potential_step(char_object.x, char_object.y, run_speed, false);
}