/// @description 
// You can write your code in this editor

input_interact = keyboard_check_pressed(interact_key);

//Smooth movement stuf
global.seconds_passed = delta_time/1000000;
var move_speed_this_frame = 0;

if(player_can_control == true){
	move_speed_this_frame = move_speed * global.seconds_passed;
}
//show_debug_message(string(global.seconds_passed));
var move_xinput = 0;
var move_yinput = 0;

for (var i = 0; i < array_length_1d(movement_input); i++){
	var this_key = movement_input[i];
	if keyboard_check(this_key){
		
		var this_angle = i*90;
		move_xinput += lengthdir_x(1, this_angle);
		move_yinput += lengthdir_y(1, this_angle);
	}
}	

var moving = (point_distance(0, 0, move_xinput, move_yinput) > 0);

if moving {
	var move_dir = point_direction(0, 0, move_xinput, move_yinput);
	//x += lengthdir_x(move_speed_this_frame, move_dir);
	//y += lengthdir_y(move_speed_this_frame, move_dir);
	//Uses a single custom script for movement, and allows us to check for solids 
	scriptOrthoGameplayPlayerMove(move_speed_this_frame, move_dir);
	
		//Update body sprite direction only on movement
			//Base body sprite direction on actual movement direction, not cursor direction
	bodysprite_angle = (move_dir /360) * 24;
	
	player_moving = true;
}else{
	player_moving = false;
}

if keyboard_check(spacebar){
	z++;
}
if keyboard_check(ord("C")){
	z--;
}

//Hotline Miami-like aiming/crosshair behavior stuff (Uses objectOrthoGameplayCrosshair)
camera_x = view_xport[0];
camera_y = view_yport[0];

directionToMouse = point_direction(x, y, mouse_x, mouse_y);
distanceToMouse = point_distance(x, y, mouse_x, mouse_y);
	//Limits the maximum distance our crosshair can be from the player
distanceToCrosshair = min(point_distance(x, y, mouse_x, mouse_y), crosshairMaxDistance);

cross_x = x + lengthdir_x(distanceToCrosshair, directionToMouse);
cross_y = y + lengthdir_y(distanceToCrosshair, directionToMouse);

if (distanceToMouse > crosshairMaxDistance){
	//window_mouse_set((cross_x - camera_x) * camera_zoom, (cross_y - camera_y) * camera_zoom);
}

cross.x = cross_x;
cross.y = cross_y;


//Held Item Code
distanceToHand = min(point_distance(x, y, mouse_x, mouse_y), handMaxDistance);

hand_x = x + lengthdir_x(distanceToHand, directionToMouse);
//Divided by two so as to limit vertical movement of hand to give orthographic perspective effect
hand_y = y + (lengthdir_y(distanceToHand, directionToMouse)/2);

hand.x = hand_x;
hand.y = hand_y;

//Points hand in appropriate direction relative to player
if(lengthdir_x(distanceToHand, directionToMouse) < 0){
	hand.image_angle	= radtodeg(cos(min((lengthdir_y(distanceToHand, directionToMouse)/distanceToHand), 1)));
	hand.image_xscale	= -1;
	facing				= "left";
}else{
	hand.image_angle	= (radtodeg(cos(min((lengthdir_y(distanceToHand, directionToMouse)/distanceToHand), 1))) * -1);
	hand.image_xscale	= 1;
	facing				= "right";
}

scriptOrthoGameplayPlayerHandAiming();	

//Objects

	//Textbox
if(input_interact){
	
	if(active_textbox == noone){

			//Gets instance within collision area
		var inst = collision_rectangle(x - interact_radius, y - interact_radius, x + interact_radius, y + interact_radius, objectParent_OrthoNPC, false, false);
	
		if(inst != noone){
				//player cannot move
			
			with(inst){
				var tbox = scriptCreateTextbox(dialogue_text, speakers);
				can_move = false;
			}
			active_textbox = tbox;
			player_can_control = false;
		}
	} else {
		if(!instance_exists(active_textbox)){
			active_textbox = noone;
			player_can_control = true;
		}
	}
	
}

	//Combat System

if(player_can_control == true){
			//LMouse Button Attack
	if(mouse_check_button_pressed(combat_input_primary)){
		scriptFireDamagerProjectile(hand.x, hand.y, mouse_x, mouse_y, 100, 550, 8, 3, 1);
		current_attack = attacks[1];
		alarm[0] = 10;
	}		//RMouse Button Attacks
	else if(mouse_check_button_pressed(combat_input_secondary)){
		scriptFireDamagerProjectile(hand.x, hand.y, mouse_x, mouse_y, 100, 550, 5, 1, 3);
	}
	
}


if(hp <= 0){
	//with(objectOrthoGameControl){
		event_perform(ev_other, ev_user0);
	//}
}

//Room Restart:
if(keyboard_check_pressed(ord("R")))	{
	room_goto(room);
}

depth = clamp(z, -100, 99);	//	clamp to [99 to -100] range to stay within depth region z-tilting shader is applied to!