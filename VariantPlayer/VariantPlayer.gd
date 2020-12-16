extends Area2D

var preloadBullet := preload("res://Bullet/VariantBullet.tscn")

var stats = PlayerStats
onready var animatedSprite := $AnimatedSprite
onready var firingPositions := $FiringPositions
onready var fireDelayTimer := $FireDelayTimer
onready var invincibilityTimer = $InvincibilityTimer

export var speed = 100 
export var fireDelay = 0.1
export var invincibilityDuration: = 1

var vel := Vector2(0, 0)

var invincible = false setget set_invincible
signal invincibility_start
signal invincibility_end

func _ready():
	stats.connect("no_health", self, "queue_free")
	
func _process(delta):
	if vel.x < 0:
		animatedSprite.play("Left")
	elif vel.x > 0:
		animatedSprite.play("Right")
	else:
		animatedSprite.play("Straight")
	
	if Input.is_action_pressed("shoot") and fireDelayTimer.is_stopped():
		fireDelayTimer.start(fireDelay)
		for child in firingPositions.get_children():
			Global.play_sound("PlayerShoot")
			var bullet := preloadBullet.instance()
			bullet.global_position = child.global_position
			get_tree().current_scene.add_child(bullet)
			Global.stop_sound("PlayerShoot")

func _physics_process(delta):
	var dirVec := Vector2(0, 0)
	
	if Input.is_action_pressed("move_left"):
		dirVec.x = -1
	elif Input.is_action_pressed("move_right"):
		dirVec.x = 1
	if Input.is_action_pressed("move_up"):
		dirVec.y = -1
	elif Input.is_action_pressed("move_down"):
		dirVec.y = 1
	
	vel = dirVec.normalized() * speed
	
	position += vel * delta
	
	var viewRect := get_viewport_rect()
	position.x = clamp(position.x, viewRect.position.x, viewRect.end.x)
	position.y = clamp(position.y, viewRect.position.y, viewRect.end.y)	

func _on_VariantPlayer_area_entered(area):
	start_invincibility(1)
	stats.max_health -= 1
	if stats.max_health <= 0:
		queue_free()
	
func set_invincible(value):
	invincible = value
	if invincible == true:
		emit_signal("invincibility_start")
	else:
		emit_signal("invinciblity_end")

func start_invincibility(invincibilityDuration):
	self.invincible = true
	invincibilityTimer.start(invincibilityDuration)

func _on_InvincibilityTimer_timeout():
	self.invincible = false

func _on_VariantPlayer_invincibility_start():
	set_deferred("monitorable", false)
	
func _on_VariantPlayer_invincibility_end():
	monitorable = true 

