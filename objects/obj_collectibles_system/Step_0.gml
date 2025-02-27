if array_length(global.array_bag) == 0 && room = rm_bag{
	instance_destroy()
}

if point_in_rectangle(mouse_x,mouse_y,x-80,y-80,x-48,y-48) && hover{
	if mouse_check_button_pressed(mb_left){
		scr_array_push_obj()
		hover = false
	}
}