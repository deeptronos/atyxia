/// @description
// You can write your code in this editor

if (debug_macro	!= true){
	window_set_cursor(noone);
}

move_speed = default_player_move_speed;
	//Used for animation (ie, play moving frames if moving, etc)
player_moving = false;

hp = default_player_hp;

facing = "none"; 
//Each input represents a 90 degree increment - W is 90 (up), A is 180 degrees (left), S is 270 degrees (down), D is 0 degrees (right)
movement_input[0] = player_right;
movement_input[1] = player_up;
movement_input[2] = player_left;
movement_input[3] = player_down;

combat_input_primary	= primary_player_attack;
combat_input_secondary	= secondary_player_attack;

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

//Setting up default player sprites
headsprite							= spriteOrtho3DPlayerTest_head;
headsprite_index					= 0;

bodysprite			= spriteOrtho3DPlayerTest_body_still;
body_sprite_group	= "groupOrtho3DPlayerTest_RiggedAnimations";
bodysprite_angle	= 0;
bodysprite_current_animation = noone;
bodysprite_current_animation_speed = 0;
	//An object's different animations are assigned in a 2D array
		//"Coordinate" A is the name of the group which the different sprites of the animation are stored in.
		//"Coordinate" B is the textutre group of the animation (string)
		//"Coordinate" C is the length of the animation in frames (int)
		//"Coordinate" D is the FPS of the animation (int)
body_sprite_animations[0,0] = "group_walk_loop";
body_sprite_animations[0,1] = "texturegroup_walk_loop";
body_sprite_animations[0,2] = 19;
body_sprite_animations[0,3] = 30;

body_sprite_animations[1,0] = "group_to_walk";
body_sprite_animations[1,1] = "texturegroup_to_walk";
body_sprite_animations[1,2] = 5;
body_sprite_animations[1,3] = 20;

	//Each sprite resource in an animation sprite group is stored in a texturegroup just for that animation,
		//which means we can get all the sprites in that animation sprite group from the texturegroup!
animation_walk_loop_sprites_array	= texturegroup_get_sprites(body_sprite_animations[0,1]);
animation_walk_loop_sprites			= [];
animation_to_walk_sprites_array		= texturegroup_get_sprites(body_sprite_animations[1,1]);
animation_to_walk_sprites			= [];
show_debug_message(sprite_get_name(animation_walk_loop_sprites_array[0]));
	//Storing the name of each sprite resource(ie, a group of frames rendered at a specific angle)
		//in an array so that they can be accessed easier
		
for(var i = 0; i < array_length_1d(animation_walk_loop_sprites_array); i++;){
	sprite_set_offset(animation_walk_loop_sprites_array[i], (sprite_get_width(animation_walk_loop_sprites_array[i]) / 2), (sprite_get_height(animation_walk_loop_sprites_array[i]) / 2));
	animation_walk_loop_sprites[i] = sprite_get_name(animation_walk_loop_sprites_array[i]);
}
for(var i = 0; i < array_length_1d(animation_to_walk_sprites_array); i++;){
	sprite_set_offset(animation_to_walk_sprites_array[i], (sprite_get_width(animation_to_walk_sprites_array[i]) / 2), (sprite_get_height(animation_to_walk_sprites_array[i]) / 2));
	animation_to_walk_sprites[i] = sprite_get_name(animation_to_walk_sprites_array[i]);
	//show_debug_message(i);
	//show_debug_message(animation_to_walk_sprites[i]);
}

show_debug_message(array_length_1d(animation_to_walk_sprites));
bodysprite_index			= 0;
bodysprite_animation_frame	= 0;

perspectiveReferenceSprite			= spriteOrtho3DPlayerTest_reference;
perspectiveReferenceSprite_index	= 0;

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

interact_radius = 64;
active_textbox = noone;
player_can_control = true;

//Attack Set Up Code
attacks = ["none", "swipe", "jab"];
current_attack = attacks[0];

draw_health = false;