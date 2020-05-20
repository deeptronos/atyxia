/// @description Insert description here
// You can write your code in this editor

var damager_move_speed_this_frame = damagerSpeed * global.seconds_passed;

DamagerXTarget = x + lengthdir_x(damager_move_speed_this_frame, dir);
DamagerYTarget = y + lengthdir_y(damager_move_speed_this_frame, dir);

if(counter <= lifetime){
	
	if(place_free(DamagerXTarget, DamagerYTarget)){
	
		x = DamagerXTarget;
		y = DamagerYTarget;
	

		
	} else {
		var collide = instance_place(DamagerXTarget, DamagerYTarget, all);
	
		var my_damage = damage;
		with(collide){
			if(variable_instance_exists(collide, "hp")){
				hp -= my_damage;
		//		draw
			}
		}
		instance_destroy();
	}
	
	counter++;
	
} else {
	instance_destroy();
}

if(place_meeting(x, y, all)){
	//show_debug_message(string(object_get_name(other)));
}