extends Area2D

var new_img = preload("res://img/1-G-R-B.png")

func _input_event(viewport, event, shape_idx):
    if event is InputEventMouseButton \
    and event.button_index == BUTTON_LEFT \
    and event.is_pressed():
        self.on_click()

func on_click():
	print("Click")
	get_node("diamond").set_texture(new_img)
