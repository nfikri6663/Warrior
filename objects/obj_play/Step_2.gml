if global.file_audio[_id,room] == -1{
	if played{
		if !audio_is_playing(file){
			if image_index == play{
				var snd = audio_play_sound(file,1,loop)
				audio_sound_gain(snd,0,0)
				audio_sound_gain(snd,1,500)
				global.audio_play[_id,0][room] = true
				global.audio_play[_id,1][room] = loop
				ds_map_replace(save,$"audio_play{[_id,0]}",global.audio_play[_id,0][room])
				ds_map_replace(save,$"audio_play{[_id,1]}",global.audio_play[_id,1][room])
				ds_map_secure_save(save,filename)
			}else
			if !audio_is_playing(file){
				played = false
				global.audio_play[_id,0][room] = false
				global.audio_play[_id,1][room] = false
				ds_map_replace(save,$"audio_play{[_id,0]}",global.audio_play[_id,0][room])
				ds_map_replace(save,$"audio_play{[_id,1]}",global.audio_play[_id,1][room])
				ds_map_secure_save(save,filename)
			}
		}
	}else{
		if audio_is_playing(file){
			audio_sound_gain(file,0,500)
			if audio_sound_get_gain(file) < 0.25{
				audio_stop_sound(file)
				audio_sound_gain(file,1,1)
			}
			global.audio_play[_id,0][room] = false
			global.audio_play[_id,1][room] = false
			ds_map_replace(save,$"audio_play{[_id,0]}",global.audio_play[_id,0][room])
			ds_map_replace(save,$"audio_play{[_id,1]}",global.audio_play[_id,1][room])
			ds_map_secure_save(save,filename)
		}
	}
}