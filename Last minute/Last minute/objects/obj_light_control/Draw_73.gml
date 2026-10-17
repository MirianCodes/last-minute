if (!variable_instance_exists(id, "surf")) {
    surf = -1;
}

if (!surface_exists(surf)) {
    surf = surface_create(room_width, room_height);
}

// darkness on surface
surface_set_target(surf);
draw_clear_alpha(c_black, 0.90); // 0.90 for darker background

// light circle
if (instance_exists(char_object)) {
    gpu_set_blendmode(bm_subtract);
    
    // bright inner
    draw_circle_color(char_object.x, char_object.y, 50, c_white, c_white, false);
    
    // Soft blend
    draw_circle_color(char_object.x, char_object.y, 75, c_white, c_black, false);
    
    gpu_set_blendmode(bm_normal);
}

// darkness over room
surface_reset_target();
draw_surface(surf, 0, 0);