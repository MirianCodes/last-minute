if (global.loop_timer > 0) {
    global.loop_timer -= 1;
    
    // Trigger the script on the exact frame the timer hits 0
    if (global.loop_timer <= 0) {
        scr_trigger_timeloop();
    }
}