extends Area2D

@export var TiempoVida = 0.25
var daño = 30

func _ready() -> void:
	await get_tree().create_timer(TiempoVida).timeout
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	#if body.is_in_group("jugador"):
	body.vida -= daño
	if body.name == "Player":
		body.get_node("JorgeSprite").play("jorge_recibedanio")
		print("el player recibe daño") #queque
	if body.name == "Enemigo":
		body.get_node("EnemySprite").play("enemigo_recibedanio")
	if body.name == "Boss":
		body.get_node("BossSprite").play("boss_recibedanio")
