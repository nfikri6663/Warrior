if global.file_audio[_id,room] == -1{
	if played{
		if _volume > 0.25{_volume -= 0.25}else{_volume = 1}
		audio_sound_gain(file,_volume,500)
	}
}else{
	if _volume > 0.25{_volume -= 0.25}else{_volume = 1}
	audio_sound_gain(global.file_audio[_id,room],_volume,500)
}