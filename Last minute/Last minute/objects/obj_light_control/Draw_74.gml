if (room == title || room == rm_win || room == rm_lose) exit;
if (!instance_exists(char_object)) exit;

var _gw = display_get_gui_width();
var _gh = display_get_gui_height();

if (!surface_exists(light_surf)) light_surf = surface_create(_gw, _gh);

// player position converted to GUI coordinates
var _cam = view_camera[0];
var _vx = camera_get_view_x(_cam);
var _vy = camera_get_view_y(_cam);
var _vw = camera_get_view_width(_cam);
var _vh = camera_get_view_height(_cam);
if (_vw <= 0) { _vx = 0; _vy = 0; _vw = room_width; _vh = room_height; }

var _px = (char_object.x - _vx) * (_gw / _vw);
var _py = (char_object.y - _vy) * (_gh / _vh) - 20;   // -20 lifts the light toward the body

surface_set_target(light_surf);
draw_clear_alpha(c_black, darkness);

gpu_set_blendmode(bm_subtract);
draw_set_color(c_white);
var _steps = 18;
var _r0 = radius + random_range(-2, 2);   // slight flicker
for (var i = 0; i < _steps; i++) {
    draw_set_alpha(0.16);
    draw_circle(_px, _py, _r0 * (_steps - i) / _steps, false);
}
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);

surface_reset_target();
draw_surface(light_surf, 0, 0);