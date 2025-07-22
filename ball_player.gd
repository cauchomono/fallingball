extends RigidBody2D

@export var gravity: float = 0.0
@export var speed_x: float = 500.0
@export var jump_force: float = -600.0
@export var change_direction_interval: float = 10.0

var direction: int = 1
var time_elapsed: float = 0.0
var points = 0

func _ready():
	gravity_scale = 0
	set_process(true)

func _process(delta):
	time_elapsed += delta
	if false:
		direction *= -1
		time_elapsed = 0.0

	#velocity.y += gravity * delta
	#velocity.x = speed_x * direction * delta * 10 
	#apply_central_impulse(Vector2(-10 * direction,0))

	if Input.is_action_just_pressed("ui_accept"):
		linear_velocity.x = 0
		direction *= -1
		apply_central_impulse(Vector2(300 * direction,0))


func _on_body_entered(body):
	print("Se ejecuta")
	if body.is_in_group("obstacles") or body.is_in_group("wall"):
		game_over()

func game_over():
	print("¡Perdiste!")  # Aquí podrías reiniciar el juego o mostrar un menú
	get_tree().reload_current_scene()
