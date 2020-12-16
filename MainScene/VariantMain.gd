extends Node

onready var HUD = get_node("HUDLayer/HUD")
var score = 0
var stage = 0
var rng = RandomNumberGenerator.new()

var spawnEnemies := preload("res://MainScene/spawner_enemy.tscn")

func _ready():
	spawn_enemy()
	Global.play_sound("VariantSong")
	pass


func spawn_enemy():
	var enemies = spawnEnemies.instance()
	add_child(enemies)
