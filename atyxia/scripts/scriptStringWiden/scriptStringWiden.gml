var str = argument0;
var spacing = argument1;

var str_length = string_length(str);
var last_space = 1;
var count = 1;

var substr;
show_debug_message(str);
repeat(str_length){

	if(string_char_at(str, count) != " "){
		str = string_insert(" ", str, count);
		count += 1;
	}else if(string_char_at(str, count) == " "){
		str = string_insert(" ", str, count);
		count += 1;
	}
	count++;
}
show_debug_message(string(str));
return str;