switch sprite_index{
	case spr_btn: //Button in Room Menu
		switch image_index{
			case 0: //Start Puzzle
				room_goto(rm_puzzle)
			break
			case 1: //Back
				room_goto(rm_menu)
			break
			case 2: //Link
				game_restart()
			break
			case 3: //Clear Bag
				if show_question("Do you want to delete objects in the bag?"){
					global.array_bag = []
					var json_string = json_stringify(global.array_bag)
					ds_map_replace(save, "my_array", json_string)
					ds_map_secure_save(save,filename)
				}
			break
		}
	break
	case spr_btn_difficult: //Button in Room Puzzle
		if instance_exists(obj_puzzle){
			switch image_index{
				case 0: //Easy
					global.difficult = 0
					room_restart()
				break
				case 1: //Difficult
					global.difficult = 1
					room_restart()
				break
				case 2: //Hard
					global.difficult = 2
					room_restart()
				break
				case 3: //Restart
					room_restart()
				break
			}
		}
	break
}