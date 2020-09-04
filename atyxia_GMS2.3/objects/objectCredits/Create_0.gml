var return_button = instance_create_layer(x, y, "instancesUIObjects", objectSelectionMenu);
with(return_button){
	current_camera = objectSystemScreenCamera;
	choices = ["Return"];
	choice_actions = [scriptGoToOptions];
	menu_x = room_width/2;
	menu_y = room_height/2;
	descendant = true;
}

credits_color = c_white;

var credits_textfile = file_text_open_read("credits.txt");
credits = "";
credits_string = "";
var i = 0;



while(!file_text_eof(credits_textfile)){
	credits[i] = file_text_read_string(credits_textfile);
	file_text_readln(credits_textfile);
	credits_string = string_insert(credits[i], credits_string, string_length(credits_string) + 1);
	credits_string = string_insert("\n", credits_string, string_length(credits_string) + 1);
	
	i++;
}

show_debug_message(credits_string);
file_text_close(credits_textfile);
