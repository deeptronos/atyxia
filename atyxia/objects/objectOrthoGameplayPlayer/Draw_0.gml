/// @description Insert description here
// You can write your code in this editor

//Telling GMS to draw the sprite, just as it would if there were no draw event 
draw_sprite(sprite_index, image_index, x, y);



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