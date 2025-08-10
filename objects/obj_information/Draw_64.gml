//Displays a notification if there is data taken from the database
if room != rm_menu exit
for (var i = 0; i < array_length(data); i++){
    if data[i].text == "" || data[i].link == ""{
        array_delete(data,i,1)
        continue
    }
    
    _text = data[i].text
    _link = data[i].link
    
    var _width = sprite_get_width(spr_information)
    var _height = sprite_get_height(spr_information)
    var _wuse = _width*0.75
    var _huse = _height*1.2
    var _xi = 80
    var _yi = 224+_huse*i
    
    draw_sprite(spr_information,0,_xi,_yi)
    draw_set_halign(fa_left)
    draw_set_valign(fa_middle)
    draw_set_color(c_white)
    draw_set_font(fn_information)
    draw_text_ext(_xi+80,_yi,$"{_text}: {_link}",18,_wuse)
    
    if mouse_check_button_pressed(mb_left){
        if point_in_rectangle(mouse_x,mouse_y,_xi,_yi-_height/2,_xi+_width-32,_yi+_height/2){
            url_open($"http://{_link}")
        }
        
        if point_in_rectangle(mouse_x,mouse_y,_xi+_width-32,_yi-_height/2,_xi+_width,_yi+_height/2){
            data = scr_information_close(data,i)
        }
    }
}