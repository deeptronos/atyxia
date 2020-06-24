/// @desc sets depth of layers, adds rendering script to appropriate layers, tilts sprites by necessary amount
sprite_index = -1;
view_enabled = true;
view_set_visible(0, true);


// == Shifting Layers == // Depth values are important!!
layer_depth(layer_get_id("blayer"), 100);

layer_depth(layer_get_id("tiles_low"), GCD);			// one tile width (Global Cell-sized) below the ground
layer_depth(layer_get_id("tiles_lvl1"), 0);				// this is the ground
layer_depth(layer_get_id("alayer_terrain_lvl1"), -1);	// assets like trees/grass (ie, terrain) on top

layer_depth(layer_get_id("tiles_lvl2"), -GCD);
layer_depth(layer_get_id("alayer_terrain_lvl2"), -GCD-1);

layer_depth(layer_get_id("ilayer_controllers"), -1000);

layer_depth(layer_get_id("instancesUIObjects"), -998);
layer_depth(layer_get_id("ilayer_UIObjects"), -999);
layer_depth(layer_get_id("Dialogue"), -1001);

//  == Layer Scripts == //
enum RenderState{
	set,
	reset,
	size
}

renderstate = RenderState.set;	// default
alpha_testing = true;	// having alpha_testing set below the renderer stuff was giving me issues, so I guess  I'll set it here too
silhouette = false;	// setting this here too for the same reason as alpha_testing
layer_script_end(layer_get_id("blayer"), scriptRender_layer_master(objectOrthoGameplayRender));	// start zbuffering after background layer has drawn and cleared the screen
layer_script_begin(layer_get_id("ilayer_controllers"), scriptRender_layer_master(objectOrthoGameplayRender));	// end zbuffering before controllers run


/// == Tilt Asset Layer Sprites by modifying the alpha channel == //
tilt = true;
scriptTilt_layer_sprites(tilt, objectOrthoGameplayPlayer);
alpha_testing = true;
