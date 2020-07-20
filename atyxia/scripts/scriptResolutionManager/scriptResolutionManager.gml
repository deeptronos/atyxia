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
								//	Eg: since the default game resolution is very low relative to modern displays,
								//		(ie, around 960 x 540 or so), it probably has to be scaled up by some amount.
								//		That amount is made into a factor value by this function so that we can scale
								//		other things up by the same factor. So if the game window is being scaled up from
								//		960 to 1987, that would be an increase by a factor of 2.07, which we could multiply
								//		the size of other things by to make them increase by the same amount.
								//	This is most useful for GUI stuff, since the GUI's size is the window size, scaled
								//		down to fit the gameplay area, so it's a fairly high resolution surface that is
								//		being squashed into a like 960 x 540 box. Therefore, if we have something
								//		from it, like text, and we multiply its size by global.gameSizeScale,
								//		it will be the size it would be if the GUI weren't being scaled down, and therefore,
								//		much easier to read.

global.ScaleOffSet = 256;
//offSet = 1000;
if (!window_get_fullscreen()){
	window_set_size((screenWidth - global.ScaleOffSet), (screenHeight - global.ScaleOffSet));
}

display_set_gui_size(screenWidth, screenHeight);
show_debug_message("cScale: " + string(cScale));