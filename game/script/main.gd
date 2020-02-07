extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var fichas = []

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
	
	fichas.shuffle()
# Called when the node enters the scene tree for the first time.
func _ready():	
	pass


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






















