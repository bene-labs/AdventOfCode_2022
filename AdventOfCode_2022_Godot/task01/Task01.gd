extends Node2D

export var input_path = "res://task01/Input.txt"

var calories_packages = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var input = File.new()
	input.open(input_path, File.READ)
	
	while not input.eof_reached():
		var calories_package = 0
		var line = input.get_line()
		while not line == "" and not input.eof_reached():
			calories_package += int(line)
			line = input.get_line()
		calories_packages.append(calories_package)
		
	print(calories_packages.max())
