extends StaticBody2D

func _process(_delta: float) -> void:
	if get_parent().EnemigosVivos == 0:
		queue_free()
