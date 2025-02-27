for(var i = 0; i<100; i++){
	for(var j = 0; j<100; j++){
		if global.audio_play[i,0][j] == undefined{
			global.audio_play[i,0][j] = false
		}
		if global.audio_play[i,1][j] == undefined{
			global.audio_play[i,1][j] = false
		}
		if global.file_audio[i,j] == undefined{
			global.file_audio[i,j] = -1
		}
		if audio_name[i,j] == undefined{
			audio_name[i,j] = ""
		}
	}
}

if global.array_bag == undefined || global.array_bag == 0{global.array_bag = []}