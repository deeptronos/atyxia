//This script basically just does collision detecting!

var spd = argument0;
var dir = argument1;

var xTarget = x + lengthdir_x(spd, dir);
	//Divide y move speed to enhance ortho perspectiv effects
var yTarget = y + (lengthdir_y(spd, dir)/2);

//Accounts for solids being in our direction of movement. If they arent, we can move!
if place_free(xTarget, yTarget){
	x = xTarget;
	y = yTarget;
} 
	//If place isn't free...
else {
	//Give us 10 degree increments to work with
	var collide = instance_place(xTarget, yTarget, all);
	
	
	if(variable_instance_exists(collide, "contact_damage")){
		var back_dir = point_direction(x, y, collide.x, collide.y);
		xTarget = x + lengthdir_x(-150, back_dir);
		yTarget = y + lengthdir_y(-150, back_dir)
		x = xTarget;
		y = yTarget;
		objectOrthoGameplayPlayer.hp -= collide.contact_damage;
		
	} else {

		var sweep_interval = 10;
		//Checks, in sweep_interval Intervals (ie, 10 degree intervals), if the place we are attempting to go is available or not. Goes up to 80 degrees.
		for (var angle = sweep_interval; angle <= 80; angle += sweep_interval){
			for (var multiplier = -1; multiplier <= 1; multiplier += 2){
				var angle_to_check = dir + angle * multiplier;
			
				xTarget = x + lengthdir_x(spd, angle_to_check);
				yTarget = y + lengthdir_y(spd, angle_to_check);
			
				if place_free(xTarget, yTarget){
					x = xTarget;
					y = yTarget;
					exit;
				}
			}
		}
	}
}