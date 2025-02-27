function scr_array_check(array,sprite,image){
    var key = sprite_get_name(sprite)+":"+string(image)
    for (var i = 0; i < array_length(array); i++){
        if array[i] == key {
            return true
        }
    }
    return false
}

function scr_array_push(){
    var array = global.array_bag
    var sprite = sprite_index
    var image = image_index
    var key = sprite_get_name(sprite)+":"+string(image)

    if room != rm_bag{
        if array_length(array) < 21{
            if !scr_array_check(array,sprite,image){
                array_push(array, key)
                show_message("This object has been added to the bag")
                var json_string = json_stringify(global.array_bag)
                ds_map_replace(save,"my_array",json_string)
                ds_map_secure_save(save,filename)
            }else{
                show_message("This object is already in the bag")
            }
        }else{
            show_message("The bag is full")
        }
    }
}

function scr_index_conversion(index){
    var array = global.array_bag
    if index >= 0 && index < array_length(array){
        var key = array[index]
        var parts = string_split(key,":")
        var sprite = parts[0]
        var image = real(parts[1])
        return [sprite,image]
    }else{
        return undefined
    }
}

function scr_get_array_bag(obj,index){
    var result = scr_index_conversion(index)
    if result != undefined {
        obj.sprite_index = asset_get_index(result[0])
        obj.image_index = result[1]
    }
}





