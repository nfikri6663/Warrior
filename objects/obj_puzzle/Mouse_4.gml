if global.image_2 == -1{
	if global.image_1 == -1{
		open = true
		global.image_1 = result
		img_open = global.image_1
	}else{
		open = true
		global.image_2 = result
		img_open = global.image_2
		global.moves += 1
		alarm[0] = 60
		obj_control.alarm[0] = 61
	}
	audio_play_sound(sn_cardflip,1,0)
}