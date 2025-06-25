extends Area2D

signal enemy_passed  # Definimos la señal

func _ready():
	connect("area_entered", Callable(self, "_on_enemy_passed"))  # Conectar la señal al método interno

func _on_enemy_passed(body : Area2D):
	if body.is_in_group("obstacles"):  # Verificamos que sea un enemigo
		emit_signal("enemy_passed")  # Emitimos la señal
		#body.queue_free()  # Opcional: eliminar enemigo al pasar


func _on_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
