extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var fichas = []
var tablero = []

func _init():
	var Fichas = load("res://script/ficha.gd")
	fichas.append(Fichas.new("1","G","D","B"))
	fichas.append(Fichas.new("1","G","D","F"))
	fichas.append(Fichas.new("1","G","D","L"))
	fichas.append(Fichas.new("1","G","R","B"))
	
	fichas.append(Fichas.new("1","G","R","F"))
	fichas.append(Fichas.new("1","G","R","L"))
	fichas.append(Fichas.new("1","G","S","B"))
	fichas.append(Fichas.new("1","G","S","F"))
	
	fichas.append(Fichas.new("1","G","S","L"))
	fichas.append(Fichas.new("1","P","D","B"))
	fichas.append(Fichas.new("1","P","D","F"))
	fichas.append(Fichas.new("1","P","D","L"))
	
	fichas.append(Fichas.new("1","P","R","B"))
	fichas.append(Fichas.new("1","P","R","F"))
	fichas.append(Fichas.new("1","P","R","L"))
	fichas.append(Fichas.new("1","P","S","B"))
	
	fichas.append(Fichas.new("1","P","S","F"))
	fichas.append(Fichas.new("1","P","S","L"))
	fichas.append(Fichas.new("1","R","D","B"))
	fichas.append(Fichas.new("1","R","D","F"))
	
	fichas.append(Fichas.new("1","R","D","L"))
	fichas.append(Fichas.new("1","R","R","B"))
	fichas.append(Fichas.new("1","R","R","F"))
	fichas.append(Fichas.new("1","R","R","L"))
	
	fichas.append(Fichas.new("1","R","S","B"))
	fichas.append(Fichas.new("1","R","S","F"))
	fichas.append(Fichas.new("1","R","S","L"))
	fichas.append(Fichas.new("2","G","D","B"))
	
	fichas.append(Fichas.new("2","G","D","F"))
	fichas.append(Fichas.new("2","G","D","L"))
	fichas.append(Fichas.new("2","G","R","B"))
	fichas.append(Fichas.new("2","G","R","F"))
	
	fichas.append(Fichas.new("2","G","R","L"))
	fichas.append(Fichas.new("2","G","S","B"))
	fichas.append(Fichas.new("2","G","S","F"))
	fichas.append(Fichas.new("2","G","S","L"))
	
	fichas.append(Fichas.new("2","P","D","B"))
	fichas.append(Fichas.new("2","P","D","F"))
	fichas.append(Fichas.new("2","P","D","L"))
	fichas.append(Fichas.new("2","P","R","B"))
	
	fichas.append(Fichas.new("2","P","R","F"))
	fichas.append(Fichas.new("2","P","R","L"))
	fichas.append(Fichas.new("2","P","S","B"))
	fichas.append(Fichas.new("2","P","S","F"))
	
	fichas.append(Fichas.new("2","P","S","L"))
	fichas.append(Fichas.new("2","R","D","B"))
	fichas.append(Fichas.new("2","R","D","F"))
	fichas.append(Fichas.new("2","R","D","L"))
	
	fichas.append(Fichas.new("2","R","R","B"))
	fichas.append(Fichas.new("2","R","R","F"))
	fichas.append(Fichas.new("2","R","R","L"))
	fichas.append(Fichas.new("2","R","S","B"))
	fichas.append(Fichas.new("2","R","S","F"))
	fichas.append(Fichas.new("2","R","S","L"))
	
	fichas.shuffle()
	
# Called when the node enters the scene tree for the first time.
func _ready():	
	
	
	for i in range(0,12):
		
		tablero.append(fichas.pop_front())
		
	update_tablero_text()
	update_label_text()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

	
func get_random_sprite_name():
	var num_random = randi()%3+1
	var number
	var color
	var form
	var fill
	if num_random == 1:
		number = "1"
	elif num_random == 2:
		number = "2"
	else:
		number = "3"

	num_random = randi()%3+1
	if num_random == 1:
		color = "G"
	elif num_random == 2:
		color = "P"
	else:
		color = "R"
		
	num_random = randi()%3+1
	if num_random == 1:
		form = "R"
	elif num_random == 2:
		form = "D"
	else:
		form = "S"
		
	num_random = randi()%3+1
	if num_random == 1:
		fill = "F"
	elif num_random == 2:
		fill = "B"
	else:
		fill = "L"
		
	#print(num_random)
	var final_string = "res://img/img-128x128/" + number+ "-"+color+"-"+form+"-"+fill + ".png"
	#print(final_string)
	return final_string

func update_label_text():
	var tmp_text = ""
	var iterator = 0
	for i in fichas:
		tmp_text = tmp_text + i.print_name_simple() + "\n"
		iterator = iterator + 1
	get_node("helper/cardlist_label").set_text(tmp_text)
	
func update_tablero_text():
	var tmp_text = ""
	var iterator = 0
	for i in tablero:
		if iterator == 3 or iterator == 6 or iterator == 9:
			tmp_text = tmp_text + "\n"
		tmp_text = tmp_text + i.print_name_simple()
		iterator = iterator + 1
	get_node("helper/tablero_label").set_text(tmp_text)
	
func restart():
	fichas.clear()
	var Fichas = load("res://script/ficha.gd")
	fichas.append(Fichas.new("1","G","D","B"))
	fichas.append(Fichas.new("1","G","D","F"))
	fichas.append(Fichas.new("1","G","D","L"))
	fichas.append(Fichas.new("1","G","R","B"))
	
	fichas.append(Fichas.new("1","G","R","F"))
	fichas.append(Fichas.new("1","G","R","L"))
	fichas.append(Fichas.new("1","G","S","B"))
	fichas.append(Fichas.new("1","G","S","F"))
	
	fichas.append(Fichas.new("1","G","S","L"))
	fichas.append(Fichas.new("1","P","D","B"))
	fichas.append(Fichas.new("1","P","D","F"))
	fichas.append(Fichas.new("1","P","D","L"))
	
	fichas.append(Fichas.new("1","P","R","B"))
	fichas.append(Fichas.new("1","P","R","F"))
	fichas.append(Fichas.new("1","P","R","L"))
	fichas.append(Fichas.new("1","P","S","B"))
	
	fichas.shuffle()
	update_label_text()




func _on_Button_pressed():
	restart()
