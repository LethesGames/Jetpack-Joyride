extends Area2D


var heightMax:float = Configurations.maxMapHeight
var heighMin:float = Configurations.minMapHeight
var playerHeight:int = Configurations.playerHeight
var fartScene:Resource = preload("res://scenes/fart.tscn")
var fireRate = Timer.new()
var timeToFart:float = 1
var fartCounter:int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	fireRate.set_one_shot(true)
	add_child(fireRate)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):		
	if Input.is_action_pressed("space"):
		position.y = clamp(position.y - 1, heighMin, heightMax)
		instantiate_fart()
		pass
	else:
		if position.y < (heightMax + playerHeight):
			position.y += 1
	pass


func _on_area_entered(area) -> void:
	if area.name.contains("Obstacle"):
		get_tree().call_group("GameManager", "end_game")
		queue_free()
	pass # Replace with function body.


func instantiate_fart() -> void:
	if fireRate.is_stopped():
		#TODO: *****Susceptible of being moved to a fart component
		var fartNode:Node = fartScene.instantiate()
		fartNode.name = "fart" + str(fartCounter)
		fartCounter += 1
		fartNode.position = position
		get_parent().add_child(fartNode)
		#********
		fireRate.start(timeToFart)
