function show_dialogue(_lines) {
    if (!is_array(_lines)) _lines = [_lines];   

    var _d;
    if (instance_exists(dialogue_box_obj)) _d = instance_find(dialogue_box_obj, 0);
    else _d = instance_create_depth(0, 0, -10000, dialogue_box_obj);

    _d.lines = _lines;
    _d.index = 0;
    _d.chars = 0;
}

// objects check this before reacting to E, so one key press doesn't do two things
function can_interact() {
    if (!variable_global_exists("dialogue_closed_at")) global.dialogue_closed_at = -1000;
    return !instance_exists(dialogue_box_obj) && (current_time - global.dialogue_closed_at > 250);
}