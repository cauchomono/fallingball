extends Node2D

var score = 0

func _ready():
	Globals.points = score
	$PointsZone.enemy_passed.connect(_on_enemy_passed) 
	$Spawner.obstacle_hit.connect(_on_player_touch)

func _on_enemy_passed() -> void:
	score += 1
	Globals.points = score
	$CanvasLayer/Label.text = "Points: " + str(score)  # Actualizar la UI

func _on_player_touch() -> void:
		get_tree().reload_current_scene()  # 🔄 Reinicia el juego
