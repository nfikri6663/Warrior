global.ins_id = 0
global.ply_id = 0

res_width = display_get_width()
res_height = display_get_height()

res_minimum = 1900
res_def_w = 1904
res_def_h = 980
res_min_w = 1360
res_min_h = 700

if res_width >= res_minimum{
	_w = res_def_w
	_h = res_def_h
}else{
	_w = res_min_w
	_h = res_min_h
}

global.difficult = 0
arr_length = 0
data_puzzle = []
img_puzzle = 0
global.image_1 = -1
global.image_2 = -1
global.moves = 0

globalvar audio_name, save, filename;
save = ds_map_create()
filename = "save.sav"

for(var i=0; i<100; i++){
	for(var j=0; j<100; j++){
		global.file_audio[i,j] = -1
		global.audio_play[i,0][j] = false
		global.audio_play[i,1][j] = false
		audio_name[i,j] = ""
		
		global.file[i,j] = -1
	}
}

scr_variable_timer(0)
scr_variable_timer(1)

audio_puzle_losewin = true

global.array_bag = []

global.language = 0