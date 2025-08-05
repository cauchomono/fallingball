extends Node2D

@onready var audioStreamPlayer : AudioStreamPlayer = $AudioStreamPlayer
var score = 0
var gameplaySound = preload("res://sounds/music/Ludum Dare 28 01.ogg")
var scoreManager = preload("res://save_file.gd").new()
var coin = preload("res://coin.gd").new()
var high_score : int


func _ready():
	high_score = scoreManager.load_score()
	audioStreamPlayer.stream = gameplaySound
	audioStreamPlayer.play()
	$Background2/HighScore.text = "High Score: " + str(high_score)
	$PointsZone.enemy_passed.connect(_on_enemy_passed) 
	$Spawner.obstacle_hit.connect(_on_player_touch)
	$BallPlayer.died.connect(game_over)
	$Spawner.coin_collect.connect(on_player_touch_coin)
	
func _on_enemy_passed() -> void:
	increase_score(1)

func _on_player_touch() -> void:
		game_over()
		

func on_player_touch_coin() -> void:
	print("Im working points")
	increase_score(1)
	
	
func increase_score( points:int):
	score += points
	Globals.points = score
	$Background2/Score.text = "Score: " + str(score)
	
func game_over():
	if score > high_score:
		scoreManager.save_score(score)
	$GameOverScreen.show()
	get_tree().paused = true
