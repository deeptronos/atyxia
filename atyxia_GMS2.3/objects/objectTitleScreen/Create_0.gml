/// @description Insert description here
// You can write your code in this editor

title_color = c_white;
subtitle_color = merge_color(title_color, c_black, 0.5);
highlight_color = c_white;

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

subtitle = "dreams of digital demise a.I";
subtitle = scriptStringWiden(subtitle, 0);
subtitle_counter = 0;
subtitle_length = string_length(subtitle);
drawn_subtitle = "";

subtitle_width = string_width(subtitle);
subtitle_x_scale = title_width / subtitle_width;

	//For the shader:
upos = shader_get_uniform(shader,"pos");//uniform for x,y