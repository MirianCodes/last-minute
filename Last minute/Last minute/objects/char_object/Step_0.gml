//// 1. GET MOVEMENT INPUT
var move_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var move_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var move_up    = keyboard_check(vk_up)    || keyboard_check(ord("W"));
var move_down  = keyboard_check(vk_down)  || keyboard_check(ord("S"));

var h_speed = move_right - move_left;
var v_speed = move_down - move_up;

var move_speed = 1; 

//// 2. HORIZONTAL MOVEMENT & WALL COLLISION
var _move_x = h_speed * move_speed;

if (_move_x != 0) {
    if (!place_meeting(x + _move_x, y, obj_wall)) {
        x += _move_x;
    } else {
        while (!place_meeting(x + sign(_move_x), y, obj_wall)) {
            x += sign(_move_x);
        }
    }
}

//// 3. VERTICAL MOVEMENT & WALL COLLISION
var _move_y = v_speed * move_speed;

if (_move_y != 0) {
    if (!place_meeting(x, y + _move_y, obj_wall)) {
        y += _move_y;
    } else {
        while (!place_meeting(x, y + sign(_move_y), obj_wall)) {
            y += sign(_move_y);
        }
    }
}

//// 4. ANIMATION LOGIC
if (h_speed != 0 || v_speed != 0) {
  image_speed = 1;
   
    if (h_speed != 0) {
        sprite_index = char_sidewalk;
        image_xscale = h_speed * -1; 
    } 
    else if (v_speed > 0) {
        sprite_index = char_frontwalk;
       image_xscale = 1; 
    } 
    else if (v_speed < 0) {
        sprite_index = char_backward;
       image_xscale = 1;
    }
} else {
	image_speed = 0;
    image_index = 0; 
}

move_and_collide(h_speed * move_speed ,v_speed * move_speed,gurney_obj);
//Testing
