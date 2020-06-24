/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index, image_index, x, y + z, image_xscale, image_yscale, image_angle, c_white, image_alpha);
draw_set_color(c_lime);
draw_circle(x, y, 2, false);
//show_debug_message("collision offset: " + sprite_get_xoffset(sprite_index) + ", " + sprite_get_yoffset(sprite_index));
//show_debug_message(sprite_get_yoffset(sprite_index));