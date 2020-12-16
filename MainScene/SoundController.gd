extends Node

func _ready():
	Global.soundController = self
	
func _exit_tree():
	Global.soundController = null
