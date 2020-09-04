/// @description Sets many important variables
//Setting variables based on input from calling script
name = names[page];
voice = voices[page];
portrait_index = portraits[page];
color_primary = colors[page];

color_secondary		= merge_color(color_primary, c_black, 0.5);
	//Sets dialogue color based on brightness of primary color
if(color_get_value(color_primary) <= 150){
	dialogue_text_color = merge_color(color_primary, c_white, 0.5); 
} else {
	dialogue_text_color = merge_color(color_primary, c_black, 0.5); 
}

//Running some functions to set other variables
//show_debug_message(dialogue_text[page]);
dialogue_text_wrapped = scriptStringWrap(dialogue_text[page], dialogue_text_max_width);

dialogue_str_length = string_length(dialogue_text_wrapped);

counter = 0;