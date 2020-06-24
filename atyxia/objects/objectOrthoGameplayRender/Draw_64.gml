if debug_macro{
	var s = "";
	with(objectOrthoGameplayPlayer){s += "\nplayer z: " + string(z);}
	draw_set_font(fontDebug16);
	draw_text(5, 285, s);
}
