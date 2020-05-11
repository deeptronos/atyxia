//(Despite what it may look like) Makes sure the GUI is sized with the game & window, and aspect ratio is maintained

var screenWidth, screenHeight, gameWidth, gameHeight, aspect, cScale, offSet;

gameWidth	= view_wport[0];
gameHeight	= view_hport[0];

aspect = (gameWidth/gameHeight);

screenHeight = display_get_height();
screenWidth	 = (screenHeight * aspect);

cScale = (screenHeight / gameHeight);

offSet = 256;
//offSet = 1000;
if (!window_get_fullscreen()){
	window_set_size((screenWidth - offSet), (screenHeight - offSet));
}

display_set_gui_size(screenWidth, screenHeight);