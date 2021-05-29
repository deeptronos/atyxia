function NM_init() {
#macro RP_DIFFUSE 0
#macro RP_NORMAL 1
	global.renderPass = RP_DIFFUSE;
#macro AMBIANCE_R 80 * 1.75
#macro AMBIANCE_G 80 * 1.75
#macro AMBIANCE_B 144 * 1.75
	global.playerLightColors[0] = 255;
	global.playerLightColors[1] = 198;
	global.playerLightColors[2] = 147;


}
