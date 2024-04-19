extends Area2D

#TODO: this might be a general obstacle script if all the logic is shared between every obstacle

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if area.name.contains("fart"):
		queue_free()
	pass # Replace with function body.
