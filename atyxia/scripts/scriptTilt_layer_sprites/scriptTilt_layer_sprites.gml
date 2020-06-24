///@arg tilt
///@arg player_object
var _tilt = argument0;
var _player = argument1;
_layers = ["alayer_terrain_lvl1", "alayer_terrain_lvl2"];

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

with(_player){
	image_alpha = _tilt? sprite_height/255 : 0;
}