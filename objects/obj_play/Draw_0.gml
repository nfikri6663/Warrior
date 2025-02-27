draw_self()
if file_exists($"Audio_{_id}_{room}.ogg") && _id != -1{
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_color(c_white)
	draw_set_font(fn_marcellus)
	var _h = sprite_height
	draw_text(x,y-_h/1.2,audio_name[_id,room])
	
	if _volume = 1.00{var img = 3}else
	if _volume = 0.75{var img = 2}else
	if _volume = 0.50{var img = 1}else
	if _volume = 0.25{var img = 0}
	if !audio_global{
		if played{
			draw_sprite(spr_slider,img,x+100, y+40);
		}
	}else{
		draw_sprite(spr_slider,img,x+100, y+40);
	}
}

//draw_text(x,y-64,$"{global.audio_play[_id,0][room]}")