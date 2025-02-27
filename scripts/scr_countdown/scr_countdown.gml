// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_countdown(iterasi){
	if time > 0{time -= 1}else{second_r_draw[iterasi] -= 1 time = room_speed}
	if second_l_draw[iterasi] != 0 && second_r_draw[iterasi] <= -1{
		second_l_draw[iterasi] -= 1
		second_r_draw[iterasi] = 9
	}
	if second_l_draw[iterasi] == 0 && second_r_draw[iterasi] <= -1{
		minute_r_draw[iterasi] -= 1
		second_l_draw[iterasi] = 5
		second_r_draw[iterasi] = 9
	}
	if minute_l_draw[iterasi] != 0 && minute_r_draw[iterasi] <= -1{
		minute_l_draw[iterasi] -= 1
		minute_r_draw[iterasi] = 9
	}
	if minute_l_draw[iterasi] == 0 && minute_r_draw[iterasi] <= -1{
		if sessions < 4{
			if focus{
				focus = false
				shortB = true
				minute_l_draw[iterasi] = minute_ls[iterasi]
				minute_r_draw[iterasi] = minute_rs[iterasi]
				second_l_draw[iterasi] = second_ls[iterasi]
				second_r_draw[iterasi] = second_rs[iterasi]
				if iterasi != 1{audio_play_sound(sn_rest_finished,1,0)}
			}else{
				sessions += 1
				focus = true
				shortB = false
				minute_l_draw[iterasi] = minute_lf[iterasi]
				minute_r_draw[iterasi] = minute_rf[iterasi]
				second_l_draw[iterasi] = second_lf[iterasi]
				second_r_draw[iterasi] = second_rf[iterasi]
				if iterasi != 1{audio_play_sound(sn_any_breaks_finished,1,0)}
			}
		}else{
			if focus{
				focus = false
				shortB = false
				longB = true
				minute_l_draw[iterasi] = minute_ll[iterasi]
				minute_r_draw[iterasi] = minute_rl[iterasi]
				second_l_draw[iterasi] = second_ll[iterasi]
				second_r_draw[iterasi] = second_rl[iterasi]
				if iterasi != 1{audio_play_sound(sn_rest_finished,1,0)}
			}else{
				sessions = 1
				focus = true
				shortB = false
				minute_l_draw[iterasi] = minute_lf[iterasi]
				minute_r_draw[iterasi] = minute_rf[iterasi]
				second_l_draw[iterasi] = second_lf[iterasi]
				second_r_draw[iterasi] = second_rf[iterasi]
				if iterasi != 1{audio_play_sound(sn_any_breaks_finished,1,0)}
			}
		}
	}
}