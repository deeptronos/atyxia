/// @description Insert description here
// You can write your code in this editor

if (debug_macro	!= true){
	window_set_cursor(noone);
}

move_speed = default_player_move_speed;



//Each input represents a 90 degree increment - W is 90 (up), A is 180 degrees (left), S is 270 degrees (down), D is 0 degrees (right)
movement_input[0] = ord("D");
movement_input[1] = ord("W");
movement_input[2] = ord("A");
movement_input[3] = ord("S");

combat_input_primary = mb_left;

//Hotline Miami-like aiming/crosshair behavior (uses objectOrthoGameplayCrosshair, too)

	//camera_zoom UNUSED as its only use it to lock the mouse position, 
	//	but we're just locking the cursor position so things don't get fucky
//camera_zoom = (view_wport[0] / view_hport[0]);
camera_x = view_xport[0];
camera_y = view_yport[0];

crosshairMaxDistance = 180;

directionToMouse	= point_direction(x, y, mouse_x, mouse_y);
distanceToMouse		= point_distance(x, y, mouse_x, mouse_y);
	//Limits the maximum distance our crosshair can be from the player
distanceToCrosshair = min(point_distance(x, y, mouse_x, mouse_y), crosshairMaxDistance);

cross_x = x + lengthdir_x(distanceToCrosshair, directionToMouse);
cross_y = y + lengthdir_y(distanceToCrosshair, directionToMouse);

cross = instance_create_layer(cross_x, cross_y, "instancesUIObjects", objectOrthoGameplayCrosshair);



//Held Item code
handMaxDistance = 65;
distanceToHand	= min(point_distance(x, y, mouse_x, mouse_y), handMaxDistance);


hand_x = x + lengthdir_x(distanceToHand, directionToMouse);
hand_y = y + lengthdir_y(distanceToHand, directionToMouse);

hand = instance_create_layer(hand_x, hand_y, "Instances", objectOrthoGameplayPlayerHeldItem);

//Dialogue Set-up Code
portrait_index = 1;
voice = soundDialogueBlip;
name = "You";
color_primary = c_aqua;

interact_radius = 16;
active_textbox = noone;
can_move = true;
