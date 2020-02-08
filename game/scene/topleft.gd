extends Area2D

onready var sprite = get_node("/root/Node2D/topleft/CollisionShape2D/sprite")
onready var ficha = get_node("/root/Node2D").fichas.pop_back()

func _ready():	
	var new_img = load(ficha.print_file_name())
	sprite.set_texture(new_img)	

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	if get_node("/root/Node2D").fichas.size() > 0: 
		var ficha = get_node("/root/Node2D").fichas.pop_front()
		print(ficha.print_file_name())
		var new_img = load(ficha.print_file_name())
		sprite. set_texture(new_img)
		get_node("/root/Node2D").update_label_text()
