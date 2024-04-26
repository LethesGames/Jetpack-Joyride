extends Control


var current_score_label
var highest_score_label


# Called when the node enters the scene tree for the first time.
func _ready():
	current_score_label = get_node("PanelContainer/VBoxContainer/MarginContainer2/CurrentScore")
	highest_score_label = get_node("PanelContainer/VBoxContainer/MarginContainer5/HighestScore")
	current_score_label.text = "SCORE: " + str(Autoload.save_data.run_score)
	highest_score_label.text = "HIGHEST SCORE: " + str(Autoload.save_data.max_score)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_restart_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	pass # Replace with function body.


func _on_quit_button_pressed():
	get_tree().quit()
	pass # Replace with function body.
