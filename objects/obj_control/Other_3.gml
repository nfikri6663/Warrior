if file_exists(filename){
	for(var i=0; i<100; i++){
		for(var j=0; j<100; j++){
			if !global.audio_play[i,0][j]{
				if file_exists($"Audio_{i}_ref room {j}.ogg"){
					file_delete($"Audio_{i}_ref room {j}.ogg")
				}
			}
		}
	}
}