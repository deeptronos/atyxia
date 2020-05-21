/// @description Menu interaction code
// You can write your code in this editor

if(can_input == true && (current_choice >= 0 && current_choice < array_length_1d(choices))){
	switch keyboard_key{
		case player_down:
			show_debug_message("player upp");
			can_input = false;
			current_choice++;
			alarm[0] = 10;
			break;
		case player_up:
			show_debug_message(" anda down!!");
			can_input = false;
			current_choice--;
			alarm[0] = 10;
			break;
		case interact_key:
			can_input = false;
			alarm[0] = 10;
			show_debug_message("interact");
			if(choice_actions[current_choice] != undefined){
				script_execute(choice_actions[current_choice]);
			}
	}
	
} else if(current_choice < 0){
	current_choice = 0;
} else if(current_choice >= array_length_1d(choices)){
	current_choice = array_length_1d(choices) - 1;
}
