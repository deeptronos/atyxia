/// @description Diffuse
draw_set_alpha(1);
draw_set_color(c_white);

//set lights
var playerLightSize = 240;

NM_set_ambiance(make_colour_rgb(AMBIANCE_R,AMBIANCE_G,AMBIANCE_B))//Set ambiance color

numLights = 1;
NM_set_light(other.numLights++, mouse_x, mouse_y, playerLightSize, make_colour_rgb(global.playerLightColors[0],global.playerLightColors[1],global.playerLightColors[2]));

with (objectLight)
{
	NM_set_light(other.numLights++, x, y, playerLightSize, lightColor);
}
	
NM_diffuse(1);

