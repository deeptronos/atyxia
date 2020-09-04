/// @description Insert description here
// You can write your code in this editor
if(can_be_used == true){
	with(objectOrthoGameplayPlayer){
		hp = hp + 25;
		show_debug_message(string(hp));
	}
	instance_destroy();
}
