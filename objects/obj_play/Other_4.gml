/*
for (var i=0; i<instance_number(obj_play); i++){
	_get_id[i] = instance_find(obj_play,i)
	_get_id[i]._id = i
}
*/

if loop{
	empty = 0
	play = 1
	stop = 2
}else{
	empty = 3
	play = 4
	stop = 5
}

if global.file_audio[_id,room] != -1 && audio_is_playing(global.file_audio[_id,room]){
	image_index = stop
}

if global.file_audio[_id,room] != -1{
	audio_global = true
}

if global.audio_play[_id,0][room]{
	played = true
}

file = global.file[_id,room]