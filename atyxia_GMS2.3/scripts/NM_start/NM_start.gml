function NM_start() {
	globalvar NMlights,NMcolor,NMamb,NMdif,NMnorm,unorm,uamb,ulights,ucolor,uangle,uNumEnabled;
	NMlights = array_create(24, 0);
	NMcolor = array_create(24, 0);
	NMamb = c_black;
	var width = room_width;
	var height = room_height;
	NMdif = surface_create(width, height);
	NMnorm = surface_create(width, height);
	unorm = shader_get_sampler_index(sh_normal,"norm");
	uamb = shader_get_uniform(sh_normal,"ambiance");
	ulights = shader_get_uniform(sh_normal,"lights");
	ucolor = shader_get_uniform(sh_normal,"lcolor");
	uNumEnabled = shader_get_uniform(sh_normal,"numEnabled");
	uangle = shader_get_uniform(sh_rotate,"angle");


}
