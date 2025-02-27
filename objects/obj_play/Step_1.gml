if file_exists($"Audio_{_id}_{room}.ogg"){
	if !audio_global{
		if played{image_index = stop}else{image_index = play}
	}
	
	if file == -1{
		if _id != -1{
			var _play = working_directory+$"Audio_{_id}_{room}.ogg"
			
			ds_map_replace(save,$"audio_name{[_id,room]}",audio_name[_id,room])
			ds_map_secure_save(save,filename)
		
			file = audio_create_stream(_play);
			global.file[_id,room] = file
		}else{
			show_message("Set _id to not have a value of -1 on objects in the room")
		}
	}
}else{
	image_index = empty
}