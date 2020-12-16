extends VBoxContainer

var score = 0 setget set_score

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_score(new_value):
	score = new_value
	get_node("numberScore").set_text(str(score))
