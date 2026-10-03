extends Node2D

var Enemy = preload("uid://butuq7h4yerck")
var Boss = preload("uid://do3ymv1xoo5xi")
func _ready() -> void:
	var Enemy1 = Enemy.instantiate()
	var Enemy2 = Enemy.instantiate()
	var Jefe = Boss.instantiate()
	Enemy1.name = "Enemy1"
	Enemy2.name = "Enemy2"
	Jefe.name = "Jefe"
	add_child(Enemy1)
	add_child(Enemy2)
	add_child(Jefe)
	Enemy1.position = Vector2(395.0, 164.0)  #a cambiar cuando haya terreno
	Enemy2.position = Vector2(804.0, 378.0)  #a cambiar cuando haya terreno
	Jefe.position = Vector2(604.0, 278.0)
