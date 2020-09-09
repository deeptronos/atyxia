var string_tex = sprite_get_texture(spriteSquares_2x2, 0);

draw_primitive_begin_texture(pr_linestrip, string_tex);
//draw_vertex_texture(x, y + z, 2, 2);
//draw_vertex_texture(anchor_x,anchor_y, 2, 2);
//draw_primitive_end();
for(var i = 0; i <3; i++){

}
	//	Drawing string using a quadratic bezier curve
draw_vertex_texture(x, y + z, 2, 2);
draw_vertex_texture(anchor_x,anchor_y, 2, 2);
draw_primitive_end();

draw_sprite_ext(sprite_index,image_index,x,y+z,image_xscale,image_yscale,image_angle,c_white,image_alpha);

draw_set_color(c_lime);
physics_draw_debug();