switch room{
	case rm_puzzle: //Button in Room Puzzle
		minute_l_draw[1] = 0
		minute_r_draw[1] = 5
		second_l_draw[1] = 0
		second_r_draw[1] = 0
		
		var _width = sprite_get_width(spr_btn_difficult)
		var _height = sprite_get_height(spr_btn_difficult)
		var _range = 32
		var _start = room_width/2-_width-_range
		for(var i=0; i<3; i++){
			var btn = instance_create_depth(_start+(_width+_range)*i,_height,0,obj_btn)
			btn.sprite_index = spr_btn_difficult
			btn.image_index = i
		}
		var btn = instance_create_depth(room_width-_width/2,_height,0,obj_btn)
		btn.sprite_index = spr_btn_difficult
		btn.image_index = 3
		
		//Puzzle
		randomize()
		if global.difficult = 0{arr_length = 12 img_puzzle = irandom(sprite_get_number(spr_puzzle_easy))}else
		if global.difficult = 1{arr_length = 14 img_puzzle = irandom(sprite_get_number(spr_puzzle_difficult))}else
		if global.difficult = 2{arr_length = 22 img_puzzle = irandom(sprite_get_number(spr_puzzle_hard))}

		data_puzzle = []
		for(var i=img_puzzle; i<img_puzzle+arr_length/2; i++){
			array_push(data_puzzle,i+1)
			array_push(data_puzzle,i+1)
		}
		
		for(var i=arr_length-1; i>0; i--){
			var j = irandom(i)
			var temp = data_puzzle[i]
			data_puzzle[i] = data_puzzle[j]
			data_puzzle[j] = temp
		}
		
		var _dif = global.difficult
		var _n = 3
		var _start_x = room_width/(_n+_dif)
		var _yy = _height*2
		var _start_y = (room_height-_yy)/(_n+1)
		if _dif != 0{
			for(var i=0; i<2; i++){
				for(var z=0; z<_dif; z++){
					var pz = instance_create_depth(_start_x/2+(room_width-_start_x)*i,(_yy+_start_y+(_start_y*1.2)*z)+(_start_y/1.5)*abs(_dif-2),0,obj_puzzle)
					pz.img = array_pop(data_puzzle)
				}
			}
		}
		for(var i=0; i<_n; i++){
			for(var z=0; z<(_n-1); z++){
				var pz = instance_create_depth((_start_x/2+_start_x*i)+_start_x/2*_dif,_yy+_start_y+(_start_y*1.2)*z,0,obj_puzzle)
				pz.img = array_pop(data_puzzle)
			}
		}
		for(var i=0; i<(_n-1)+floor(_dif/2)*2; i++){
			for(var z=0; z<_n; z++){
				var pz = instance_create_depth(((_start_x+_start_x*i)+_start_x/2*_dif)-_start_x*floor(_dif/2),_yy+_start_y/2+(_start_y*1.2)*z,0,obj_puzzle)
				pz.img = array_pop(data_puzzle)
			}
		}
	break
	case rm_bag:
		if array_length(global.array_bag) > 0{
			var spacing_x = 280
			var spacing_y = 252
			var start_x = 112
			var start_y = 186
			
			for (var i=0; i<array_length(global.array_bag); i++){
                var obj = asset_get_index(global.array_bag[i])
				var x_pos = start_x+(i mod 7)*spacing_x
				var y_pos = start_y+(i div 7)*spacing_y
                if instance_exists(obj) continue
                instance_create_layer(x_pos,y_pos,"Instances",obj)
                if i == array_length(global.array_bag)-1{
                    var clear = instance_create_layer(room_width/2,room_height-96,"Instances",obj_btn)
                    clear.image_index = 3
                }
			}
		}
	break
}

if file_exists("name_audio.sav"){
	var load = ds_map_secure_load("name_audio.sav")
	for(var i=0; i<100; i++){
		audio_name[i,room] = load[?$"audio_name{[i,room]}"]
	}
}else{
	ds_map_replace(save,$"audio_name{[0,0]}",audio_name[0,0])
	ds_map_secure_save(save,"name_audio.sav")
}