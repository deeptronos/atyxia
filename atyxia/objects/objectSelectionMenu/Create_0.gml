current_camera = noone;
choices = ["emptee"];
choice_actions = [undefined];



color_primary = c_silver;
color_highlights = c_lime;

menu_x = 0;
menu_y = 0;

x = menu_x;
y = menu_y;
can_input = true;

current_choice = 0;
show_debug_message(string(y));
cam_target_object = instance_create_layer(x, y, "Instances", objectGenericCameraTarget);
