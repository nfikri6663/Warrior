if !audio_global && global.file_audio[_id,room] != -1{
	audio_sound_gain(global.file_audio[_id,room],0,500)
	if audio_sound_get_gain(global.file_audio[_id,room]) < 0.25{
		audio_stop_sound(global.file_audio[_id,room])
		global.file_audio[_id,room] = -1
		global.audio_play[_id,0][room] = false
		global.audio_play[_id,1][room] = false
		ds_map_replace(save,$"audio_play{[_id,0]}",global.audio_play[_id,0][room])
		ds_map_replace(save,$"audio_play{[_id,1]}",global.audio_play[_id,1][room])
		ds_map_secure_save(save,filename)
	}
}

if !audio_is_playing(global.file_audio[_id,room]) && global.file_audio[_id,room] != -1{
	audio_global = false
	global.file_audio[_id,room] = -1
	global.audio_play[_id,0][room] = false
	global.audio_play[_id,1][room] = false
	ds_map_replace(save,$"audio_play{[_id,0]}",global.audio_play[_id,0][room])
	ds_map_replace(save,$"audio_play{[_id,1]}",global.audio_play[_id,1][room])
	ds_map_secure_save(save,filename)
}