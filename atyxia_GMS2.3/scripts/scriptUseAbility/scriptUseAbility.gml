function scriptUseAbility(argument0) {
	//scriptFireDamagerProjectile(hand.x, hand.y, mouse_x, mouse_y, 100, 550, 8, 3, 1);

	var buttonAbilityIndex = argument0;	//	The index of the assigned ability to fire

	abilityDir = point_direction(x, y, cross_x, cross_y);
		
	var abilityObject;
	abilityObject = instance_create_layer(x, y , "ilayer_instances", player_abilities[# buttonAbilityIndex, 7]);	//	Create object specified in "GameObject Representation" field (#7)
	with(abilityObject){
		direction = other.abilityDir;
		ability_rad = 50;
		ability = objectOrthoGameplayPlayer.player_abilities[# buttonAbilityIndex, 0]	//	Pass name of ability to newly created object
		ability_x = x + lengthdir_x(circle_offset, direction);
		ability_y = y + lengthdir_y(circle_offset, direction);
		damage_dealt = other.player_abilities[# buttonAbilityIndex, 4];	//	Get damage from abilities grid
		event_user(0);	//	Call user event 0, which checks for collisions
	}

	alarm[0] = (player_abilities[# buttonAbilityIndex, 5] * global.seconds_passed);	//	Cooldown duration


}
