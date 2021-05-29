/// @description NM_normal(add,rotation)
/// @param add
/// @param rotation
function NM_normal(argument0, argument1) {
	if argument0
	{
		if (!surface_exists(NMnorm))
		{
			NMnorm = surface_create(room_width, room_height);
		}
		shader_set(sh_rotate)
		shader_set_uniform_f(uangle,-argument1)
		surface_set_target(NMnorm)
	
		global.renderPass = RP_NORMAL;
	}
	else
	{
	    shader_reset()
	    surface_reset_target()
	}



}
