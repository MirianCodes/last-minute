if(global.held_item == "weapon" and canShoot)
{
	instance_create_layer(x,y,"Instances", obj_bullet);
	canShoot = false;
	alarm[0] = 10;
}