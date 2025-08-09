
extends Node

var save_path : String = "user://save_game.json"

func save_score(high_score: int) -> void:
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	var data = {
		"high_score": high_score
	}
	file.store_string(JSON.stringify(data))
	file.close()

# Carga la puntuación
func load_score() -> int:
	if not FileAccess.file_exists(save_path):
		return 0
	
	var file = FileAccess.open(save_path, FileAccess.READ)
	var data := file.get_as_text()
	file.close()
	
	var parsed : Variant = JSON.parse_string(data)
	if parsed == null or not parsed.has("high_score"):
		return 0
	
	return parsed["high_score"]
