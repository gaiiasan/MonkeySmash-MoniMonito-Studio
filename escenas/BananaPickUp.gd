extends Area2D

func _on_body_entered(body: Node2D) -> void:
	body.Bananas += 5 #cantidad de bananas que da al jugador al ser agarrado
	var VidaMaxima = body.get_node("ProgressBar").max_value
	body.vida = min(body.vida + 10, VidaMaxima)
	queue_free()
