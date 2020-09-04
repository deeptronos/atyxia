/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(dialogue_interact_key)){
	
	if(counter < dialogue_str_length){counter = dialogue_str_length;}
	
	else if(page < array_length_1d(dialogue_text) - 1){
		page++;
		event_perform(ev_other, ev_user1);
	}else{
		instance_destroy();
		with(objectOrthoGameplayPlayer){
				//Player can move again once the dialogue is over
			can_move = true;
		}
	}
}