/// @description Insert description here
// You can write your code in this editor

var damager_move_speed_this_frame = damagerSpeed * global.seconds_passed;

if(counter <= lifetime){
	xTarget = x + lengthdir_x(damager_move_speed_this_frame, dir);
	yTarget = y + lengthdir_y(damager_move_speed_this_frame, dir);
	
	x = xTarget;
	y = yTarget;
	
	counter++;
} else {
	instance_destroy();
}