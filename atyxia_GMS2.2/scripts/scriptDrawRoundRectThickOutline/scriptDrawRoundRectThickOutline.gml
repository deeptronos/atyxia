//Modes:
	//0: draws outline inside
	//1: draws outline outside

x1 = argument0;
y1 = argument1;
x2 = argument2;
y2 = argument3;
radiusX = argument4;
radiusY = argument5; 
color = argument6;
thickness = argument7;
mode = argument8;

draw_set_color(color);

switch(mode){
	
	case 0:
		for( i = 0; i<=thickness; i++){
			draw_roundrect_ext(x1 + i, y1 + i, x2 - i, y2 - i, radiusX, radiusY, true);
		}
		break;
	case 1:
		for( i = 0; i<=thickness; i++){
			draw_roundrect_ext(x1 - i, y1 - i, x2 + i, y2 + i, radiusX, radiusY, true);
		}
		break;		

}

