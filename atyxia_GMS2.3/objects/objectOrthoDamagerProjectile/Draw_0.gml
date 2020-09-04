/// @description Draws self if debug mode is on & set to "combat"
// You can write your code in this editor
image_xscale = scale_x;
image_yscale = scale_y;

if(debug_macro == true && debugMode == "combat"){
	image_angle = dir - 90;
	draw_self();
}