extends Area2D

signal enemy_passed

func _ready():
	connect("area_entered", Callable(self, "_on_enemy_passed"))

func _on_enemy_passed(body : Area2D):
	if body.is_in_group("obstacles"):
		emit_signal("enemy_passed")
		#body.queue_free() 


func _on_area_entered(area: Area2D) -> void:
	pass
