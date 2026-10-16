if (!is_dying) {
    hp -= 1;
    hit_timer = 6; // Flash red when hit
    
    if (hp <= 0) {
        is_dying = true; // Fade out
    }
}

// destory bullet 
with (other) {
    instance_destroy();
}