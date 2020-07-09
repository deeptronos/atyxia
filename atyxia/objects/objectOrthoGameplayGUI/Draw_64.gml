var s = @"dim"+ "\n"+
"w = " + string(gui_screen_unit_width) +"\n"+
"h = " + string(gui_screen_unit_height) +"\n" +
"aspect = " + string(gui_display_aspect);


draw_set_color(c_white);
	//	Draw L Click slot outline
draw_roundrect_ext(x+gui_screen_unit_width, y + gui_screen_unit_height, x + (gui_screen_unit_width * 2), y + (gui_screen_unit_height * 2),roundrect_radius, roundrect_radius, true );
	//	Draw R Click slot outline
draw_roundrect_ext(x+(gui_screen_unit_width*2), y + (gui_screen_unit_height * 2), x + (gui_screen_unit_width * 3), y + (gui_screen_unit_height * 3), roundrect_radius, roundrect_radius, true );









draw_set_color(c_lime);
draw_text(0,200, s);