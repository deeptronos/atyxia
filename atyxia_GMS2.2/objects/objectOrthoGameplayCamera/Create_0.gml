/// @description Insert description here

z = 20;
//dirr = -271;
//pitch = -79;
sprite_index = -1;


//setting up room (size must actually be controlled in room settings!)
room_set_viewport(room, view_current, true, view_xport[view_current], view_yport[view_current], default_view_width, default_view_height);
//Creating the camera/following the player
camera = camera_create();

var viewMatrix = matrix_build_lookat(x, y,-10, x, y, 0, 0, 1, 0);
//RESOLUTION/ASPECT RATIO IS DEPENDANT ON THIS:
var projectionMatrix = matrix_build_projection_ortho(default_view_width, default_view_height, 1, 10000);

camera_set_view_mat(camera, viewMatrix);
camera_set_proj_mat(camera, projectionMatrix);

view_camera[0] = camera;

follow = objectOrthoGameplayPlayer;

xTo = x;
yTo = y;

scriptResolutionManager();

//Sets antialiasing to 0 and turns on v-sync

if(v_sync == true){
	display_reset(antialiasing_level, true);
}


//Make sure textures (and sprites) aren't filtered, so that it looks distorted and weird
if gpu_get_texfilter(){
    gpu_set_texfilter(false);
}


alarm[0] = 1;
