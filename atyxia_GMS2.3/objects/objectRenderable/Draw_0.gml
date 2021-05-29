/// @description Normal
var spr;
if (sprite_index_norm == noone)
{
	spr = sprite_index;
	shader_set(sh_defaultNormal);
} else
{
	spr = sprite_index_norm;
}

draw_sprite_ext(spr, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);

if (sprite_index_norm == noone)
{
	shader_reset();
}