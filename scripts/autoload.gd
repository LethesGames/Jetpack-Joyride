extends Node

var save_data:SaveData = SaveData.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	save_data = SaveData.load_or_create()
