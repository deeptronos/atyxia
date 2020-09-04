/// @description Setting up dialogue demo code
event_inherited();
image_alpha = sprite_height/255;
portrait_index = 2;
voice = soundCough;
name = "Pyramid";
color_primary = c_fuchsia;

dialogue_text = [
	"I'm broadcasting on a 440hz nega-thought wave. It supercedes the low frequency channels used for intra-chattel coms networks.",
	"Are you sure that will work?",
	"Yes. I have a PhD in radio communications.",
	"Wow! okay :)"
	];
speakers = [id, current_player, id, current_player];

