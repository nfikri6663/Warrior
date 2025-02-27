// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_variable_timer(iterasi){
	start = false
	play_color = c_white
	time_color = c_white
	time_choose = c_green
	t_focus = 0
	t_shortB = 2
	t_longB = 4
	focus = true
	shortB = false
	longB = false
	play = false
	sessions = 1
	minute_lf[iterasi] = 0
	minute_rf[iterasi] = 0
	second_lf[iterasi] = 0
	second_rf[iterasi] = 0
	minute_ls[iterasi] = 0
	minute_rs[iterasi] = 0
	second_ls[iterasi] = 0
	second_rs[iterasi] = 0
	minute_ll[iterasi] = 0
	minute_rl[iterasi] = 0
	second_ll[iterasi] = 0
	second_rl[iterasi] = 0
	minute_l_draw[iterasi] = minute_lf[iterasi]
	minute_r_draw[iterasi] = minute_rf[iterasi]
	second_l_draw[iterasi] = second_lf[iterasi]
	second_r_draw[iterasi] = second_rf[iterasi]
	note = ""
	time = room_speed
}