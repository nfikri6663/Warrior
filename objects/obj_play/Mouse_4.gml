if file != -1 && visible{
	if global.file_audio[_id,room] == -1{
		if played{
			played = false
		}else{
			played = true
			_volume = 1
		}
	}else{
		audio_global = false
	}
}