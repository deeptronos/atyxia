function scriptDrawLocationAxis(argument0, argument1, argument2, argument3) {
	//Modes:
	//	0: draws an x and y axis at the object's location, with axis size determined by current sprite size
	//	1: draws an x and y axis at the object's location across the whole screen

	//Variables are used for x and y in case the object calling the script doesn't want to draw its own X/Y, 
	//	but something elses coordinates, which can be passed when the script is called.
	var locationX = argument0;
	var locationY = argument1;
	var sprite = argument2;
	var mode = argument3;



	switch(mode){
		case 0:
			//X Axis
			draw_line_width_color((locationX - (sprite_get_width(sprite)/2)), locationY, (locationX + (sprite_get_width(sprite)/2)), locationY, 3, c_red, c_red);
			//Y Axis
			draw_line_width_color(locationX, (locationY - (sprite_get_height(sprite)/2)), locationX, (locationY + (sprite_get_height(sprite)/2)), 3, c_lime, c_lime);
		
			break;
		case 1:
			//X Axis
			draw_line_width_color((locationX - (display_get_gui_width()/2)), locationY, display_get_gui_width(), locationY, 3, c_red, c_red);
			//Y Axis
			draw_line_width_color(locationX, (locationY - (display_get_gui_height()/2)), locationX, display_get_gui_height(), 3, c_lime, c_lime);
		
			break;

	}



}
