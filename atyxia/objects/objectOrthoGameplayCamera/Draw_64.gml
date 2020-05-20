/// @description Insert description here
// You can write your code in this editor

//GUI Debug Stuff
if (debug_macro & (debugMode == "scaling")){
	draw_set_alpha(0.5);
	var GUIWidth	= display_get_gui_width();
	var GUIHeight	= display_get_gui_height();
	//X Axis
	draw_line_width_color(0, 0, GUIWidth, 0, 3, c_red, c_red);
	//Y Axis
	draw_line_width_color(0, 0, 0, GUIHeight, 3, c_lime, c_lime); 
	
	draw_rectangle_color(0, 400, 200, GUIHeight, c_silver, c_silver, c_silver, c_silver, false);
	draw_set_color(c_red);
	draw_text_ext(0, 420, "GUIWidth: " + string(GUIWidth) + ", GUIHeight: " + string(GUIHeight),12, 190);
	draw_text(0, 540, "camera:");
	draw_text_ext(12, 540, "width: " + string(camera_get_view_width(camera)) + ", height: " + string(camera_get_view_height(camera)), 10, 190);
	draw_text(12, 450, "matrix: " + string(matrix_get(matrix_view)));
	draw_set_alpha(1);
}

