extends Node2D

@export var obstacle_scene: PackedScene  # Arrastra aquí la escena del obstáculo
@export var spawn_rate: float = 1.5  # Tiempo entre cada obstáculo generado
@export var wall_distance: Vector2 = Vector2(0, 10)  # Rango de aparición en X
var obstacle_size : Vector2
func _ready():
	spawn_obstacle()
	$Timer.wait_time = spawn_rate
	$Timer.start()
	obstacle_size = get_obstacle_size()

func spawn_obstacle():
	print("Inicia spawn de objeto")
	var obstacle = obstacle_scene.instantiate()
	add_child(obstacle)
	# Posición inicial aleatoria dentro del rango
	
	var x_spawn_range : Vector2 = Vector2(wall_distance.x + obstacle_size.x,wall_distance.y - obstacle_size.x)
	var spawn_x = randf_range(x_spawn_range.x , x_spawn_range.y)
	obstacle.global_position = Vector2(spawn_x, position.y)
	
func _on_timer_timeout():
	spawn_obstacle()
	
func get_obstacle_size():
	if not obstacle_scene:
		return Vector2.ZERO  # Retorna tamaño 0 si no hay escena asignada

	var obstacle_instance = obstacle_scene.instantiate()  # Instancia la escena
	var collider = obstacle_instance.get_node_or_null("CollisionShape2D")  # Busca el collider

	if collider and collider.shape is RectangleShape2D:
		return collider.shape.size  # Retorna el tamaño del rectángulo
	elif collider and collider.shape is CapsuleShape2D:
		return Vector2(collider.shape.radius * 2, collider.shape.height)  # Ancho y alto de cápsula

	return Vector2.ZERO  # Si no tiene collider, retorna tamaño 0
