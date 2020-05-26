/// @description Insert description here
// You can write your code in this editor

if shaders //only apply shader if the macro is enabled
{
    shader_set(shader);
    shader_set_uniform_f(upos,0.5,0.6);//x,y
}

drawn_title = string_copy(title, 1, title_counter);
drawn_subtitle = string_copy(subtitle, 1, subtitle_counter);

	//Draws the subtitle after drawing the main title
if(title_counter <= title_length){
	title_counter+= 0.5;
} else if(subtitle_counter <= subtitle_length){
	subtitle_counter += 0.25;
} else {
	
}

draw_set_font(title_font);
draw_set_color(title_color);
	//Draws text to be blurred by shader:
	
draw_text(title_x - title_width/2, title_y, drawn_title);	//Title
draw_text_transformed(title_x - title_width/2, (title_y + title_height), drawn_subtitle, subtitle_x_scale/2, 1, 0);	//Subtitle
shader_reset();
	//Draws text unaffected by the shader, over the blurred text
draw_text(title_x - title_width/2, title_y, drawn_title);	//Title
draw_text_transformed(title_x - title_width/2, (title_y + title_height), drawn_subtitle, subtitle_x_scale/2, 1, 0);	//Subtitle
