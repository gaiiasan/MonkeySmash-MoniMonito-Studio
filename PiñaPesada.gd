extends Area2D

@export var TiempoVida = 0.4
var daño = 60

func _ready() -> void:
	await get_tree().create_timer(TiempoVida).timeout
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	body.vida -= daño
