extends Area2D

@export var speed: float = -500
@export var limit_speed: float = -2500
var points : int = 0
signal player_touch

func _ready():
	print("Obstacle Velocity ", speed)
	pass
	
func _process(delta):
	speed = -(Globals.level*80 + 100)
	position.y += speed * delta

	if -position.y > get_viewport_rect().size.y:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_touch.emit()
