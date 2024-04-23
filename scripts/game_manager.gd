extends Node


@onready var player_scene = preload("res://scenes/player.tscn")
@onready var spike_ball_scene = preload("res://scenes/spike_ball.tscn")
@onready var saw_scene = preload("res://scenes/saw.tscn")
@onready var tnt_box_scene = preload("res://scenes/tnt_box.tscn")

var obstacles = []
var current_score_label
var current_score:int = 0


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
	
	
#TODO: Manage obstacle instantiation logic
func instantiate_obstacle() -> void:
	#Array con posibles obxetos
	#Cada x tempo instanciamos obxetos
	#Temos unha variable int 1...nObxetos. 
	#Cada x tempo instanciamos un obxeto pero segundo avancemos no tempo vanse poder
	#ir creando mais obstaculos a vez e iremos reducindo o intervalo entre aparacion 
	#de obstaculos
	var obstacles_to_instantiate:int = 1 #modificable segun tempo
	var current_obstacles_count = 0
	while current_obstacles_count < obstacles_to_instantiate:
		#instanciamos obstaculo
		var obstacle_scene = obstacles[randf_range(0, obstacles.size())]
		var obstacle_node = obstacle_scene.instantiate()
		add_child(obstacle_node)
		current_obstacles_count += 1
		pass
	pass


func _on_timer_timeout():
	add_point()
	pass # Replace with function body.
