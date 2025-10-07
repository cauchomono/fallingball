extends CanvasLayer

func _ready() -> void:
	points_multiplier(select_multiplier())
	%GameOverScore.text =  "Your score: " + str(Globals.score)

func _process(delta: float) -> void:
	%GameOverScore.text =  "Your score: " + str(Globals.score)

func _on_main_menu_page_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_restart_page_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	
func points_multiplier(multiplier:int ):
	Globals.score *= multiplier

func select_multiplier() -> float:
	print("Se ejecuta select_multiplier")
	if(Globals.score < Globals.bet_points):
		return 0.5
	if(Globals.bet_points > 5):
		return 2
	if(Globals.bet_points > 15):
		return 5
	return 1
	
