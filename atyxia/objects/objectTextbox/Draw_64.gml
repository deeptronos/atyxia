/// @description Draws dialogue GUI

	//Sets "resolution" of circle/rounded things to be fairly low
draw_set_circle_precision(8);

//Draw box
	//draws main filled-in box
draw_roundrect_color_ext(box_x, box_y, (box_x + box_width), (box_y + box_height), box_round_radius, box_round_radius, color_primary, color_primary, false);

draw_roundrect_color_ext(box_x, box_y, (box_x + portrait_width), (box_y + portrait_height), box_round_radius, box_round_radius, merge_color(color_primary, c_black, 0.25), merge_color(color_primary, c_black, 0.25), false);

//Draw portrait back
	//draws filled in box
draw_roundrect_color_ext(portrait_x, portrait_y, (portrait_x + portrait_width), (portrait_y +portrait_height), box_round_radius, box_round_radius,  merge_color(color_secondary, c_black, 0.5),  merge_color(color_secondary, c_black, 0.5), false);

//Draw portrait
draw_sprite_stretched(portraitSprite, portrait_index, portrait_x, portrait_y, portrait_width, portrait_height);

//Draw portrait frame
	//Draws outline around portrait
//draw_roundrect_color_ext(portrait_x, portrait_y, (portrait_x + portrait_width), (portrait_y + portrait_height), box_round_radius, box_round_radius, c_aqua, c_aqua, 10);
scriptDrawRoundRectThickOutline(portrait_x, portrait_y, (portrait_x + portrait_width), (portrait_y + portrait_height), box_round_radius, box_round_radius, color_secondary, 5, 0);

//Draw namebox
draw_roundrect_color_ext(namebox_x, namebox_y, (namebox_x + namebox_width), (namebox_y + namebox_height), box_round_radius, box_round_radius, color_primary, color_primary, false)

//---TEXT
//Draw Name
draw_set_halign(fa_center); draw_set_valign(fa_middle);
gpu_set_blendmode_ext(bm_dest_alpha, bm_subtract);
draw_text_transformed_color(name_text_x, name_text_y, name, 1.5, 1.5, name_text_angle, color_secondary, color_secondary, color_secondary, color_secondary, 1);
gpu_set_blendmode(bm_normal);
	//Reset alignment after we're done drawing
draw_set_halign(fa_left); draw_set_valign(fa_top);

//Draw Dialogue Text

if(!pause and counter < dialogue_str_length){
	counter++;
	if(counter mod 4 == 0){
		audio_play_sound(voice, 10, false);
	}
	switch(string_char_at(dialogue_text_wrapped, counter)){
		case ",": 
			pause = true;
			alarm[1] = 15;
			break;
		case ".": 
		case "?": 
		case "!": 
			pause = true;
			alarm[1] = 30;
			break;
	}
	
}

dialogue_substring = string_copy(dialogue_text_wrapped, 1, counter);

	//a little shadow for us....
draw_text_transformed_color(dialogue_text_x, dialogue_text_y + 1, dialogue_substring, 1, 1, 0, merge_color(dialogue_text_color, c_black, 0.5), merge_color(dialogue_text_color, c_black, 0.5), merge_color(dialogue_text_color, c_black, 0.5), merge_color(dialogue_text_color, c_black, 0.5), 1);

draw_text_color(dialogue_text_x, dialogue_text_y, dialogue_substring, dialogue_text_color, dialogue_text_color, dialogue_text_color, dialogue_text_color, 1);
	
//Draw dialogue outline
scriptDrawRoundRectThickOutline(dialogue_text_x - x_buffer, dialogue_text_y - y_buffer, (dialogue_text_x + dialogue_text_max_width) + x_buffer, (box_y + box_height) + y_buffer, box_round_radius, box_round_radius, color_secondary, 5, 1);