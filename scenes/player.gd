extends Area2D


var heightMax:float
var heighMin:float
var playerHeight:int = 12


# Called when the node enters the scene tree for the first time.
func _ready():
	#TODO: move this values to a configuration class
	heightMax = -50
	heighMin = 50
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("space") and (heightMax + playerHeight) < position.y:
		position.y -= 1
		print("Instantiating fart")
		load("res://scenes/fart.tscn")
		pass
	else:
		if position.y < (heighMin - playerHeight):
			position.y += 1
	pass


func _on_area_entered(area):
	if area.name.contains("Obstacle"):
		get_tree().call_group("GameManager", "end_game")
		queue_free()
	pass # Replace with function body.
