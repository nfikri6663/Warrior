if global.image_2 != -1{
	if global.image_1 != global.image_2{
		obj_puzzle.open = false
		obj_puzzle.img_open = -1
		global.image_1 = -1
		global.image_2 = -1
	}else{
		with(obj_puzzle){
			if image_index == global.image_1 || image_index == global.image_2{
				audio_play_sound(sn_match_dissapering,1,0)
				_delete = true
			}
		}
	}
}