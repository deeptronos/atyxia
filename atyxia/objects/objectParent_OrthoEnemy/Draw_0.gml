/// @description Insert description here
// You can write your code in this editor
draw_sprite(sprite_index, image_index, x, y);

if(draw_health == true){
	alarm[1] = 100;	//	Set alarm to turn off health drawing 
	draw_healthbar(x - sprite_width, y - sprite_height, x + sprite_width,  (y - sprite_height) + 5, hp, c_black, c_red, c_red, 0, true, false);
	draw_set_font(fontSystem12);
	draw_text(x - sprite_width, (y - sprite_height) - 15, "health:");
}