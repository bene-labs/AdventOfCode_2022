extends Node2D

export var input_path = "res://Day03/Input.txt"
export var debug = false

func _ready():
	print(run_part_2())

func get_item_priority(item) -> int:
	if ord(item) >= ord('A') and ord(item) <= ord('Z'):
		return ord(item) - ord('A') + 27
	else:
		return ord(item) - ord('a') + 1

func run_part_1():
	var file = File.new()
	file.open(input_path, File.READ)
	
	var result = 0
	while not file.eof_reached():
		var line = file.get_line()
		if file.eof_reached() and line == "":
			break
		var compartment1 = line.substr(0, len(line) / 2)
		var compartment2 = line.substr(len(line) / 2, len(line) / 2)
		
		for item in compartment1:
			if item in compartment2:
				result += get_item_priority(item)
				if debug:
					print("Found '%c' in '%s' and '%s'" % [item, compartment1, compartment2])
					print("Priority: %d" % get_item_priority(item))
				break
	return result

func run_part_2():
	var file = File.new()
	file.open(input_path, File.READ)
	
	var result = 0
	while not file.eof_reached():
		var group = []
		for _i in range(3):
			var line = file.get_line()
			if file.eof_reached() and line == "":
				return result
			group.append(line)
		result += get_group_badge(group)
	
	return result

func get_group_badge(group):
	for item1 in group[0]:
		for item2 in group[1]:
			if item1 == item2 and item1 in group[2] and item2 in group[2]:
				return(get_item_priority(item1))
