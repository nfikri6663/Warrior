window_set_size(_w,_h)
surface_resize(application_surface,_w,_h)

if file_exists(filename){
	var load = ds_map_secure_load(filename)
	for(var i=0; i<100; i++){
		var json_string = load[? "my_array"]
		if json_string != []{
			var retrieved_array = json_parse(json_string)
			global.array_bag = retrieved_array
			
			var json_string = json_stringify(global.array_bag)
			ds_map_replace(save, "my_array", json_string)
			ds_map_secure_save(save,filename)
		}
		
		for(var j=0; j<100; j++){
			global.audio_play[i,0][j] = load[?$"audio_play{[i,0]}"]
			global.audio_play[i,1][j] = load[?$"audio_play{[i,1]}"]
		
		
			if global.audio_play[i,0][j]{
				if file_exists($"Audio_{i}_ref room {j}.ogg"){
					var _play = working_directory+$"Audio_{i}_ref room {j}.ogg"
					global.file_audio[i,j] = audio_create_stream(_play);
					if !audio_is_playing(global.file_audio[i,j]){
						audio_play_sound(global.file_audio[i,j],1,global.audio_play[i,1][j])
					}
				}
			}
		}
	}
}else{
	ds_map_replace(save,$"audio_play[0,0][0]",global.audio_play[0,0][0])
	
	var json_string = json_stringify(global.array_bag)
	ds_map_replace(save, "my_array", json_string)
	
	ds_map_secure_save(save,filename)
}