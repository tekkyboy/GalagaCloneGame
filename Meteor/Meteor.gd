extends Area2D

export var minSpeed  = 10
export var maxSpeed  = 20
export var minRotationRate = - 20
export var maxRotationRate = 20

onready var stats = $Stats

var score = 0

var speed = 0
var rotationRate = 0

func _ready():
	speed = rand_range(minSpeed, maxSpeed)
	rotationRate = rand_range(minRotationRate, maxRotationRate)

func _physics_process(delta):
	rotation_degrees += rotationRate * delta
	position.y += speed * delta

func damage(health):
	stats.health -= health

func _on_Stats_no_health():
	get_tree().get_root().get_node("VariantMain/HUDLayer/HUD/scoreLabel").score += 5
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
