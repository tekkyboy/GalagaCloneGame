extends Node

const variantMeteor = preload("res://Meteor/Meteor3.tscn")
const variantBee = preload("res://Enemies/VariantBee.tscn")
const variantBoss = preload("res://Enemies/VariantBoss.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_meteor()
	spawn_bee()
	spawn_boss()
	pass
func spawn_meteor():
	while true:
		randomize()
		var meteor = variantMeteor.instance()
		var pos = Vector2()
		pos.x = rand_range(0+16, get_viewport().get_visible_rect().size.x-16)
		pos.y = 0-16
		meteor.set_position(pos)
		get_node("container").add_child(meteor)
		yield(get_tree().create_timer(rand_range(3, 7)), "timeout") 
	pass

func spawn_bee():
	while true:
	  randomize()
	  var bee = variantBee.instance()
	  var pos = Vector2()
	  pos.x = rand_range(0+16, get_viewport().get_visible_rect().size.x-16)
	  pos.y = 0-16
	  bee.set_position(pos)
	  get_node("container").add_child(bee)
	  yield(get_tree().create_timer(rand_range(1, 5)), "timeout") 
	pass

func spawn_boss():
	while true:
	  randomize()
	  var boss = variantBoss.instance()
	  var pos = Vector2()
	  pos.x = rand_range(0+16, get_viewport().get_visible_rect().size.x-16)
	  pos.y = 0-16
	  boss.set_position(pos)
	  get_node("container").add_child(boss)
	  yield(get_tree().create_timer(rand_range(3, 5)), "timeout") 
	pass
