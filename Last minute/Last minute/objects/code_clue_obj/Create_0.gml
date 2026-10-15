if (!variable_global_exists("room1_unlocked")) {
    global.room1_unlocked = false;
}

// Destroy if room1 is already unlocked
if (global.room1_unlocked) {
    instance_destroy();
    exit;
}

// Destroy if player is currently holding it across room transitions
if (variable_global_exists("held_item") && global.held_item == "code_clue") {
    instance_destroy();
    exit;
}

is_held = false;