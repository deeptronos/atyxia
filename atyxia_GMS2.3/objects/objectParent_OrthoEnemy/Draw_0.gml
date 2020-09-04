/// @description Insert description here
// You can write your code in this editor
draw_sprite(sprite_index, image_index, x, y);
draw_set_font(fontSystem12);
if(draw_health == true){
	alarm[1] = 100;	//	Set alarm to turn off health drawing 
	draw_healthbar(x - sprite_width, y - sprite_height, x + sprite_width,  (y - sprite_height) + 5, hp, c_black, c_red, c_red, 0, true, false);
	draw_text(x - sprite_width, (y - sprite_height) - 15, "health:");
}

if(draw_info == true){
	var info = string(object_get_name(object_index)) + "\nx: " + string(x) + "\ny: " + string(y) + "\nhp: " + string(hp);
	draw_circle_color(x, y, 2, c_gray, c_gray, false);
	draw_set_valign(fa_middle);
	draw_text_transformed(x - sprite_width, y, info, .5, 1, 0);
	draw_set_valign(fa_top);
}