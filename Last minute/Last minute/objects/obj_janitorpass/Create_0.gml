if (!variable_global_exists("janitor_unlocked")) {
    global.janitor_unlocked = false;
}

// if unlocked, dont spawn pass.
if (global.janitor_unlocked) {
    instance_destroy();
    exit;
}

// If already held, across room transition destroy any copies
if (variable_global_exists("held_item") && (global.held_item == "janitorpass" || global.held_item == "obj_janitorpass")) {
    instance_destroy();
    exit;
}

is_held = false;