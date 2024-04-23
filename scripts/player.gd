extends Area2D


var height_max:float = Configurations.max_map_height
var heigh_min:float = Configurations.min_map_height
var player_height:int = Configurations.player_height
var fart_scene:Resource = preload("res://scenes/fart.tscn")
var fire_rate = Timer.new()
var time_to_fart:float = 1
var fart_counter:int = 0


#TODO: Add logic to manage animaitons


# Called when the node enters the scene tree for the first time.
func _ready():
	fire_rate.set_one_shot(true)
	add_child(fire_rate)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):		
	if Input.is_action_pressed("space"):
		position.y = clamp(position.y - 1, heigh_min, height_max)
		instantiate_fart()
		pass
	else:
		if position.y < (height_max + player_height):
			position.y += 1
	pass


func _on_area_entered(area) -> void:
	if area.name.contains("Obstacle"):
		get_tree().call_group("GameManager", "end_game")
		queue_free()
	pass # Replace with function body.


func instantiate_fart() -> void:
	if fire_rate.is_stopped():
		var fart_node:Node = fart_scene.instantiate()
		fart_node.name = "fart" + str(fart_counter)
		fart_counter += 1
		fart_node.position = Vector2(position.x, position.y + player_height)
		get_parent().add_child(fart_node)
		fire_rate.start(time_to_fart)
