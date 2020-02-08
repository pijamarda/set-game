class_name Ficha

var number
var color
var shape
var fill

func _init(n,c,s,f):
	number = n
	color = c
	shape = s
	fill = f
	
func print_file_name():
	var final_string = "res://img/img-128x128/" + number+ "-"+color+"-"+shape+"-"+fill + ".png"
	return final_string
	
func print_name_simple():
	var final_string = number+ "-"+color+"-"+shape+"-"+fill
	return final_string

