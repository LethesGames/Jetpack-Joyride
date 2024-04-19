extends Camera2D


var playerScene = preload("res://scenes/player.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var playerNode:Node = playerScene.instantiate()
	add_child(playerNode)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
