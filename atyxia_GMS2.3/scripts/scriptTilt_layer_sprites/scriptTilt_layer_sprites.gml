///@arg tilt
///@arg player_object
///@arg {string} layer_containing_instances
function scriptTilt_layer_sprites(argument0, argument1, argument2) {
	var _tilt = argument0;
	var _player = argument1;

	var instance_layer = argument2;

	_layers = ["alayer_lvl1_terrain", "alayer_lvl2_terrain"];

	var i = 0; repeat(array_length_1d(_layers)){
		var _layer = layer_get_id(_layers[i]);
		var _all = layer_get_all_elements(_layer);
		for(var f = 1; f < array_length_1d(_all); f += 1){
			show_debug_message(sprite_get_name(layer_sprite_get_sprite(_all[f])));
		} 
		var j = 0; repeat(array_length_1d(_all)){
			var e = _all[j];
		
			if layer_get_element_type(e) = layerelementtype_sprite{
				var _height = layer_sprite_get_xscale(e) * sprite_get_height(layer_sprite_get_sprite(e));	// get total height
				layer_sprite_alpha(e, _tilt? _height/255 : 0); // convert to alpha for shader!
				layer_sprite_x(e, layer_sprite_get_x(e) div 1);
				layer_sprite_y(e, layer_sprite_get_y(e) div 1);
			
			}
			++j;
		
		}
		_all = 0;
		++i;
	}

	with(all){
		image_alpha = _tilt? sprite_height/255 : 0;
		//show_debug_message(object_get_name(object_index) + " has been titled");
	}


	//	Below code to selectively tilt instance sprites, as opposed to tilting "all" of them as we're doing above

	//var elements = layer_get_all_elements(instance_layer);
	//var j = 0; repeat(array_length_1d(elements)){

	//	var instance = layer_instance_get_instance(elements[j]);
	//	var instance_index = instance.object_index;
	//	var instance_parent = object_get_name(object_get_parent(instance_index));
	//	if instance_parent == "objectParent_OrthoNPC" {
	//		with instance_index
	//	}

	//	j++;
	//}




}
