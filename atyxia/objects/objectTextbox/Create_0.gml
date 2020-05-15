/// @description Set up dialogue GUI variables

	//Scales these values (860 px of 960 px total game width, 120 px of 540 px total game height) to be consistant with actual GUI size 
box_width			= (860/global.gameWidth) * display_get_gui_width();
box_height			= (135/global.gameHeight) * display_get_gui_height();
box_round_radius	= 5;

box_x = (display_get_gui_width() - box_width)/2;
box_y = (display_get_gui_height() - box_height);


portraitSprite	= spriteDialoguePortraits;
portrait_scale = box_height/sprite_get_height(portraitSprite);
portrait_width	= sprite_get_width(portraitSprite) * portrait_scale;
portrait_height = sprite_get_height(portraitSprite) * portrait_scale;
	//portrait_offset_scale_factor is used to offset the portrait from the dialogue box for stylization
portrait_offset_scale_factor = ((display_get_gui_height() * 0.98) - portrait_height) / box_y;
portrait_x = box_x / (portrait_offset_scale_factor * global.gameAspect);
portrait_y = box_y * portrait_offset_scale_factor;
//show_debug_message(string((portrait_offset_scale_factor * global.gameAspect)));

namebox_width	= portrait_width;
namebox_height	=  20;
namebox_x		= portrait_x;
namebox_y		= portrait_y - namebox_height;

portrait_index = 1;

color_primary = c_silver;
color_secondary = merge_color(color_primary, c_black, 0.5);
dialogue_text_color = c_white;
name_text_color = c_lime;
font = fontCrisp12NoAA;
draw_set_font(font);

//Dialogue drawing 
counter = 0;
voice = soundCough;
pause = false;

x_buffer = 12;
y_buffer = 8;
dialogue_text_x = box_x + portrait_width + x_buffer;
dialogue_text_y = box_y + y_buffer;
name_text_x = namebox_x + (namebox_width/2);
name_text_y = namebox_y + (namebox_height/2);
name_text_angle = 0;
dialogue_text_max_width = box_width - portrait_width - (2*x_buffer);
dialogue_text_height = string_height("M");

dialogue_text[0] = "Always on the run! Facial recognition, pandemonium. Insulated for the cameras! Formulated free in ???? Its a million trolls and a million guns A trillion dead with their red eyes up All we have shown is the cellphones???";
dialogue_text[1] = " fuck";
dialogue_text[2] = "this is a string?? this is a string?? this is a string?? this is a string?? this is a string?? this is a string?? this is a string?? this is a string?? this is a string?? this is a string?? this is a string?? this is a string?? this is a string??";

//dialogue_text[0] = "I fall\nA panic shrieking in a static sky\nPerfect for a swan dive\nTerminal velocity for a breakneck suicide";
//dialogue_text[1] = "There are ways that keep me out of here\nSerrated blades I keep my atmosphere\nMy brain escapes a wasted death\nAm I safe? I will hold my breath";
page = 0;
dialogue_interact_key = interact_key;	
name = "Skrillex";

event_perform(ev_other, ev_user1);

