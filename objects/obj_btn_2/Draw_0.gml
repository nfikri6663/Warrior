var _width = sprite_width
var _height = sprite_height
var _c = make_color_rgb(252,249,144)

draw_set_alpha(0.2)
draw_rectangle_color(x-_width/2,y-_height/2,x+_width/2,y+_height/2,_c,_c,_c,_c,false)
draw_set_alpha(1)
draw_rectangle_color(x-_width/2,y-_height/2,x+_width/2,y+_height/2,_c,_c,_c,_c,true)

draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
if global.language != 4{
    draw_set_font(fn_marcellus)
}else{
    draw_set_font(fn_language)
}

if btn = 0{draw_text(x,y,language[global.language].btn_audio)}else
if btn = 1{draw_text(x,y,language[global.language].btn_timer)}else
if btn = 2{draw_text(x,y,language[global.language].btn_bag)}