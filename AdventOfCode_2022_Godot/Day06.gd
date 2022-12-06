extends Node2D

export var input_path = "res://Day06/input.txt"
export var example_path = "res://Day06/Example.txt"
export var use_example = false
export var debug = false

func contains_duplicate(arr : Array):
	for item in arr:
		if arr.count(item) > 1:
			return true
	return false

func get_start_of_packet_index(elv_signal, target_sequence_length = 4):
	var sequence  = []
	
	for i in range(len(elv_signal)):
		sequence.append(elv_signal[i])
		if len(sequence) >= target_sequence_length:
			if not contains_duplicate(sequence):
				if debug:
					print("Start marker sequence : ", sequence)
				return i + 1
			else:
				sequence.pop_front()
	return ERR_DOES_NOT_EXIST

func _ready():
	var signals = parse_input(input_path if not use_example else example_path)
	for elv_signal in signals:
		print("Part 1 Result: ", get_start_of_packet_index(elv_signal))
		print("Part 2 Result: ", get_start_of_packet_index(elv_signal, 14))
		print("########")


func parse_input(path):
	var file = File.new()
	file.open(path, File.READ)
	
	var signals = []
	
	while not file.eof_reached():
		var line = file.get_line()
		if file.eof_reached() and line == "":
			break
		signals.append(line)
	
	return signals
