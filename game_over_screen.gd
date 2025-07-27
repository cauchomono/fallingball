extends CanvasLayer

func _ready() -> void:
	%GameOverScore.text =  "Your score: " + str(Globals.points)


func _on_main_menu_page_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_restart_page_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
