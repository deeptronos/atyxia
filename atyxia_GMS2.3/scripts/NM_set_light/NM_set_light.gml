/// @description NM_set_light(light id,x,y,range,color)
/// @param light id
/// @param x
/// @param y
/// @param range
/// @param color
function NM_set_light(argument0, argument1, argument2, argument3, argument4) {
	var i,X,Y,r,c;
	i = argument0;
	X = argument1;
	Y = argument2;
	r = argument3;
	c = argument4;
	NMlights[i*3] = X;
	NMlights[i*3+1] = Y;
	NMlights[i*3+2] = r;
	NMcolor[i*3] = colour_get_red(c)/255;
	NMcolor[i*3+1] = colour_get_green(c)/255;
	NMcolor[i*3+2] = colour_get_blue(c)/255;


}
