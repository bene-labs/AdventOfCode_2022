extends Node2D

export var input_path = "res://Day04/Input.txt"

func _ready():
	var section_pairs = get_section_pairs(input_path)
#	for pair in section_pairs:
#		print(pair)
	print("Part 1 Solution: ", get_duplicate_sections_count(section_pairs))
	print("Part 2 Solution: ", get_section_overlap_count(section_pairs))
	

func get_section_pairs(path):
	var file = File.new()
	file.open(path, File.READ)
	
	var pairs = []

	while not file.eof_reached():
		var line = file.get_line()
		if file.eof_reached() and line == "":
			break
		var range1 = line.split(',')[0]
		var range2 = line.split(',')[1]
		
		var section1 = []
		var section2 = []
		
		for i in range(int(range1.split('-')[0]), int(range1.split('-')[1]) + 1, 1):
			 section1.append(i)
		for i in range(int(range2.split('-')[0]), int(range2.split('-')[1]) + 1, 1):
			 section2.append(i)
		pairs.append([section1, section2])
	return pairs

# Part 1
func get_duplicate_sections_count(section_pairs):
	var result = 0
	for pair in section_pairs:
		if (pair[0][0] >= pair[1][0] and pair[0][-1] <= pair[1][-1]) \
			or (pair[1][0] >= pair[0][0] and pair[1][-1] <= pair[0][-1]):
				result += 1
	return result

func get_section_overlap_count(section_pairs):
	var result = 0
	for pair in section_pairs:
		if len(pair[0]) >= len(pair[1]):
			for value in pair[0]:
				if value in pair[1]:
					result += 1
					break
		else:
			for value in pair[1]:
				if value in pair[0]:
					result += 1
					break
	return result
