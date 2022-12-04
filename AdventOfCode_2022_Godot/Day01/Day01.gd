extends Node2D

export var input_path = "res://Day01/Input.txt"

func _ready():
	var calories_packages = run_part_1()
	run_part_2(calories_packages)

# Called when the node enters the scene tree for the first time.
func run_part_1() -> Array:
	var calories_packages = []
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
	return calories_packages

func run_part_2(calories_packages):
	var result = 0
	for _i in range(3):
		result += calories_packages.max()
		calories_packages.erase(calories_packages.max())
	print(result)
