///@description Create Textbox
///@arg text
///@arg speakers

var textbox = instance_create_layer(0, 0, "Dialogue", objectTextbox);

with(textbox){

	dialogue_text = argument0;
	speakers = argument1;
	
	var len = array_length_1d(dialogue_text);
	var i = 0;
	repeat(len){
		
		names[i]		= speakers[i].name;
		portraits[i]	= speakers[i].portrait_index;
		voices[i]		= speakers[i].voice;
		colors[i]		= speakers[i].color_primary;
		
		i++;

	}
	
	event_perform(ev_other, ev_user1);	
	
}

return textbox;