/// @description Set up dialogue GUI variables


//Non-constant variables (ie things that are unique to the object speaking)

color_primary		= c_lime;
color_secondary		= merge_color(color_primary, c_black, 0.5);
	//Sets dialogue color based on brightness of primary color
if(color_get_value(color_primary) <= 150){
	dialogue_text_color = merge_color(color_primary, c_white, 0.75); 
} else {
	dialogue_text_color = merge_color(color_primary, c_black, 0.5); 
}


voice			= soundDialogueBlip;
portrait_index	= 1;

name				= "";
dialogue_text[0]	= "";
page				= 0;
font				= fontCrisp12NoAA;

	//Scales these values (860 px of 960 px total game width, 120 px of 540 px total game height) to be consistant with actual GUI size 
box_width			= (860/global.gameWidth) * display_get_gui_width();
box_height			= (135/global.gameHeight) * display_get_gui_height();
box_round_radius	= 5;

box_x = (display_get_gui_width() - box_width)/2;
box_y = (display_get_gui_height() - box_height);


portraitSprite	= spriteDialoguePortraits;
portrait_scale	= box_height/sprite_get_height(portraitSprite);
portrait_width	= sprite_get_width(portraitSprite) * portrait_scale;
portrait_height = sprite_get_height(portraitSprite) * portrait_scale;
	//portrait_offset_scale_factor is used to offset the portrait from the dialogue box for stylization
portrait_offset_scale_factor	= ((display_get_gui_height() * 0.98) - portrait_height) / box_y;
portrait_x						= box_x / (portrait_offset_scale_factor * global.gameAspect);
portrait_y						= box_y * portrait_offset_scale_factor;

namebox_width	= portrait_width;
namebox_height	=  20;
namebox_x		= portrait_x;
namebox_y		= portrait_y - namebox_height;



//Dialogue drawing 
counter = 0;

pause = false;

x_buffer = 12;
y_buffer = 8;
dialogue_text_x = box_x + portrait_width + x_buffer;
dialogue_text_y = box_y + y_buffer;
name_text_x = namebox_x + (namebox_width/2);
name_text_y = namebox_y + (namebox_height/2);
name_text_angle = 0;
dialogue_text_max_width = box_width - portrait_width - (2*x_buffer);
dialogue_text_height	= string_height("M");

dialogue_interact_key = interact_key;	


	//Things that need to happen after contextual variables are set:
draw_set_font(font);
