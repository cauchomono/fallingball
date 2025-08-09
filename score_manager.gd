extends Node2D
var score = 0
var high_score : int
var actual_level = 1
signal level_upgraded
signal score_increased

var saveManager = preload("res://save_manager.gd").new()
@export var points_zone : Area2D
@export var spawner : Node2D

func _ready() -> void:
	points_zone.enemy_passed.connect(_on_enemy_passed) 
	spawner.coin_collect.connect(on_player_touch_coin)
	high_score = saveManager.load_score()
	Globals.high_score = high_score
	
func increase_score( points:int):
	score += points
	Globals.score = score
	score_increased.emit()
	print("Score increased")
	if(score % 10 == 0):
		increase_level()

func increase_level() -> void:
	actual_level += 1
	Globals.level = actual_level
	level_upgraded.emit()
	print("The actual level is: ", actual_level)	


func on_player_touch_coin() -> void:
	print("Im working points")
	increase_score(1)

func _on_enemy_passed() -> void:
	increase_score(1)


func save_high_score():
	if score > high_score:
		saveManager.save_score(score)
