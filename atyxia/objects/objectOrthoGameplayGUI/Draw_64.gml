//display_set_gui_maximize();	// Make GUI dimensions be same as camera resolution, ie default_view_width & default_view_height 

var s = @"dim"+ "\n"+
"screen w = " + string(display_get_gui_width()) + "\n" +
"screen h = " + string(display_get_gui_height()) + "\n" +
"unit w = " + string(gui_screen_unit_width) +"\n"+
"unit h = " + string(gui_screen_unit_height) +"\n" +
"aspect = " + string(gui_display_aspect);


draw_set_color(c_white);
	//	Draw L Click slot outline
draw_roundrect_ext(x+gui_screen_unit_width, y + gui_screen_unit_height, x + (gui_screen_unit_width * 2), y + (gui_screen_unit_height * 2),roundrect_radius, roundrect_radius, true );
draw_text_transformed(x + gui_screen_unit_width, y + (gui_screen_unit_height * 2), "L", global.gameSizeScale, global.gameSizeScale, 0);
	//	Draw R Click slot outline
draw_roundrect_ext(x+(gui_screen_unit_width*2), y + (gui_screen_unit_height * 2), x + (gui_screen_unit_width * 3), y + (gui_screen_unit_height * 3), roundrect_radius, roundrect_radius, true );
draw_text_transformed(x+(gui_screen_unit_width*2), y + (gui_screen_unit_height * 3), "R", global.gameSizeScale, global.gameSizeScale, 0);








draw_set_color(c_lime);
draw_text_transformed(0,200, s, global.gameSizeScale, global.gameSizeScale, 0);