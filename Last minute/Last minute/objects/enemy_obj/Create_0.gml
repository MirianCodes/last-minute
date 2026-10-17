run_speed = 0.5;
hp = 2;
hit_timer = 0;
is_dying = false;

//for cheat code 
if (variable_global_exists("enemy_defeated") && global.enemy_defeated) {
    instance_create_layer(x, y, layer, obj_exit_key);
    instance_destroy();
    exit;
}