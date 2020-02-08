extends Area2D


var selected = false

func _ready():	
	#var new_img = load(ficha.print_file_name())
	#sprite.set_texture(new_img)
	pass

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		pass
		#self.on_click()

func on_click():
	var num_sel = get_node("/root/Node2D").get_num_selected()
	var mainNode = get_node("/root/Node2D")
	print("added  1")
	if (!selected):
		if num_sel < 3:
			selected = true
			mainNode.add_selections(1)
			print("added  1")
