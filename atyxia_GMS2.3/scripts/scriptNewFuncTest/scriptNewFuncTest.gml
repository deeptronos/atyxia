// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function script_NewFuncTest_func1(this_guys_argument){
	var to_output = this_guys_argument + 5
	return("script_NewFuncTest_func1(this_guys_argument) ran! :) heres the thing its returning: " + string(to_output));
}

function script_NewFuncTest_func2(this_guys_argument){
	var to_output = this_guys_argument + 10
	return("script_NewFuncTest_func2(this_guys_argument) ran now! =) heres the thing its gonna return: " + string(to_output));
}