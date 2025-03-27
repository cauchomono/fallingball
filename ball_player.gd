extends RigidBody2D

@export var gravity: float = 0.0
@export var speed_x: float = 500.0
@export var jump_force: float = -600.0
@export var change_direction_interval: float = 2.0

var direction: int = 1
var time_elapsed: float = 0.0

func _ready():
	gravity_scale = 0
	set_process(true)

func _process(delta):
	time_elapsed += delta
	if time_elapsed >= change_direction_interval:
		direction *= -1
		time_elapsed = 0.0

	#velocity.y += gravity * delta
	#velocity.x = speed_x * direction * delta * 10 
	apply_central_impulse(Vector2(-10,0))

	if Input.is_action_just_pressed("ui_accept"):
		linear_velocity.x = 0
		apply_central_impulse(Vector2(300,0))


func _on_body_entered(body):
	if body.is_in_group("obstacles"):
		game_over()

func game_over():
	print("¡Perdiste!")  # Aquí podrías reiniciar el juego o mostrar un menú
	get_tree().reload_current_scene()
	
