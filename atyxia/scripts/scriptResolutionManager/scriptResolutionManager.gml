//(Despite what it may look like) Makes sure the GUI is sized with the game & window, and aspect ratio is maintained

var screenWidth, screenHeight, cScale;

global.gameWidth	= view_wport[0];
global.gameHeight	= view_hport[0];

global.gameAspect = (global.gameWidth/global.gameHeight);

screenHeight = display_get_height();
screenWidth	 = (screenHeight * global.gameAspect);

cScale = (screenHeight / global.gameHeight);

global.gameSizeScale = cScale;	//	This value is the factor by which the game surface is scaled up to match window size.
								//		It is useful for some GUI scaling purposes, such as drawing legible text,
								//		so it's a global.

global.ScaleOffSet = 256;
//offSet = 1000;
if (!window_get_fullscreen()){
	window_set_size((screenWidth - global.ScaleOffSet), (screenHeight - global.ScaleOffSet));
}

display_set_gui_size(screenWidth, screenHeight);
show_debug_message("cScale: " + string(cScale));