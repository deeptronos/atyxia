function scriptDrawDebugRoomGrid(argument0, argument1) {
	var active_cam;

		//I dont think this is actually necessary at all since the game will just throw an error if the object in the argument doesn't exist, but whateva lol
	if(object_exists(argument0)){
		active_cam = argument0;
	}else{	
		exit;
	}

	if(debug_macro != true){exit;}

	var cam_width	= camera_get_view_width(active_cam);
	var cam_height	= camera_get_view_height(active_cam);
	var GUI_width	= display_get_gui_width();
	var GUI_height	= display_get_gui_height();

	canvas_x_min = (active_cam.x - (cam_width/2));
	canvas_x_max = (active_cam.x + (cam_width/2));
	canvas_y_min = (active_cam.y - (cam_height/2));
	canvas_y_max = (active_cam.y + (cam_height/2));


		//The size of each square in the grid 
	var grid_size = argument1;

	draw_set_color(c_silver);

	//for(var i = 0; i <= 10; i++){
	//	draw_line(canvas_x_min + (i * grid_size), (active_cam.y - (cam_height/2)), canvas_x_min + (i * grid_size), (active_cam.y + (cam_height/2)) );
	//}

	for(var i = 0; i <= (room_width/grid_size); i++){
		draw_line(i * grid_size, canvas_y_min, i * grid_size, canvas_y_max );
	}

	for(var i = 0; i <= (room_height/grid_size); i++){
		draw_line(canvas_x_min, i * grid_size, canvas_x_max, i * grid_size);
	}

	//draw_line((active_cam.x - (cam_width / 2)), active_cam.y, GUI_width, active_cam.y);

	//show_debug_message(camera_get_view_width(active_cam));


}
