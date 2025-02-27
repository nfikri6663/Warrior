if _id != -1{
	for (var i=0; i<instance_number(obj_play); i++){
	    _play[i] = instance_find(obj_play,i)
	}
	
	if _play[_id]._id == _id{
		_play[_id].played = false
		if global.file_audio[_id,room] != -1{
			_play[_id].audio_global = false
		}
		open = true
	}
}else{
	show_message("Set _id to not have a value of -1 on objects in the room")
}