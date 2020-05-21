/// @description Insert description here
// You can write your code in this editor
var start_menu = instance_create_layer(x, y, "instancesUIObjects", objectSelectionMenu);
with(start_menu){
	current_camera = objectSystemScreenCamera;
	choices = ["Play", "Options", "Leave"];
	choice_actions = [scriptGoToFirstRoom, undefined, scriptExitGame];
	menu_x = room_width/2;
	menu_y = room_height/2;
}