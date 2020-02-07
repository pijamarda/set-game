extends Area2D

onready var ficha = get_node("/root/Node2D").fichas.pop_back()
onready var sprite = get_node("/root/Node2D/topright/CollisionShape2D/sprite")

func _ready():	
	var new_img = load(ficha.print_file_name())
	sprite.set_texture(new_img)	

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	var random_name = get_node("/root/Node2D").get_random_sprite_name()	
	var new_img = load(random_name)	
	sprite.set_texture(new_img)
