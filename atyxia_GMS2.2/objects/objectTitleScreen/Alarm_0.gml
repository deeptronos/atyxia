/// @description Creates menu
// You can write your code in this editor
var start_menu = instance_create_layer(x, y, "instancesUIObjects", objectSelectionMenu);
with(start_menu){
	current_camera = objectSystemScreenCamera;
	choices = ["Play", "Options", "Leave"];
	choice_actions = [scriptGoToStartRoom, scriptGoToOptions, scriptExitGame];
	menu_x = room_width/2;
	menu_y = room_height/2;
	descendant = false;
}
