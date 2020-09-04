/// @description Insert description here
// You can write your code in this editor
if(sprite_get_yoffset(sprite_index) != 0){
	sprite_set_offset(sprite_index, 0, 0); //	idk why but for some reason i need to do this otherwise itll change the y offset a few second into runtime??
}
