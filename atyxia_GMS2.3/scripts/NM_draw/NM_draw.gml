/// @description NM_draw(x,y)
/// @param x
/// @param y
function NM_draw(argument0, argument1) {
	//draw_clear_alpha(0,0);
	shader_set(sh_normal)
	texture_set_stage(unorm,surface_get_texture(NMnorm))
	shader_set_uniform_f_array(ulights,NMlights)
	shader_set_uniform_f_array(ucolor,NMcolor)
	shader_set_uniform_f(uamb,colour_get_red(NMamb)/255,colour_get_green(NMamb)/255,colour_get_blue(NMamb)/255)
	shader_set_uniform_i(uNumEnabled, min(numLights,8));
	draw_surface(NMdif,argument0,argument1)

	shader_reset()



}
