current_camera = noone;
choices = ["emptee"];
choice_actions = [undefined];

	//For the shader:
upos = shader_get_uniform(shader,"pos");//uniform for x,y

color_primary = c_silver;
color_highlights = c_lime;

menu_x = 0;
menu_y = 0;

x = menu_x; 
y = menu_y;
can_input = true;
	//Make true if object creating menu is being instanced by another object 
	//	(ie, we are changing rooms)
descendant = false;

current_choice = 0;
show_debug_message(descendant);
cam_target_object = instance_create_layer(x, y, "Instances", objectGenericCameraTarget);
