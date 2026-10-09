extends Area2D
@onready var PlayerMirando = get_parent().get_node("Player").PlayerMirandoIzquierda 
var TiempoLanzamiento = 0.40
var daño = 15

func _process(_delta: float) -> void:
	position.x += 2 * PlayerMirando
	
func _ready() -> void:
	await get_tree().create_timer(TiempoLanzamiento).timeout
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("BarrilesGrupo"):
		body.recibir_golpe()
		queue_free()
	else:
		body.vida -= daño
		body.position.x += 15 * PlayerMirando
		queue_free()
