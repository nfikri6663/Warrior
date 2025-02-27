// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_set_timer(){
	if t_focus == 0{
		minute_lf[0] = 2
		minute_rf[0] = 5
	}else{
		minute_lf[0] = 4
		minute_rf[0] = 5
	}

	if t_shortB == 2{
		minute_ls[0] = 0
		minute_rs[0] = 5
	}else{
		minute_ls[0] = 1
		minute_rs[0] = 0
	}

	if t_longB == 4{
		minute_ll[0] = 1
		minute_rl[0] = 5
	}else{
		minute_ll[0] = 3
		minute_rl[0] = 0
	}

	if !play && !start{
		minute_l_draw[0] = minute_lf[0]
		minute_r_draw[0] = minute_rf[0]
		second_l_draw[0] = second_lf[0]
		second_r_draw[0] = second_rf[0]
	}

	if focus{note = "FOCUS TIME"}else
	if shortB{note = "SHORT BREAK"}else
	if longB{note = "LONG BREAK"}
}