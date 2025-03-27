extends StaticBody2D

@export var speed: float = -1500  # Velocidad de caída 150.0

func _process(delta):
	position.y += speed * delta

	# Si el obstáculo sale de la pantalla, se elimina
	if position.y > get_viewport_rect().size.y:
		queue_free()
