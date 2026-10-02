

//// 1. GET MOVEMENT INPUT
var move_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var move_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var move_up    = keyboard_check(vk_up)    || keyboard_check(ord("W"));
var move_down  = keyboard_check(vk_down)  || keyboard_check(ord("S"));

var h_speed = move_right - move_left;
var v_speed = move_down - move_up;

// Move the player
var move_speed = 1; 


if (h_speed != 0 || v_speed != 0) {
    image_speed = 1; // Play the animation frames
    

if (h_speed != 0) {
    sprite_index = char_sidewalk;
    
    image_xscale = h_speed * -1; 
} 

    
    else if (v_speed > 0) {
        sprite_index = char_frontwalk; // Walking down
        image_xscale = 1; 
    } 
    else if (v_speed < 0) {
        sprite_index = char_frontwalk; // Walking up
        image_xscale = 1;
    }
} else {
 
    image_speed = 0;
    image_index = 0; 
}

move_and_collide(h_speed * move_speed ,v_speed * move_speed,gurney_obj);

