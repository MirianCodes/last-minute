
var move_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
var move_up   = keyboard_check(vk_up)    || keyboard_check(ord("W"));

// Calculate vertical speed multiplier
var v_speed = move_down - move_up;

var move_speed = 1; 
y += v_speed * move_speed;


sprite_index = character; 

if (v_speed != 0) {

    image_speed = 1; 
} else {
  
    image_speed = 0;  
    image_index = 0; 
}


