depth = 0
scr_set_timer()
if play{
	scr_countdown(0)
}

if room == rm_puzzle && instance_exists(obj_puzzle){
	scr_countdown(1)
}
if keyboard_check_pressed(vk_escape){
	room_goto(rm_menu)
}