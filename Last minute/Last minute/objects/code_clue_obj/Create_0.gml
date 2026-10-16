if (!variable_global_exists("room1_unlocked")) global.room1_unlocked = false;
if (!variable_global_exists("held_item")) global.held_item = "";
if (!variable_global_exists("has_note")) global.has_note = false;

// Destroy if room1 is already unlocked
if (global.room1_unlocked) {
    instance_destroy();
    exit;
}

// Destroy this copy if the player is already carrying the note
// (the persistent copy that followed them is the real one)
if (global.held_item == "code_clue") {
    instance_destroy();
    exit;
}

is_held = false;