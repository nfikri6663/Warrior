if open{
	if img_open = global.image_1{
		if image_index != global.image_1{
			if image_xscale > 0{image_xscale -= 0.1}else{image_index = global.image_1 image_xscale = 1}
		}
	}else
	if img_open = global.image_2{
		if image_index != global.image_2{
			if image_xscale > 0{image_xscale -= 0.1}else{image_index = global.image_2 image_xscale = 1}
		}
	}
}else{
	if img_open = -1{
		if image_index != 0{
			if image_xscale > 0{image_xscale -= 0.1}else{image_index = 0 image_xscale = 1}
		}
	}
}

if _delete{
	if image_xscale != 0{image_xscale -= 0.1}else{instance_destroy()}
	image_yscale = image_xscale
}