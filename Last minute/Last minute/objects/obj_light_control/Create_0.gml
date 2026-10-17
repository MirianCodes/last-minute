radius = 350;
darkness = 0.93;
light_surf = -1;

if (!variable_global_exists("intro_done")) global.intro_done = false;
if (!variable_global_exists("intro_active")) global.intro_active = false;

cur_radius = radius;
intro_wait = 0;