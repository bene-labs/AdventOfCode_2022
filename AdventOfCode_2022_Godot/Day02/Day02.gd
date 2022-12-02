extends Node2D

enum{ENEMY_ROCK = ord('A'), ENEMY_PAPER = ord('B'), ENEMY_SCISSORS = ord('C')}
enum{FRIENDLY_ROCK = ord('X'), FRIENDLY_PAPER = ord('Y'), FRIENDLY_SCISSORS = ord('Z')}
enum{LOSE = ord('X'), TIE = ord('Y'), WIN = ord('Z')}


export var input_path = "res://Day02/Input.txt"

# Called when the node enters the scene tree for the first time.
func _ready():
	print (run_task_2())

func run_task_1():
	var file = File.new()
	file.open(input_path, File.READ)
	var total_score = 0
	
	while not file.eof_reached():
		var line = file.get_line()
		if file.eof_reached():
			break
		var enemy_move = ord(line[0])
		var friendly_move = ord(line[2])

		var points = 1 if friendly_move == FRIENDLY_ROCK else 2 if friendly_move == FRIENDLY_PAPER else 3
		
		if (friendly_move == FRIENDLY_ROCK and enemy_move == ENEMY_SCISSORS) \
			or (friendly_move == FRIENDLY_PAPER and enemy_move == ENEMY_ROCK) \
			or (friendly_move == FRIENDLY_SCISSORS and enemy_move == ENEMY_PAPER):
				points += 6
		elif (friendly_move == FRIENDLY_ROCK and enemy_move == ENEMY_ROCK) \
			or (friendly_move == FRIENDLY_PAPER and enemy_move == ENEMY_PAPER) \
			or (friendly_move == FRIENDLY_SCISSORS and enemy_move == ENEMY_SCISSORS):
				points += 3
		total_score += points
	file.close()
	return total_score

func run_task_2():
	var file = File.new()
	file.open(input_path, File.READ)
	var total_score = 0
	
	while not file.eof_reached():
		var line = file.get_line()
		if file.eof_reached():
			break
		var enemy_move = ord(line[0])
		var strategy = ord(line[2])

		var points = 6 if strategy == WIN else 3 if strategy == TIE else 0
		if strategy == WIN:	
			points += 1 if enemy_move == ENEMY_SCISSORS else 2 if enemy_move == ENEMY_ROCK else 3
		elif strategy == TIE:
			points += 1 if enemy_move == ENEMY_ROCK else 2 if enemy_move == ENEMY_PAPER else 3
		else:
			points += 1 if enemy_move == ENEMY_PAPER else 2 if enemy_move == ENEMY_SCISSORS else 3
		total_score += points
	file.close()
	return total_score
