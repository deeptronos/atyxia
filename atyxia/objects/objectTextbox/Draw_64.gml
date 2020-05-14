/// @description Draws dialogue GUI

	//Sets "resolution" of circle/rounded things to be fairly low
draw_set_circle_precision(8);

//Draw box
	//draws main filled-in box
draw_roundrect_color_ext(box_x, box_y, (box_x + box_width), (box_y + box_height), box_round_radius, box_round_radius, color_primary, color_primary, false);

//Draw portrait back
	//draws filled in box
draw_roundrect_color_ext(portrait_x, portrait_y, (portrait_x + portrait_width), (portrait_y +portrait_height), box_round_radius, box_round_radius, color_secondary, color_secondary, false);

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
draw_text_transformed_color(name_text_x, name_text_y, name, 1.5, 1.5, name_text_angle, name_text_color, name_text_color, name_text_color, name_text_color, 1);

	//Reset alignment after we're done drawing
draw_set_halign(fa_left); draw_set_valign(fa_top);

//Draw Dialogue Text
draw_text_ext_color(dialogue_text_x, dialogue_text_y, dialogue_text, dialogue_text_height, dialogue_text_max_width, dialogue_text_color, dialogue_text_color, dialogue_text_color, dialogue_text_color, 1);
//Draw dialogue outline
scriptDrawRoundRectThickOutline(dialogue_text_x - x_buffer, dialogue_text_y - y_buffer, (dialogue_text_x + dialogue_text_max_width) + x_buffer, (box_y + box_height) + y_buffer, box_round_radius, box_round_radius, color_secondary, 5, 1);