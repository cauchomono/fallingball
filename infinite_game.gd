extends Node2D

@onready var audioStreamPlayer : AudioStreamPlayer = $AudioStreamPlayer
var score = 0
var gameplaySound = preload("res://sounds/music/Ludum Dare 28 01.ogg")
var scoreManager = preload("res://save_file.gd").new()
var high_score : int


func _ready():
	high_score = scoreManager.load_score()
	audioStreamPlayer.stream = gameplaySound
	audioStreamPlayer.play()
	$Background2/HighScore.text = "High Score: " + str(high_score)
	Globals.points = score
	$PointsZone.enemy_passed.connect(_on_enemy_passed) 
	$Spawner.obstacle_hit.connect(_on_player_touch)
	$BallPlayer.died.connect(game_over)
	
func _on_enemy_passed() -> void:
	score += 1
	Globals.points = score
	$Background2/Score.text = "Score: " + str(score)

func _on_player_touch() -> void:
		game_over()
		

func game_over():
	if score > high_score:
		scoreManager.save_score(score)
	$GameOverScreen.show()
	get_tree().paused = true
