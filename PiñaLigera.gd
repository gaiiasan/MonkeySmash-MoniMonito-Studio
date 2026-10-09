extends Area2D
@onready var PlayerMirando = get_parent().get_node("Player").PlayerMirandoIzquierda 
@export var TiempoVida = 0.1
var daño = 30

func _ready() -> void:
	await get_tree().create_timer(TiempoVida).timeout
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("BarrilesGrupo"):
		body.recibir_golpe()
		return
	else:
		body.vida -= daño
		body.position.x += 25 * PlayerMirando
