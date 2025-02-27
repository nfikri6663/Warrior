function scr_array_check_obj(array,object){
    var key = object_get_name(object)
    for (var i = 0; i < array_length(array); i++){
        if array[i] == key{
            return true
        }
    }
    return false
}

function scr_array_push_obj(){
    var array = global.array_bag
    var key = object_get_name(object_index)

    if room != rm_bag{
        if array_length(array) < 21{
            if !scr_array_check_obj(array,object_index){
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