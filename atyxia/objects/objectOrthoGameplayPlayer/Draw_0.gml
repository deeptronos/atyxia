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
