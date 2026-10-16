if(canShoot and global.held_item == "weapon" )
{
	instance_create_layer(x,y,"Instances", obj_bullet);
	canShoot = false;
	alarm[0] = 5;
}