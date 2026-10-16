var _text = lines[index];
var _len = string_length(_text);

if (chars < _len) chars += 1;   // typewriter effect

if (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space)) {
    if (chars < _len) {
        chars = _len;                 // first press: finish the line
    } else {
        index++;                      // second press: next line
        chars = 0;
        if (index >= array_length(lines)) {
            global.dialogue_closed_at = current_time;
            instance_destroy();       // box disappears
        }
    }
}