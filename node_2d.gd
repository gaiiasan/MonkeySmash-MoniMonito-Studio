extends Node2D

var Enemy = preload("uid://butuq7h4yerck")

func _ready() -> void:
	var Enemy1 = Enemy.instantiate()
	var Enemy2 = Enemy.instantiate()
	Enemy1.name = "Enemy1"
	Enemy2.name = "Enemy2"
	add_child(Enemy1)
	add_child(Enemy2)
	Enemy1.position = Vector2(395.0, 164.0)  #a cambiar cuando haya terreno
	Enemy2.position = Vector2(804.0, 378.0)  #a cambiar cuando haya terreno
