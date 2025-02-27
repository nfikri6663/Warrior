if room == rm_puzzle{
	var _l = layer_get_id("Background")
	var _b = layer_background_get_id(_l)
	switch global.difficult{
		case 0:
			layer_background_index(_b,1)
		break
		case 1:
			layer_background_index(_b,2)
		break
		case 2:
			layer_background_index(_b,3)
		break
	}
}

for(var i=0; i<100; i++){
	for(var j=0; j<100; j++){
		if global.file_audio[i,j] != -1{
			global.audio_play[i,0][j] = true
			global.audio_play[i,1][j] = global.audio_play[i,1][j]
			ds_map_replace(save,$"audio_play{[i,0]}",global.audio_play[i,0][j])
			ds_map_replace(save,$"audio_play{[i,1]}",global.audio_play[i,1][j])
			ds_map_secure_save(save,filename)
		}
	}
}

//show_debug_message(global.array_bag)