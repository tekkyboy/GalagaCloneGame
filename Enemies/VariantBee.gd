extends Area2D

onready var stats = $Stats
onready var firingPositions := $FiringPositions
onready var path_follow = get_parent()
export var speed = Vector2()
var ve
var score = 0
var move_direction = 0
var anim_direction = "N"
var preloadBullet := preload("res://EnemyBullet/EnemyBullet.tscn")

const explosion = preload("res://PlayerExplosion/ExplosionEffect.tscn")

func _ready():
	set_process(true)

func _process(delta):
	translate(speed*delta)
	pass
	
func damage(health):
	stats.health -= health


func _on_Stats_no_health():
	get_tree().get_root().get_node("VariantMain/HUDLayer/HUD/scoreLabel").score += 100
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
