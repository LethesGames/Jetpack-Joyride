extends Node


@onready var player_scene = preload("res://scenes/player.tscn")
@onready var spike_ball_scene = preload("res://scenes/spike_ball.tscn")
@onready var saw_scene = preload("res://scenes/saw.tscn")
@onready var tnt_box_scene = preload("res://scenes/tnt_box.tscn")
var min_position_obstacle_spawning:Vector2 = Configurations.min_position_obstacle_spawning
var max_position_obstacle_spawning:Vector2 = Configurations.max_position_obstacle_spawning

var obstacles = []
var current_score_label
var current_score:int = 0
var obstacles_to_instantiate:int = 2
var current_obstacles_count = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	current_score_label = get_parent().get_node("Hud/PanelContainer/CurrentScore")
	obstacles.append(spike_ball_scene) 
	obstacles.append(saw_scene)
	obstacles.append(tnt_box_scene)
	var player_node:Node = player_scene.instantiate()
	add_child(player_node)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func add_point() -> void:
	current_score += 1
	current_score_label.text = str(current_score)
	
	
func instantiate_obstacle() -> void:
	while current_obstacles_count < obstacles_to_instantiate:
		var obstacle_scene = obstacles[randf_range(0, obstacles.size())]
		var obstacle_node = obstacle_scene.instantiate()
		obstacle_node.name = "Obstacle" + str(current_obstacles_count)
		obstacle_node.position = Vector2(
			randf_range(min_position_obstacle_spawning.x , max_position_obstacle_spawning.x),
			randf_range(min_position_obstacle_spawning.y , max_position_obstacle_spawning.y))
		add_child(obstacle_node)
		current_obstacles_count += 1
		pass
	pass


func end_game() -> void:
	#TODO: Show game over scene
	pass

func remove_obstacle() -> void:
	current_obstacles_count -= 1
	pass
	
	
func _on_timer_timeout() -> void:
	add_point()
	pass # Replace with function body.


func _on_obstacle_timer_timeout() -> void:
	instantiate_obstacle()
	pass # Replace with function body.
