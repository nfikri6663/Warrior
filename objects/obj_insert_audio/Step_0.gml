if !loop{image_index = 1}else{image_index = 0}

if _id != -1 && open{
	for (var i=0; i<instance_number(obj_play); i++){
	    _play[i] = instance_find(obj_play,i)
	}
	
	if !audio_is_playing(_play[_id].file) && !audio_is_playing(global.file_audio[_id,room]){
		var _open = get_open_filename("Audio|*.ogg;","")
		if _open != "" && file_exists(_open){
			var _name = filename_name(_open)
			audio_name[_id,room] = string_delete(_name,string_length(_name)-3,4)
		
			ds_map_replace(save,$"audio_name{[_id,room]}",audio_name[_id,room])
			ds_map_secure_save(save,"name_audio.sav")
		
			audio_create_stream(_open);
			file_copy(_open,$"Audio_{_id}_{room}.ogg")
		}
		open = false
	}
}