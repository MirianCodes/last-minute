image_alpha = 0;
if (!variable_global_exists("room1_unlocked")) global.room1_unlocked = false;
if (!variable_global_exists("has_note")) global.has_note = false;
if (!variable_global_exists("held_item")) global.held_item = "";
if (!variable_global_exists("input_locked")) global.input_locked = false;

entering = false;
input = "";
msg = "";
msg_timer = 0;