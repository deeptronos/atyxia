var level_select_menu = instance_create_layer(x, y, "instancesUIObjects", objectSelectionMenu);
with(level_select_menu){
	current_camera = objectSystemScreenCamera;
	choices = ["Prototype"];
	choice_actions = [scriptGoToDemoRoom];
	menu_x = room_width/2;
	menu_y = room_height/2;
	descendant = true;
}