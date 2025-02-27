//Retrieving all data from database
if async_load[? "status"] == 200{
    switch (async_load[? "type"]){
        case "FirebaseFirestore_Collection_Listener":
            FirebaseFirestore(root).Query()
            break
        case "FirebaseFirestore_Collection_Query":
            data = []
            
            var _doc = async_load[? "value"]
            var _data = json_parse(_doc)
            var _info = variable_struct_get_names(_data)
            
            for (var i = 0; i < array_length(_info); i++;){
                var _doc = variable_struct_get(_data,_info[i])
                _doc.id = _info[i]
                array_push(data,_doc)
            }
            break
    }
}