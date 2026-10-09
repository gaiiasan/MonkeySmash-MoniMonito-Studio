extends Area2D
@onready var PlayerMirando = get_parent().get_node("Player").PlayerMirandoIzquierda 
@export var TiempoVida = 0.1
var daño = 30

func _ready() -> void:
	await get_tree().create_timer(TiempoVida).timeout
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Barril_banana" or body.name == "BarrilCherry":
		print("soy un abrril")
		body.recibir_golpe()
		return
	else:
		print(body.name + "soy un enemigo")
		body.vida -= daño
		body.position.x += 25 * PlayerMirando
