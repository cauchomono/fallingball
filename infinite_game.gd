extends Node2D

@onready var audioStreamPlayer : AudioStreamPlayer = $AudioStreamPlayer
var score = 0
var gameplaySound = preload("res://sounds/music/Ludum Dare 28 01.ogg")

func _ready():
	
	audioStreamPlayer.stream = gameplaySound
	audioStreamPlayer.play()
	Globals.points = score
	$PointsZone.enemy_passed.connect(_on_enemy_passed) 
	$Spawner.obstacle_hit.connect(_on_player_touch)

func _on_enemy_passed() -> void:
	score += 1
	Globals.points = score
	$CanvasLayer/Label.text = "Points: " + str(score)  # Actualizar la UI

func _on_player_touch() -> void:
		get_tree().reload_current_scene()  # 🔄 Reinicia el juego
