if (global.loop_timer > 0) {
    global.loop_timer -= 1;
} else {
    // 60 seconds triggers time loop
    scr_trigger_timeloop();
}