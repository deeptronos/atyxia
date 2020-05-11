/// @description Insert description here
// You can write your code in this editor

//Makes movement between 2 points smoother
x += (xTo - x)/25;
y += (yTo - y)/25;

//If we're not following anyone skip this, but if we are following someone, do this
if (follow != noone){
	xTo = follow.x;
	yTo = follow.y;
}

var viewMatrix = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, viewMatrix);
