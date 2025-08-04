extends Node2D

@export var random_obstacle_scene: Array[PackedScene]
@export var obstacle_scene: PackedScene
@export var spawn_rate: float = 1.5

@export var spawn_rate_coin: float = 0.5
@export var wall_distance: Vector2 = Vector2(0, 10)
@export var coin_scene: PackedScene
var obstacle_size : Vector2
var obstacle_index : int
signal obstacle_hit

func _ready():
	#spawn_random_obstacle()
	$Timer.wait_time = spawn_rate
	$Timer.start()
	#obstacle_size = get_random_obstacle_size()
	
	$CoinTimer.wait_time = spawn_rate_coin
	$CoinTimer.start()
	spawn_coin()
	
	
func spawn_random_obstacle():
	obstacle_index  = randi_range(0,random_obstacle_scene.size()-1)
	var obstacle = random_obstacle_scene[obstacle_index].instantiate()
	add_child(obstacle)
	
	var x_spawn_range : Vector2 = Vector2(wall_distance.x + obstacle_size.x,wall_distance.y - obstacle_size.x)
	var spawn_x = randf_range(x_spawn_range.x , x_spawn_range.y)
	obstacle.global_position = Vector2(spawn_x, position.y)
	obstacle.connect("player_touch",Callable(self,"on_obstacle_hit"))
func _on_timer_timeout():
	spawn_random_obstacle()
	
func get_random_obstacle_size():
	if not random_obstacle_scene[obstacle_index]:
		return Vector2.ZERO

	var obstacle_instance : Node = random_obstacle_scene[obstacle_index].instantiate()
	var collider : CollisionShape2D = obstacle_instance.get_node_or_null("CollisionShape2D")

	if collider and collider.shape is RectangleShape2D:
		return collider.shape.size
	elif collider and collider.shape is CapsuleShape2D:
		return Vector2(collider.shape.radius * 2, collider.shape.height)

	return Vector2.ZERO
	
func on_obstacle_hit():
		obstacle_hit.emit()
	
<<<<<<< Updated upstream
=======
func spawn_coin():
	var coin = coin_scene.instantiate()
	add_child(coin)
	var x_spawn_range : Vector2 = Vector2(wall_distance.x + obstacle_size.x,wall_distance.y - obstacle_size.x)
	var spawn_x = randf_range(x_spawn_range.x , x_spawn_range.y)
	coin.global_position = Vector2(spawn_x, position.y)


func _on_coin_timer_timeout() -> void:
	print("Is working the time out?")
	spawn_coin()
>>>>>>> Stashed changes
