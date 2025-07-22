extends Area2D

@export var speed: float = -1000  # Velocidad de caída 150.0
@export var limit_speed: float = -2500
var points : int = 0
signal player_touch

func _ready():
	pass
	
func _process(delta):
	if speed > limit_speed && (Globals.points % 10 == 0 && Globals.points != 0):
		print("Hay aumento de velocidad: ", Globals.points % 10)
		speed = -((Globals.points + 0.01)*10 + 100)
	position.y += speed * delta

	# Si el obstáculo sale de la pantalla, se elimina
	if -position.y > get_viewport_rect().size.y:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_touch.emit()
