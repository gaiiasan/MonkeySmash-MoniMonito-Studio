extends Node2D

var Enemy = preload("uid://butuq7h4yerck")
var Boss = preload("uid://2adny5i4cfyc")
var BossFight = preload("uid://cgusoqni5e42u")
var Bananas = preload("uid://dwcbu21dt2lu7")
var Player = preload("uid://pfj2umrq2yxg")
var BarrilCherry = preload("uid://cr8wa2dwmavmq")
var BarrilBanana = preload("uid://dcsgaf8ekdc3r")
var LimitePelea = preload("uid://cd4wb67rijrsc")
var Peleas = 5
var PosicionesSpawnBananas = [Vector2(4536, 275), Vector2(4829, 256), Vector2(4731, 357), Vector2(4504, 571), Vector2(4901, 517) , Vector2(5230, 412) , Vector2(5133, 279) , Vector2(4943, 401) , Vector2(5234, 534) , Vector2(5367, 391) , Vector2(4423, 322) , Vector2(4457, 531)]
var EnemigosVivos = 1

func _on_pelea_1_body_entered(_body: Node2D) -> void:  
	if Peleas == 5:  
		Peleas = 4
		call_deferred("Pelea1")
func _on_pelea_2_body_entered(_body: Node2D) -> void:   
	if Peleas == 4:  
		Peleas = 3
		call_deferred("Pelea2")
func _on_pelea_3_body_entered(_body: Node2D) -> void:  
	if Peleas == 3:  
		Peleas = 2
		call_deferred("Pelea3")
func _on_pelea_4_body_entered(_body: Node2D) -> void:  
	if Peleas == 2:  
		Peleas = 1
		call_deferred("Pelea4")
func Pelea1():
	var Enemy1 = Enemy.instantiate()
	add_child(Enemy1)
	Enemy1.position = Vector2(1360, 375)
	var BarrilBanana1 = BarrilBanana.instantiate()
	add_child(BarrilBanana1)
	BarrilBanana1.position = Vector2(1397, 524)
	EnemigosVivos = 1
	print("creando la primer pelea")
	var Limite1 = LimitePelea.instantiate()
	var Limite2 = LimitePelea.instantiate()
	add_child(Limite1)
	add_child(Limite2)
	Limite1.position = Vector2(465, 400)
	Limite2.position = Vector2(1490, 400)
func Pelea2():
	var Enemy1 = Enemy.instantiate()
	var Enemy2 = Enemy.instantiate()
	add_child(Enemy1)
	add_child(Enemy2)
	Enemy1.position = Vector2(2158, 365)
	Enemy2.position = Vector2(2158, 480)
	var BarrilBanana1 = BarrilBanana.instantiate()
	add_child(BarrilBanana1)
	BarrilBanana1.position = Vector2(2250, 400)
	EnemigosVivos = 2
	print("creando la segunda pelea")
	var Limite1 = LimitePelea.instantiate()
	var Limite2 = LimitePelea.instantiate()
	add_child(Limite1)
	add_child(Limite2)
	Limite1.position = Vector2(1475, 400)
	Limite2.position = Vector2(2475, 400)
func Pelea3():
	var Enemy1 = Enemy.instantiate()
	var Enemy2 = Enemy.instantiate()
	var Enemy3 = Enemy.instantiate()
	add_child(Enemy1)
	add_child(Enemy2)
	add_child(Enemy3)
	Enemy1.position = Vector2(3150, 300)
	Enemy2.position = Vector2(3150, 400)
	Enemy3.position = Vector2(3150, 515)
	var BarrilBanana1 = BarrilBanana.instantiate()
	add_child(BarrilBanana1)
	BarrilBanana1.position = Vector2(2650, 290)
	EnemigosVivos = 3
	print("creando la tercer pelea")
	var Limite1 = LimitePelea.instantiate()
	var Limite2 = LimitePelea.instantiate()
	add_child(Limite1)
	add_child(Limite2)
	Limite1.position = Vector2(2350, 400)
	Limite2.position = Vector2(3350, 400)
func Pelea4():
	var Enemy1 = Enemy.instantiate()
	var Enemy2 = Enemy.instantiate()
	var Enemy3 = Enemy.instantiate()
	var Enemy4 = Enemy.instantiate()
	add_child(Enemy1)
	add_child(Enemy2)
	add_child(Enemy3)
	add_child(Enemy4)
	Enemy1.position = Vector2(4065, 270)
	Enemy2.position = Vector2(4124, 334)
	Enemy3.position = Vector2(4128, 510)
	Enemy4.position = Vector2(4056, 571)
	var BarrilBanana1 = BarrilBanana.instantiate()
	var BarrilBanana2 = BarrilBanana.instantiate()
	add_child(BarrilBanana1)
	add_child(BarrilBanana2)
	BarrilBanana1.position = Vector2(3505, 465)
	BarrilBanana2.position = Vector2(3606, 485)
	var BarrilCherry1 = BarrilCherry.instantiate()
	var BarrilCherry2 = BarrilCherry.instantiate()
	add_child(BarrilCherry1)
	add_child(BarrilCherry2)
	BarrilCherry1.position = Vector2(3866, 515)
	BarrilCherry2.position = Vector2(3863, 295)
	EnemigosVivos = 4
	print("creando la cuarta pelea")
	var Limite1 = LimitePelea.instantiate()
	var Limite2 = LimitePelea.instantiate()
	add_child(Limite1)
	add_child(Limite2)
	Limite1.position = Vector2(3290, 400)
	Limite2.position = Vector2(4290, 400)
func EnemigoMurio():
	EnemigosVivos -= 1
	print(EnemigosVivos)
func _on_pelea_boss_body_entered(_body: Node2D) -> void:
	$BossFight/Boss/CharacterBody2D.EnMovimiento = true
	#$Node2D/PeleaBoss/CollisionShape2D.set_deferred("disabled", true) 
	var zona_activacion = get_tree().current_scene.find_child("PeleaBoss", true, false)
	$Camera2D.enabled = false
	$CameraJEFE.enabled = true
	$"../UI_ingame/placeholder bananas contador/Label".show()
	EnemigosVivos = 1
	call_deferred("PeleaFinal")
	if zona_activacion != null:
		zona_activacion.queue_free() # Borra el área de forma 100% segura
func PeleaFinal():
	var Limite1 = LimitePelea.instantiate()
	add_child(Limite1)
	Limite1.position = Vector2(4343, 416)
	var Banana1 = Bananas.instantiate()
	var Banana2 = Bananas.instantiate()
	var Banana3 = Bananas.instantiate()
	var Banana4 = Bananas.instantiate()
	var Banana5 = Bananas.instantiate()
	var Banana6 = Bananas.instantiate()
	var Banana7 = Bananas.instantiate()
	var Banana8 = Bananas.instantiate()
	add_child(Banana1)
	add_child(Banana2)
	add_child(Banana3)
	add_child(Banana4)
	add_child(Banana5)
	add_child(Banana6)
	add_child(Banana7)
	add_child(Banana8)
	Banana1.position = PosicionesSpawnBananas.pick_random()
	PosicionesSpawnBananas.erase(Banana1.position)
	Banana2.position = PosicionesSpawnBananas.pick_random()
	PosicionesSpawnBananas.erase(Banana2.position)
	Banana3.position = PosicionesSpawnBananas.pick_random()
	PosicionesSpawnBananas.erase(Banana3.position)
	Banana4.position = PosicionesSpawnBananas.pick_random()
	PosicionesSpawnBananas.erase(Banana4.position)
	Banana5.position = PosicionesSpawnBananas.pick_random()
	PosicionesSpawnBananas.erase(Banana5.position)
	Banana6.position = PosicionesSpawnBananas.pick_random()
	PosicionesSpawnBananas.erase(Banana6.position)
	Banana7.position = PosicionesSpawnBananas.pick_random()
	PosicionesSpawnBananas.erase(Banana7.position)
	Banana8.position = PosicionesSpawnBananas.pick_random()
	PosicionesSpawnBananas.erase(Banana8.position)
