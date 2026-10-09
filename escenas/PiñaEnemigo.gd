extends Area2D

@export var TiempoVida = 0.25
var daño = 10

func _ready() -> void:
	await get_tree().create_timer(TiempoVida).timeout
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugador"):
		body.vida -= daño
		body.get_node("JorgeSprite").play("jorge_recibedanio")
