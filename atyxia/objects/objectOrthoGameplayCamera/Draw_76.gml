/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 149B3162
/// @DnDArgument : "code" "/// @description Draw window background$(13_10)// You can write your code in this editor$(13_10)$(13_10)image_xscale	= window_get_width();$(13_10)image_yscale	= window_get_height();$(13_10)$(13_10)//draw_sprite_tiled(spriteWindowBG_Solid, 0, 0, 0);$(13_10)//draw_sprite_tiled(spriteWindowBG_1, 2, 0, 0);$(13_10)$(13_10)var screen_height = display_get_height();$(13_10)var screen_width = display_get_width();$(13_10)$(13_10)var win_height = window_get_height();$(13_10)var win_width = window_get_width();$(13_10)$(13_10)//win_height/screen_height = x / screen_width$(13_10)//screen_width * (win_height/screen_height) = x$(13_10)$(13_10)var gameplay_area_width = screen_width * (win_height/screen_height);$(13_10)$(13_10)var margin_x = win_width - gameplay_area_width;$(13_10)$(13_10)//show_debug_message(string(gameplay_area_width) + " " + string(win_width));$(13_10)//show_debug_message(string(margin_x));$(13_10)$(13_10)draw_sprite_tiled_ext(spriteWindowBorder_0, 0, -1 * margin_x, 0, 1, 1, c_white, 1);"
/// @description Draw window background
// You can write your code in this editor

image_xscale	= window_get_width();
image_yscale	= window_get_height();

//draw_sprite_tiled(spriteWindowBG_Solid, 0, 0, 0);
//draw_sprite_tiled(spriteWindowBG_1, 2, 0, 0);

var screen_height = display_get_height();
var screen_width = display_get_width();

var win_height = window_get_height();
var win_width = window_get_width();

//win_height/screen_height = x / screen_width
//screen_width * (win_height/screen_height) = x

var gameplay_area_width = screen_width * (win_height/screen_height);

var margin_x = (win_width - gameplay_area_width)/2;


draw_sprite_stretched(spriteWindowBorder_0, 0, 0 - margin_x, 0, (margin_x * 2), win_height);
draw_sprite_stretched(spriteWindowBorder_0, 1, win_width - margin_x, 0, (margin_x * 2), win_height);