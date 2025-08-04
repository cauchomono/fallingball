extends ParallaxBackground

var scroll_speed = Vector2(0, -100)  # Movimiento horizontal

func _process(delta):
	scroll_offset += scroll_speed * delta
