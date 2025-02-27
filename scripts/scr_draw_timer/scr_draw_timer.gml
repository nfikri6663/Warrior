// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_timer(){
	draw_set_alpha(0.5)
	draw_rectangle_color(0,0,room_width,room_height,c_black,c_black,c_black,c_black,0)
	draw_set_alpha(1)
	
	var _time_index = sprite_get_number(spr_set_time)
	var _time_w = sprite_get_width(spr_set_time)
	var _time_h = sprite_get_height(spr_set_time)
	var _time_r = 10
	var _time_fn = font_get_size(fn_time_big)
	
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_color(c_white)
	draw_set_font(fn_time_small)
	
	draw_text((room_width/2)-(_time_r/2*3+_time_w*2),room_height/2-(_time_fn*1.8),"CHOOSE YOUR\nFOCUS TIME")
	draw_text((room_width/2),room_height/2-(_time_fn*1.8),"CHOOSE YOUR\nSHORT BREAK")
	draw_text((room_width/2)+(_time_r/2*3+_time_w*2),room_height/2-(_time_fn*1.8),"CHOOSE YOUR\nLONG BREAK")
	
	for(var i=0; i<_time_index; i++){
		var xx = ((room_width/2+(_time_w/2+_time_r/2))-((_time_w+_time_r)*(_time_index/2)))+((_time_w+_time_r)*i)-_time_w/2
		var yy = (room_height/2-(_time_fn*1.4))-_time_h/2
		if point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+_time_w,yy+_time_h) && !play{
			time_color = c_yellow
			if mouse_check_button_released(mb_left){
				if i == 0{t_focus = 0}else if i == 1{t_focus = 1}
				if i == 2{t_shortB = 2}else if i == 3{t_shortB = 3}
				if i == 4{t_longB = 4}else if i == 5{t_longB = 5}
				
				second_l[0] = 0
				second_r[0] = 0
			}
		}else{
			time_color = c_white
		}
		
		if i == t_focus{
			draw_sprite_ext(spr_set_time,i,xx+(_time_w/2),yy+(_time_h/2),1,1,0,time_choose,1)
		}else
		if i == t_shortB{
			draw_sprite_ext(spr_set_time,i,xx+(_time_w/2),yy+(_time_h/2),1,1,0,time_choose,1)
		}else
		if i == t_longB{
			draw_sprite_ext(spr_set_time,i,xx+(_time_w/2),yy+(_time_h/2),1,1,0,time_choose,1)
		}else{
			draw_sprite_ext(spr_set_time,i,xx+(_time_w/2),yy+(_time_h/2),1,1,0,time_color,1)
		}
	}
	
	draw_set_font(fn_time_big)
	
	draw_text(room_width/2,room_height/2-_time_fn*0.25,$"{minute_l_draw[0]}{minute_r_draw[0]}:{second_l_draw[0]}{second_r_draw[0]}")
	draw_set_font(fn_time_medium)
	draw_text(room_width/2,room_height/2+_time_fn*0.5,note)

	var _play_index = 3
	var _play_w = sprite_get_width(spr_btn_time)
	var _play_h = sprite_get_height(spr_btn_time)
	var _play_r = 10
	for(var i=0; i<_play_index; i++){
		var xx = (room_width/2+(_play_w/2+_play_r/2))-((_play_w+_play_r)*(_play_index/2))+((_play_w+_play_r)*i)-_play_w/2
		var yy = room_height/2+(_time_fn*1.4)-(_play_h/2)
		if point_in_rectangle(mouse_x,mouse_y,xx,yy,xx+_play_w,yy+_play_h){
			play_color = c_yellow
			if mouse_check_button_released(mb_left){
				if i == 0{
					focus = true
					shortB = false
					longB = false
					play = false
					sessions = 1
					start = false
					minute_l_draw[0] = minute_lf[0]
					minute_r_draw[0] = minute_rf[0]
					second_l_draw[0] = second_lf[0]
					second_r_draw[0] = second_rf[0]
				}else
				if i == 1{if play{play = false}else{play = true start = true}}else
				if i == 2{
					minute_l_draw[0] = 0
					minute_r_draw[0] = 0
					second_l_draw[0] = 0
					second_r_draw[0] = -1
				}
			}
		}else{
			play_color = c_white
		}
		
		if i != 1{
			draw_sprite_ext(spr_btn_time,i,xx+(_play_w/2),room_height/2+(_time_fn*1.4),1,1,0,play_color,1)
		}else{
			if !play{
				draw_sprite_ext(spr_btn_time,1,xx+(_play_w/2),room_height/2+(_time_fn*1.4),1,1,0,play_color,1)
			}else{
				draw_sprite_ext(spr_btn_time,3,xx+(_play_w/2),room_height/2+(_time_fn*1.4),1,1,0,play_color,1)
			}
		}
	}
	
	draw_set_font(fn_time_small)
	draw_text((room_width/2),room_height/2+(_time_fn*1.95),$"{sessions} of 4\nsessions")
}