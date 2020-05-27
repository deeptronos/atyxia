/// @description Draw menu
// You can write your code in this editor

var cam_targ = cam_target_object;
with(current_camera){
	follow = cam_targ;
}

draw_set_font(fontTrajanPro3_24_AA);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(color_primary);
var v_choice_margin = string_height(choices[0]) * 2;

if shaders //only apply shader if the macro is enabled
{
    shader_set(shader);
    shader_set_uniform_f(upos,0.5,0.51);//x,y
}

	//Draws highlight behind selected choice
var h = 0;
repeat(array_length_1d(choices)){
	
	var current_y = menu_y + (v_choice_margin * h);
	var current_x = menu_x;
	
	if(current_choice == h){
		draw_set_alpha(0.5);
		draw_set_color(color_highlights);
		draw_text_transformed(menu_x, current_y, choices[h], 4, 1, 0);
		draw_set_color(color_primary);
		draw_set_alpha(1);
		with(cam_target_object){
			y = current_y;
			x = current_x;
		}
	}

	h++;
}

	//Turns off blur shader
shader_reset();

	//Draws text of all choices:
var i = 0;
repeat(array_length_1d(choices)){
	var current_y = menu_y + (v_choice_margin * i);
	draw_text(menu_x, current_y, choices[i]);
	
	i++;
}

	//Draws lines above/below choices:
for(var j = 0; j < i; j++){
	
	var current_y = (menu_y + (v_choice_margin * j)) + (v_choice_margin / 2) ;
	draw_line(menu_x - 25, current_y, menu_x + 25, current_y);		
	current_y = (menu_y + (v_choice_margin * j)) - (v_choice_margin / 2);
	draw_line(menu_x - 25, current_y, menu_x + 25, current_y);		
	
}




//Resetting to default alignments, so that other draw steps aren't messed up
draw_set_halign(fa_left);
draw_set_valign(fa_top);