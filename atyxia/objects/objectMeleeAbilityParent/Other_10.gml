/// @description Collision checking code

//	Doing alternative form of collision checking ( not using scriptFireDamagerProjectile() ) for melee
var _list		= ds_list_create();	//	create a list to store collided objects in
var collisions	= collision_circle_list(ability_x, ability_y, ability_rad, targ, false, true, _list, true);	//	check in area defined by  circle for collisions, and put them in _list if there are any
if collisions > 0{
	var i = 0;
	repeat(collisions){
		show_debug_message("collision: " +string( _list[|i]));
		var _col = _list[|i];
		with(_col){
			scriptTakeDamage(other.damage_dealt);
		}
		i++;
	}
	alarm[0] = 1;
}else{
	alarm[0] = 15;
}

