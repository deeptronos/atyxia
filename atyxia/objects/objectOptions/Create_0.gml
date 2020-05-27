/// @description Insert description here
// You can write your code in this editor
var options_menu = instance_create_layer(x, y, "instancesUIObjects", objectSelectionMenu);
with(options_menu){
	current_camera = objectSystemScreenCamera;
	choices = ["Credits", "Return"];
	choice_actions = [scriptGoToCredits, scriptGoToTitle];
	menu_x = room_width/2;
	menu_y = room_height/2;
	descendant = true;

}

title_color = c_white;
subtitle_color = merge_color(title_color, c_black, 0.5);
highlight_color = c_white;

title_font = fontPoynterOldstyleText;
draw_set_font(title_font);
title_x = room_width/2;
title_y = 100;

title = "Options";
title = scriptStringWiden(title, 0);
title_counter = 1;
title_length = string_length(title);
drawn_title = title;
title_width = string_width(title);
title_height = string_height(title);
