if (!variable_global_exists("janitor_unlocked")) {
    global.janitor_unlocked = false;
}
if (!variable_global_exists("held_item")) {
    global.held_item = "";
}

var _interact_key = keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_space);

if (!global.janitor_unlocked) {
    //block while locked
    with (other) {
        x = xprevious;
        y = yprevious;
    }
    
    // unlock if holding pass
    if (global.held_item == "janitorpass" || global.held_item == "obj_janitorpass") {
        global.janitor_unlocked = true;
        global.held_item = "";
        
        // destory pass
        with (obj_janitorpass) {
            persistent = false;
            is_held = false;
            instance_destroy();
        }
        
        global.spawn_x = 271; 
        global.spawn_y = 207; 
        room_goto(janitor); 
        exit;
    } 
    // warning when interacted w/o pass
    else if (_interact_key) {
        show_dialogue("Access Denied: Requires Janitor Pass.");
    }
} 
// Perm unlock
else {
    global.spawn_x = 271;
    global.spawn_y = 207;
    room_goto(janitor);
}