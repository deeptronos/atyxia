/// @description Insert description here
// You can write your code in this editor
x =	0;
y = 0;
roundrect_radius = 5;

gui_display_aspect			= display_get_gui_width()/display_get_gui_height();
gui_screen_unit_division	= 16;	//	the unit divisor of the total game window/screen's size (eg, 32 = 32 units)

gui_screen_unit_height	= round(display_get_gui_height()/gui_screen_unit_division);
gui_screen_unit_width	= round(gui_screen_unit_height * gui_display_aspect);

L_ability_slot_sprite = spriteGameplayItemPlaceholder;
R_ability_slot_sprite = spriteGameplayItemPlaceholder;