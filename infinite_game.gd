extends Node2D

@onready var audioStreamPlayer : AudioStreamPlayer = $AudioStreamPlayer
@onready var gameplaySound = preload("res://sounds/music/Ludum Dare 28 01.ogg")
@onready var coin = preload("res://coin.gd").new()
var is_bet_screen_active = true

func _ready():
	audioStreamPlayer.stream = gameplaySound
	audioStreamPlayer.play()
	$Background2/HighScore.text = "High Score: " + str(Globals.high_score)
	$Spawner.obstacle_hit.connect(_on_player_touch)
	$BallPlayer.died.connect(game_over)
	$Score_manager.score_increased.connect(increase_score_on_screen)

func _on_player_touch() -> void:
		game_over()

func game_over():
	$GameOverScreen.show()
	get_tree().paused = true

func increase_score_on_screen():
	print("is working increase_score_on_screen?")
	var score = Globals.score 
	%Background2/Score.text = "Score: " + str(score)


func _on_bet_screen_is_active_screen(is_active:bool) -> void:
	%Spawner.set_status_spawner(false)
	if !is_active:
		%Spawner.set_status_spawner(true)
		
	
	
