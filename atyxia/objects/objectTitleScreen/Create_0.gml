/// @description Insert description here
// You can write your code in this editor
var start_menu = instance_create_layer(x, y, "instancesUIObjects", objectSelectionMenu);
with(start_menu){
	current_camera = objectSystemScreenCamera;
	choices = ["Play", "Options", "Leave"];
	choice_actions = [scriptGoToFirstRoom, undefined, scriptExitGame];
	menu_x = room_width/2;
	menu_y = room_height/2;
}

title_color = c_red;
title_font = fontPoynterOldstyleText;
draw_set_font(title_font);
title_x = room_width/2;
title_y = 100;

title = "Atyxia, Wake Up!";
title = scriptStringWiden(title, 0);
title_counter = 1;
title_length = string_length(title);
drawn_title = "";

title_width = string_width(title);
title_height = string_height(title);

subtitle = "dreams of digital demise act I";
subtitle = scriptStringWiden(subtitle, 0);
subtitle_counter = 0;
subtitle_length = string_length(subtitle);
drawn_subtitle = "";

subtitle_width = string_width(subtitle);
subtitle_x_scale = title_width / subtitle_width;

	//For the shader:
upos = shader_get_uniform(shader,"pos");//uniform for x,y