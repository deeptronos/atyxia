var str = argument0;
var counter = argument1;

var title_length = string_length(argument0);

drawn_substring = string_copy(str, 1, counter);
if(counter < title_length){
	draw_set_color(c_red);
	draw_text(200, 100, drawn_substring);
}