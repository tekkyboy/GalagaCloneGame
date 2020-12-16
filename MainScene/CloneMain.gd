extends Node

onready var firstStageTimer = $FirstStageSpawn
onready var spawnBee2Timer =  $SpawnBee2Timer
onready var spawnBee3Timer =  $SpawnBee3Timer
onready var spawnBee45Timer =  $Spawnbee45Timer
onready var spawnBee6Timer =  $SpawnBee6Timer
onready var spawnBee78Timer =  $SpawnBee78Timer
onready var spawnButterfly1Timer =  $SpawnButterfly1Timer
onready var checkEnemiesTimer = $checkEnemiesTimer
onready var HUD = get_node("HUDLayer/HUD")
onready var checkScore = get_node("HUDLayer/HUD/scoreLabel")
onready var meteor = get_node("Meteor")

var spawnBee1 := preload("res://Enemies//Pattern1.tscn")
var spawnBee2 := preload("res://Enemies//Bee2.tscn")
var spawnBee3 := preload("res://Enemies//Bee3.tscn")
var spawnBee4 := preload("res://Enemies//Bee4.tscn")
var spawnBee5 := preload("res://Enemies//Bee5.tscn")
var spawnBee6 := preload("res://Enemies//Bee6.tscn")
var spawnBee7 := preload("res://Enemies//Bee7.tscn")
var spawnBee8 := preload("res://Enemies//Bee8.tscn")
var spawnButterfly1 := preload("res://Enemies//Butterfly1.tscn")
var spawnButterfly2 := preload("res://Enemies//Butterfly2.tscn")
var spawnBossGalaga := preload("res://Enemies//BossGalaga1.tscn")
var score = 0
var stage = 0

func _ready():
	score = 0
	begin_next_stage()
	
func begin_next_stage():
	stage += 1
	if stage == 1:
		HUD.show_message("Stage %s" % stage)
		Global.play_sound("FirstStage")
		firstStageTimer.start()
	else:	
		checkEnemiesTimer.stop()
		HUD.show_message("Stage %s" % stage)
		Global.play_sound("Stage")
		firstStageTimer.start()

func _on_FirstStageSpawn_timeout():
	firstStageTimer.stop()
	var Bee1 = spawnBee1.instance()
	add_child(Bee1)
	spawnBee2Timer.start()
	

func _on_spawnTimer_timeout():
	var Bee2 = spawnBee2.instance()
	add_child(Bee2)
	spawnBee2Timer.stop()
	spawnBee3Timer.start()
	
func _on_SpawnBee3Timer3_timeout():
	spawnBee3Timer.stop()
	var Bee3 = spawnBee3.instance()
	add_child(Bee3)
	spawnBee45Timer.start()
	
func _on_Spawnbee45Timer_timeout():
	spawnBee45Timer.stop()
	var Bee4 = spawnBee4.instance()
	add_child(Bee4)
	var Bee5 = spawnBee5.instance()
	add_child(Bee5)
	spawnBee6Timer.start()

func _on_SpawnBee6Timer_timeout():
	spawnBee6Timer.stop()
	var Bee6 = spawnBee6.instance()
	add_child(Bee6)
	spawnBee78Timer.start()

func _on_SpawnBee78Timer_timeout():
	spawnBee78Timer.stop()
	var Bee7 = spawnBee7.instance()
	add_child(Bee7)
	var Bee8 = spawnBee8.instance()
	add_child(Bee8)
	spawnButterfly1Timer.start()

func _on_SpawnButterfly1Timer_timeout():
	spawnButterfly1Timer.stop()
	var Butterfly1 = spawnButterfly1.instance()
	add_child(Butterfly1)
	var Butterfly2 = spawnButterfly2.instance()
	add_child(Butterfly2)
	var BossGalaga = spawnBossGalaga.instance()
	add_child(BossGalaga)
	score += 1520
	checkEnemiesTimer.start()


func _on_checkEnemiesTimer_timeout():
	if checkScore.score == score:
		begin_next_stage()
	
