extends Node2D

export var input_path = "res://Day05/Input.txt"
export var debug = false

func _ready():
	var res = parse_input(input_path)
	var stacks = res[0]
	var commands = res[1]
	print(run_part_1(stacks, commands))

func run_part_1(stacks, commands):
	var result = ""
	if debug:
		print(stacks)
	for command in commands:
		for i in range(command["Ammount"]):
			if len(stacks[command["From"] - 1]) == 0:
				break
			stacks[command["To"] -1].push_front(stacks[command["From"] - 1].pop_front())
		if debug:
			print(command)
			print(stacks)
	
	for stack in stacks:
		if stack != null and len(stack) == 0:
			continue
		result += stack[0]
	return result

func parse_input(path):
	var file = File.new()
	file.open(path, File.READ)
	
	
	var is_stack_done : bool = false
	var stacks = []
	var commands = []
	
	while not file.eof_reached():
		var line = file.get_line()
		if file.eof_reached() and line == "":
			break
		if not is_stack_done:
			if line == "":
				is_stack_done = true
				continue
			if len(stacks) == 0:
				for i in range(len(line) / 4 + 1):
					stacks.append([])
					
			var i = 0
			for j in range(1, len(line), 4):
				if ord(line[j]) >= ord('A') and ord(line[j]) <= ord('Z'):
					stacks[i].push_back(line[j])
				i += 1
		else:
			var new_command = {}
			new_command["Ammount"] = int(line.split("move ")[1].split(" ")[0])
			new_command["From"] = int(line.split(" from ")[1].split(" ")[0])
			new_command["To"] = int(line.split(" to ")[1])
			commands.append(new_command)
	
	return [stacks, commands]
