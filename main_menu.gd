extends Control

@onready var audioStreamPlayer : AudioStreamPlayer = $AudioStreamPlayer
var menuMusic = preload("res://sounds/music/Ludum Dare 28 04.ogg")

func _ready():
	audioStreamPlayer.stream = menuMusic
	audioStreamPlayer.play()
	
func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://InfiniteGame.tscn")
