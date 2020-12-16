extends Control

var life = 2 setget set_life
var max_life = 2 setget set_max_life

onready var lifeIcon = $LifeIcon

func set_life(value):
	life = clamp(value, 0, max_life)
	if lifeIcon != null:
		lifeIcon.rect_size.x = life * 35
		
func set_max_life(value):
	max_life = max(value, 1)

func _ready():
	self.max_life = PlayerStats.max_health
	self.life = PlayerStats.health
	PlayerStats.connect("health_changed",self,"set_life")
