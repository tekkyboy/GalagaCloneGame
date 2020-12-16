extends Area2D

onready var stats = $Stats
onready var path_follow = get_parent()
export var speed = 330

var score = 0

func _ready():
	set_process(true)

func damage(health):
	stats.health -= health

func _process(delta):
	path_follow.set_offset(path_follow.get_offset() + speed*delta)


func _on_Stats_no_health():
	get_tree().get_root().get_node("CloneMain/HUDLayer/HUD/scoreLabel").score += 400
	queue_free()

