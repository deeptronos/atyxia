/// @desc sets depth of layers, adds rendering script to appropriate layers, tilts sprites by necessary amount
sprite_index = -1;
view_enabled = true;
view_set_visible(0, true);
show_debug_message("GameplayLayerRender");

//	Layer system is as such:
	//	Layers are used to separate things visually and add depth to a 2D environment. Right now,
	//		all gameplay takes place in "lvl1", which is at a depth of 0. 
	//	The player stays here the entire time, and anything they'll ever interact with, 
	//		depth-wise, will be in lvl1. 
	//	Below lvl1 is "tiles_low", which is for tiles and things that will always
	//		be below the player, "blayer", which is the background that'll be drawn.
	//	Above lvl1 is "ilayer_environmental_collision", which is an instance layer that contains
	//		gameobjects which denote the boundaries and collisions of the layer. This is used to 
	//		either keep the player inside the play area, or to stop the player from walking through
	//		parts of the environment that are supposed to be solid. By default, it is invisible
	//		so that the player doesn't see them during playtime, but it can be toggled on and off
	//		in the editor to draw boundaries using "objectCollisionGeometry". 
	//		There is also "lvl2", which is for visuals that are supposed to at a higher depth ("above
	//		the player") in the game world. In current implementation, the player never goes to
	//		this layer and is at a constant depth, so there aren't any interactables here,
	//		it's just for visual purposes.
	
	//	lvl1: where the player is!

// == Shifting Layers == // Depth values are important!!
layer_depth(layer_get_id("blayer"), 100);
layer_depth(layer_get_id("LightingSetup"), 98); // NM Lighting Setup layer
layer_depth(layer_get_id("Background"), 99); // NM Background layer

layer_depth(layer_get_id("tiles_low"), GCD);			// one tile width (Global Cell-sized) below the ground
layer_depth(layer_get_id("ilayer_environmental_collision"), 2);	//	objects that specify the bounds of the playable area
layer_depth(layer_get_id("tiles_lvl1_environment"), 1);	// assets for the environment details from a tileset
layer_depth(layer_get_id("tiles_lvl1"), 0);				// this is the ground/tileset environment
layer_depth(layer_get_id("alayer_lvl1_terrain"), -1);	// assets like trees/grass (ie, terrain) on top


layer_depth(layer_get_id("tiles_lvl2"), -GCD);
layer_depth(layer_get_id("alayer_lvl2_terrain"), -GCD - 1);
layer_depth(layer_get_id("tiles_lvl2_environment"), -GCD - 2);

layer_depth(layer_get_id("ilayer_controllers"), -1000);

layer_depth(layer_get_id("instancesUIObjects"), -998);
layer_depth(layer_get_id("ilayer_UIObjects"), -999);
layer_depth(layer_get_id("Dialogue"), -1001);

layer_depth(layer_get_id("FinalizeRender"), -1002); // NM FinalizeRender layer

//  == Layer Scripts == //
enum RenderState{
	set,
	reset,
	size
}

renderstate = RenderState.set;	// default
alpha_testing = true;	// having alpha_testing set below the renderer stuff was giving me issues, so I guess  I'll set it here too
silhouette = false;	// setting this here too for the same reason as alpha_testing
//show_debug_message("blayer layer ID: " + string(layer_get_id("blayer")));
//show_debug_message("calling scriptRender_layer_master(objectOrthoGameplayRender): " + string(scriptRender_layer_master(objectOrthoGameplayRender)));
	
//layer_script_end(layer_get_id("blayer"), script_execute(scriptRender_layer_master, objectOrthoGameplayRender));	// start zbuffering after background layer has drawn and cleared the screen
//layer_script_begin(layer_get_id("ilayer_controllers"), script_execute(scriptRender_layer_master, objectOrthoGameplayRender));	// end zbuffering before controllers run
	//	^ had to use script_execute(ind, arg0, arg1, ...) to execute those scriptRender_layer_master functions in >=2.3 for some reason??
	// wait nvm lol..
layer_script_end(layer_get_id("blayer"), scriptRender_layer_master);
layer_script_end(layer_get_id("ilayer_controllers"), scriptRender_layer_master);

/// == Tilt Asset Layer Sprites by modifying the alpha channel == //
tilt = true;
scriptTilt_layer_sprites(tilt, objectOrthoGameplayPlayer, "ilayer_instances");
alpha_testing = true;
