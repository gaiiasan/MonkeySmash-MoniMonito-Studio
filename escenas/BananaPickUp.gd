extends Area2D

func _on_body_entered(body: Node2D) -> void:
	body.Bananas += 5 #cantidad de bananas que da al jugador al ser agarrado
	queue_free()
