if enabled //only apply shader if the enabled = 1
{
    shader_set(shader);
    shader_set_uniform_f(upos,0.5,0.6);//x,y
}
draw_background(background,0,0);
//show_debug_message(string(mouse_y/room_height));
//shader_reset();

draw_text(16,16,"Enabled: "+string(enabled));

