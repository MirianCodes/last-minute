if (global.intro_active) {
    cur_radius = 0;
    intro_wait++;

    // dialogue finished, so start the reveal
    if (intro_wait > 10 && !instance_exists(dialogue_box_obj)) {
        global.intro_active = false;
        global.intro_done = true;
    }
}
else {
  
    cur_radius = lerp(cur_radius, radius, 0.05);
}