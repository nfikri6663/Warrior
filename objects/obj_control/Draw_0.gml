switch room{
	case rm_menu:
        var _width = sprite_get_width(spr_btn)
        var _height = sprite_get_height(spr_btn)
		for(var i=0; i<5; i++){
			draw_sprite(spr_flag,i,room_width-(_width+134)+(16+35)*i,64)
			if mouse_check_button_pressed(mb_left){
				if point_in_rectangle(mouse_x,mouse_y,room_width-(_width+134)-17.5+(16+35)*i,64-17.5,room_width-(_width+134)+17.5+(16+35)*i,64+17.5){
					global.language = i
				}
			}
		}
	break
	case rm_puzzle: //Button in Room Puzzle
		var _width = sprite_get_width(spr_btn_difficult)
		var _height = sprite_get_height(spr_btn_difficult)
		draw_set_halign(fa_center)
		draw_set_valign(fa_middle)
		draw_set_color(c_white)
		draw_set_font(fn_marcellus)
		draw_text(_width/2,_height,$"MOVES: {global.moves}")
		
		draw_text(room_width-_width/2,_height*2.2,$"TIME:\n{minute_l_draw[1]}{minute_r_draw[1]}:{second_l_draw[1]}{second_r_draw[1]}")
		
		if !instance_exists(obj_puzzle){
			if audio_puzle_losewin{
				audio_play_sound(sn_win,1,0)
				audio_puzle_losewin = false
			}
			
			draw_set_alpha(0.5)
			draw_rectangle_color(0,0,room_width,room_height,c_black,c_black,c_black,c_black,false)
			draw_set_alpha(1)
			var _height = sprite_get_height(spr_btn_difficult)
			draw_text(room_width/2,room_height/2,"Congratulations\nPress Enter to return to menu")
			if keyboard_check_pressed(vk_enter){
				room_goto(rm_menu)
				global.moves = 0
			}
		}else
		if minute_r_draw[1] == 0 && second_l_draw[1] == 0 && second_r_draw[1] == 0{
			if audio_puzle_losewin{
				audio_play_sound(sn_lose,1,0)
				audio_puzle_losewin = false
			}
			
			draw_set_alpha(0.5)
			draw_rectangle_color(0,0,room_width,room_height,c_black,c_black,c_black,c_black,false)
			draw_set_alpha(1)
			var _height = sprite_get_height(spr_btn_difficult)
			draw_text(room_width/2,room_height/2,"You failed!\nPress Enter to restart")
			if keyboard_check_pressed(vk_enter){
				room_restart()
				global.moves = 0
			}
		}
	break
	case rm_timer:
		scr_draw_timer()
	break
}