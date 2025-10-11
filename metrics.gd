extends Node

# Ruta donde se guardarán las métricas
var save_path := "user://metrics.json"

# Diccionario con todas las métricas
var metrics := {
	"high_score": 0,
	"games_played": 0,
	"total_time_played": 0.0,
	"enemies_defeated": 0
}

# Guarda las métricas en archivo
func save_metrics() -> void:
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_string(JSON.stringify(metrics, "\t")) # \t para formatear legible
	file.close()

# Carga las métricas si existen
func load_metrics() -> void:
	if not FileAccess.file_exists(save_path):
		save_metrics() # crea el archivo si no existe
		return
	
	var file = FileAccess.open(save_path, FileAccess.READ)
	var text = file.get_as_text()
	file.close()

	var data = JSON.parse_string(text)
	if typeof(data) == TYPE_DICTIONARY:
		metrics = data

# Reinicia las métricas
func reset_metrics() -> void:
	metrics = {
		"high_score": 0,
		"games_played": 0,
		"total_time_played": 0.0,
		"enemies_defeated": 0
	}
	save_metrics()

# Incrementa una métrica
func add_metric(key: String, value) -> void:
	if metrics.has(key):
		metrics[key] += value
		save_metrics()

# Actualiza el high score si supera el anterior
func update_high_score(new_score: int) -> void:
	if new_score > metrics.high_score:
		metrics.high_score = new_score
		save_metrics()
