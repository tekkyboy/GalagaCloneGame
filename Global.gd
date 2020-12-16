extends Node2D

var soundController = null

func play_sound(sound):
	if soundController != null:
		if soundController.has_node(sound):
			soundController.get_node(sound).play()


func stop_sound(sound):
	if soundController != null:
		if soundController.has_node(sound):
			soundController.get_node(sound).stop()
			
