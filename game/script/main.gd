extends Node2D



var fichas = []
var tablero = []
var num_selected = 0
var selections = []

func _init():
	init_fichas()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	
	for i in range(0,12):
		tablero.append(fichas.pop_front())
		
	update_tablero_text()
	update_label_text()
	

func get_num_selected():
	return num_selected
func add_num_selected():
	num_selected = num_selected + 1
func sub_num_selected():
	num_selected = num_selected - 1
func add_selections(n):
	selections.append(n)
	add_num_selected()
	if num_selected > 2:
		var resul = solver_params(tablero[selections[0]],tablero[selections[1]],tablero[selections[2]])
		if resul:
			print("hay algo")
			get_node("helper/solver_label").set_text("YES!!!!!!")
		else:
			print("nada")
			get_node("helper/solver_label").set_text("NOU :-(")
		num_selected = 0
		
		selections.clear()
		clear_buttons()

func clear_buttons():
	get_node("topleft").clear_button()
	get_node("topmiddle1").clear_button()
	get_node("topmiddle2").clear_button()
	get_node("topright").clear_button()
	get_node("centerleft").clear_button()
	get_node("centermiddle1").clear_button()
	get_node("centermiddle2").clear_button()
	get_node("centerright").clear_button()
	get_node("bottomleft").clear_button()
	get_node("bottommiddle1").clear_button()
	get_node("bottommiddle2").clear_button()
	get_node("bottomright").clear_button()

func solver():
	
	var result = true
	
	var ficha1
	var ficha2
	var ficha3
	
	ficha1 = tablero[0]
	ficha2 = tablero[1]
	ficha3 = tablero[2]
	
	if ficha1.get_n() == ficha2.get_n() and ficha1.get_n() != ficha3.get_n():
		result = false
	if ficha1.get_c() == ficha2.get_c() and ficha1.get_c() != ficha3.get_c():
		result = false
	if ficha1.get_s() == ficha2.get_s() and ficha1.get_s() != ficha3.get_s():
		result = false
	if ficha1.get_f() == ficha2.get_f() and ficha1.get_f() != ficha3.get_f():
		result = false
	
	if ficha2.get_n() == ficha3.get_n() and ficha2.get_n() != ficha1.get_n():
		result = false
	if ficha2.get_c() == ficha3.get_c() and ficha2.get_c() != ficha1.get_c():
		result = false
	if ficha2.get_s() == ficha3.get_s() and ficha2.get_s() != ficha1.get_s():
		result = false
	if ficha2.get_f() == ficha3.get_f() and ficha2.get_f() != ficha1.get_f():
		result = false
		
	if ficha1.get_n() == ficha3.get_n() and ficha2.get_n() != ficha1.get_n():
		result = false
	if ficha1.get_c() == ficha3.get_c() and ficha2.get_c() != ficha1.get_c():
		result = false
	if ficha1.get_s() == ficha3.get_s() and ficha2.get_s() != ficha1.get_s():
		result = false
	if ficha1.get_f() == ficha3.get_f() and ficha2.get_f() != ficha1.get_f():
		result = false
	return result
	
func solver_params(t1, t2, t3):
	
	var result = true
	
	var ficha1
	var ficha2
	var ficha3
	
	ficha1 = t1
	ficha2 = t2
	ficha3 = t3
	
	if ficha1.get_n() == ficha2.get_n() and ficha1.get_n() != ficha3.get_n():
		result = false
	if ficha1.get_c() == ficha2.get_c() and ficha1.get_c() != ficha3.get_c():
		result = false
	if ficha1.get_s() == ficha2.get_s() and ficha1.get_s() != ficha3.get_s():
		result = false
	if ficha1.get_f() == ficha2.get_f() and ficha1.get_f() != ficha3.get_f():
		result = false
	
	if ficha2.get_n() == ficha3.get_n() and ficha2.get_n() != ficha1.get_n():
		result = false
	if ficha2.get_c() == ficha3.get_c() and ficha2.get_c() != ficha1.get_c():
		result = false
	if ficha2.get_s() == ficha3.get_s() and ficha2.get_s() != ficha1.get_s():
		result = false
	if ficha2.get_f() == ficha3.get_f() and ficha2.get_f() != ficha1.get_f():
		result = false
		
	if ficha1.get_n() == ficha3.get_n() and ficha2.get_n() != ficha1.get_n():
		result = false
	if ficha1.get_c() == ficha3.get_c() and ficha2.get_c() != ficha1.get_c():
		result = false
	if ficha1.get_s() == ficha3.get_s() and ficha2.get_s() != ficha1.get_s():
		result = false
	if ficha1.get_f() == ficha3.get_f() and ficha2.get_f() != ficha1.get_f():
		result = false
	return result
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
		if iterator == 4 or iterator == 8:
			tmp_text = tmp_text + "\n\n"
		tmp_text = tmp_text + i.print_name_simple() + "  "
		
		iterator = iterator + 1
	get_node("helper/tablero_label").set_text(tmp_text)
	
	var new_img = load(tablero[0].print_file_name())
	get_node("topleft/CollisionShape2D/sprite").set_texture(new_img)
	new_img = load(tablero[1].print_file_name())
	get_node("topmiddle1/CollisionShape2D/sprite").set_texture(new_img)
	new_img = load(tablero[2].print_file_name())
	get_node("topmiddle2/CollisionShape2D/sprite").set_texture(new_img)
	new_img = load(tablero[3].print_file_name())
	get_node("topright/CollisionShape2D/sprite").set_texture(new_img)
	new_img = load(tablero[4].print_file_name())
	get_node("centerleft/CollisionShape2D/sprite").set_texture(new_img)
	new_img = load(tablero[5].print_file_name())
	get_node("centermiddle1/CollisionShape2D/sprite").set_texture(new_img)
	new_img = load(tablero[6].print_file_name())
	get_node("centermiddle2/CollisionShape2D/sprite").set_texture(new_img)
	new_img = load(tablero[7].print_file_name())
	get_node("centerright/CollisionShape2D/sprite").set_texture(new_img)
	new_img = load(tablero[8].print_file_name())
	get_node("bottomleft/CollisionShape2D/sprite").set_texture(new_img)
	new_img = load(tablero[9].print_file_name())
	get_node("bottommiddle1/CollisionShape2D/sprite").set_texture(new_img)
	new_img = load(tablero[10].print_file_name())
	get_node("bottommiddle2/CollisionShape2D/sprite").set_texture(new_img)
	new_img = load(tablero[11].print_file_name())
	get_node("bottomright/CollisionShape2D/sprite").set_texture(new_img)
	
func restart():
	fichas.clear()
	init_fichas()
	update_label_text()
	tablero.clear()
	for i in range(0,12):
		tablero.append(fichas.pop_front())
	update_tablero_text()
	update_label_text()
	solver_params(tablero[0],tablero[1],tablero[2])
	
func _on_Button_pressed():
	restart()
	var resultado = solver_params(tablero[0],tablero[1],tablero[2])
	if resultado:
		print("hay algo")
	else:
		print("nada")
	
func init_fichas():
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
	
	fichas.append(Fichas.new("3","G","D","B"))
	fichas.append(Fichas.new("3","G","D","F"))
	fichas.append(Fichas.new("3","G","D","L"))
	fichas.append(Fichas.new("3","G","R","B"))
	fichas.append(Fichas.new("3","G","R","F"))
	fichas.append(Fichas.new("3","G","R","L"))
	
	fichas.append(Fichas.new("3","G","S","B"))
	fichas.append(Fichas.new("3","G","S","F"))
	fichas.append(Fichas.new("3","G","S","L"))
	fichas.append(Fichas.new("3","P","D","B"))
	fichas.append(Fichas.new("3","P","D","F"))
	fichas.append(Fichas.new("3","P","D","L"))
	
	fichas.append(Fichas.new("3","P","R","B"))
	fichas.append(Fichas.new("3","P","R","F"))
	fichas.append(Fichas.new("3","P","R","L"))
	fichas.append(Fichas.new("3","P","S","B"))
	fichas.append(Fichas.new("3","P","S","F"))
	fichas.append(Fichas.new("3","P","S","L"))
	
	fichas.append(Fichas.new("3","R","D","B"))
	fichas.append(Fichas.new("3","R","D","F"))
	fichas.append(Fichas.new("3","R","D","L"))
	fichas.append(Fichas.new("3","R","R","B"))
	fichas.append(Fichas.new("3","R","R","F"))
	fichas.append(Fichas.new("3","R","R","L"))
	
	fichas.append(Fichas.new("3","R","S","B"))
	fichas.append(Fichas.new("3","R","S","F"))
	fichas.append(Fichas.new("3","R","S","L"))
	
	fichas.shuffle()


func _on_button_solver_pressed():

	var resultado = solver()
	if resultado:
		print("hay algo")
	else:
		print("nada")
	
	
	
