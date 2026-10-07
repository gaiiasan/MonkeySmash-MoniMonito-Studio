extends Node2D

var Enemy = preload("uid://butuq7h4yerck")
var Boss = preload("uid://2adny5i4cfyc")
var BossFight = preload("uid://cgusoqni5e42u")
var Bananas = preload("uid://dwcbu21dt2lu7")
var Player = preload("uid://pfj2umrq2yxg")
var Peleas = 2
var PosicionesSpawn = [Vector2(935.0814, 124.7322), Vector2(921.8163, 317.989), Vector2(844.0348, 475.7705), Vector2(1067.319, 397.4864), Vector2(1482.03, 112.3366) , Vector2(1555.92, 271.2275) , Vector2(1383.494, 313.6538) , Vector2(1510.773, 461.0038) , Vector2(1354.959, 591.8182)]
var EnemigosVivos = 1

func _ready() -> void:
	pass
	#var Jefe = Boss.instantiate()
	#Jefe.name = "Jefe"
	#add_child(Jefe)
	#Jefe.position = Vector2(604.0, 278.0)

func _on_pelea_1_body_entered(_body: Node2D) -> void:
	if Peleas == 2:
		Peleas = 1
		call_deferred("Pelea1")
func Pelea1():
	var Enemy1 = Enemy.instantiate()
	var Enemy2 = Enemy.instantiate()
	var Enemy3 = Enemy.instantiate()
	Enemy1.name = "Enemy1"
	Enemy2.name = "Enemy2"
	Enemy3.name = "Enemy2"
	add_child(Enemy1)
	add_child(Enemy2)
	add_child(Enemy3)
	Enemy1.position = PosicionesSpawn.pick_random() + Vector2(100, 0) 
	Enemy2.position = PosicionesSpawn.pick_random() + Vector2(-50, 0) 
	Enemy3.position = PosicionesSpawn.pick_random() + Vector2(-150, 0) 
	EnemigosVivos = 3
	print("creando la primer pelea")
func EnemigoMurio():
	EnemigosVivos -= 1
	print(EnemigosVivos)
	if EnemigosVivos == 0:
		get_node("../placeholder terreno/PuertaBoss").position.y = 1500
		



#func _on_pelea_boss_body_entered(_body: Node2D) -> void:
	#var jugadorEntroaBoss = true
	#if body == Player:
		#Boss.EnMovimiento = true
	#if Peleas == 1:
		#Peleas = 0
		#call_deferred("PeleaBoss")
		#get_node("../placeholder terreno/PuertaBoss").position.y = 262.0
		
func PeleaBoss():
	EnemigosVivos = 1
	#var Jefe = Boss.instantiate()
	#Jefe.name = "Jefe"
	#add_child(Jefe)
	#Jefe.position = Vector2(2778.775, 318.3477)
	var Banana1 = Bananas.instantiate()
	var Banana2 = Bananas.instantiate()
	var Banana3 = Bananas.instantiate()
	var Banana4 = Bananas.instantiate()
	add_child(Banana1)
	add_child(Banana2)
	add_child(Banana3)
	add_child(Banana4)
	Banana1.position = Vector2(2822.66, 96.67554)
	Banana2.position = Vector2(2012.66, 96.67554)
	Banana3.position = Vector2(2822.66, 581.6755)
	Banana3.position = Vector2(2822.66, 581.6755)
	Banana4.position = Vector2(2042.66, 581.6755)


func _on_pelea_boss_body_entered(_body: Node2D) -> void:
	$BossFight/Boss/CharacterBody2D.EnMovimiento = true
	#$Node2D/PeleaBoss/CollisionShape2D.set_deferred("disabled", true) 
	var zona_activacion = get_tree().current_scene.find_child("PeleaBoss", true, false)
	$Camera2D.enabled = false
	$Player/CameraJEFE.enabled = true
	$"../UI_ingame/placeholder bananas contador/Label".show()
	if zona_activacion != null:
		zona_activacion.queue_free() # Borra el área de forma 100% segura
	
	
