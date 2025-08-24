extends Node2D

signal is_active_screen
var visible_screen_status : bool = true

func _ready() -> void:
	%PointsBet.text = str(int(%Slider.value))


func _on_h_slider_value_changed(value: float) -> void:
	%PointsBet.text = str(int(value))
	print(value)


func _on_bet_pressed() -> void:
	Globals.bet_points = int(%Slider.value)
	visible_screen_status = false
	visible = visible_screen_status

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")# Replace with function body.


func _on_main_menu_visibility_changed() -> void:
	print("Se emite el active status")
	is_active_screen.emit(visible_screen_status)
