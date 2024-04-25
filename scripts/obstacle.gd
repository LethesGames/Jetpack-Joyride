extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= 1
	pass


func _on_area_entered(area):
	if area.name.contains("fart"):
		get_tree().call_group("GameManager", "remove_obstacle")
		queue_free()
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_exited():
	print("Camera exited")
	get_tree().call_group("GameManager", "remove_obstacle")
	queue_free()
	pass # Replace with function body.
