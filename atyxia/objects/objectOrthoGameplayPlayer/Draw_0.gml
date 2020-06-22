/// @description respecting the z-coordinate
// You can write your code in this editor

	//Telling GMS to draw the sprite, just as it would if there were no draw event 
//draw_sprite(sprite_index, image_index, x, y);

headsprite_index = round(((point_direction(x, y, mouse_x, mouse_y))/360) * 24);

//show_debug_message(floor(((point_direction(x, y, mouse_x, mouse_y))/360) * 24));

if(player_moving == true){
	bodysprite_current_animation = animation_walk_loop_sprites;

	bodysprite_current_animation_speed = (body_sprite_animations[0,3] / room_speed);
	
	if(bodysprite_animation_frame < body_sprite_animations[0,2]){
		bodysprite_animation_frame += bodysprite_current_animation_speed;
	}else{
		bodysprite_animation_frame = 0;
	}
	
}else{
	
	bodysprite_current_animation = animation_to_walk_sprites;
	bodysprite_current_animation_speed = 0;
	bodysprite_animation_frame = 0
}

bodysprite = asset_get_index(bodysprite_current_animation[bodysprite_angle]);

//sprite_set_offset(image_index, sprite_get_width(image_index) / 2, sprite_get_height(image_index) );
//draw_sprite_ext(sprite_index, image_index, x, y + z, image_xscale, image_yscale, 0, c_white, image_alpha);

//Draw body sprite scaled to 64x64
draw_sprite_ext(bodysprite, bodysprite_animation_frame, x, y + z , (64/sprite_get_width(bodysprite)), (64/sprite_get_height(bodysprite)),0, c_white, image_alpha);


draw_sprite_ext(headsprite, headsprite_index, x, y + z , 1, 1, 0, c_white, image_alpha);



	//Draws attack sprites, in relation to facing direction/etc
switch(current_attack){
	case "swipe":
		switch(facing){
			case "left":
				draw_sprite_ext(spriteSwipeAttack, 3, hand.x, hand.y, 2, 2, 0, c_white, 1);
				break;
			case "right":
				draw_sprite_ext(spriteSwipeAttack, 1, hand.x, hand.y, 2, 2, 0, c_white, 1);
				break;
		}

		break;
	case "jab":
		break;
}

	//Draw healthbar
if(draw_health == true){
	alarm[1] = 100;
	draw_healthbar(x - sprite_width, y - sprite_height, x + sprite_width,  (y - sprite_height) + 5, hp, c_black, c_red, c_red, 0, true, false);
	draw_set_font(fontSystem12);
	draw_text(x - sprite_width, (y - sprite_height) - 15, "health:");
}

if debug_macro{
	scriptDrawLocationAxis(x, y, sprite_index, 1);
	scriptDrawLocationAxis(hand.x, hand.y, hand.sprite_index, 0);
	draw_set_color(c_green);
	draw_line_width(x, y, hand_x, y, 3);
	draw_set_color(c_blue);
	draw_line_width(x, y, x, y + lengthdir_y(distanceToHand, directionToMouse), 3);
	draw_set_color(c_fuchsia);
	draw_line_width(x, y + lengthdir_y(distanceToHand, directionToMouse), hand_x, y, 3);
}
draw_set_color(c_lime);
draw_circle(x, y, 2, false)