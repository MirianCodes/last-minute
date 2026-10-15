//added so player is forced to find the note first, fix doorknob clipping
var _clicked = mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id);

if (_clicked) {
    if (global.held_item == "") {
        global.has_note = true;
        global.held_item = "code_clue";
        show_message("You picked up a note! It reads: Passcode is 1234");
        instance_destroy();
    } else {
        show_message("Your hands are full!");
    }
}