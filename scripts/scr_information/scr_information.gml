function scr_information_close(arr,index){
    var new_data = []
    for (var i = 0; i < array_length(arr); i++){
        if (i != index){
            array_push(new_data,arr[i])
        }
    }
    return new_data
}