var _interact_key = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space);

// Open the keypad (or explain why not) when the player is near and presses E
if (!global.room1_unlocked && !entering && instance_exists(char_object)) {
    if (distance_to_object(char_object) < 24 && _interact_key && can_interact()) {
        if (global.has_note || global.held_item == "code_clue") {
            entering = true;
            input = "";
            keyboard_string = "";
            global.input_locked = true;
        } else {
            show_dialogue("The keypad is locked. Find and turn in the note for the passcode first!");
        }
    }
}

// Keypad typing
if (entering) {
    input = string_copy(string_digits(keyboard_string), 1, 4);
    keyboard_string = input;

    if (keyboard_check_pressed(vk_enter) && string_length(input) == 4) {
        if (input == "9012") {
            global.room1_unlocked = true;
            global.held_item = "";
            entering = false;
            global.input_locked = false;

            with (code_clue_obj) {
                persistent = false;
                is_held = false;
                instance_destroy();
            }

            show_dialogue("Door Unlocked!");
            global.spawn_x = 95;
            global.spawn_y = 215;
            room_goto(hall);
        } else {
            msg = "Incorrect passcode!";
            msg_timer = 90;
            input = "";
            keyboard_string = "";
        }
    }

    if (keyboard_check_pressed(vk_escape)) {
        entering = false;
        global.input_locked = false;
    }
}

if (msg_timer > 0) msg_timer--;