extends StaticBody2D

var BananaEscena = preload("res://escenas/BananaPickUp.tscn")
var destruido = false

func recibir_golpe():
	print("me golpean aaaaaaaaaaaaaaa")
	destruido = true
	$BarrilBanana.play("barril_banana_epxlosion")
	await get_tree().create_timer(0.3).timeout
	explotar.call_deferred()
	
func explotar():
	var cantidad = randi_range(3, 6)

	for i in range(cantidad):
		var banana = BananaEscena.instantiate()
		get_tree().current_scene.add_child(banana)
		banana.global_position = global_position

		var direccion = Vector2(
			randf_range(-1.0, 1.0),
			randf_range(-1.0, 1.0)
		).normalized()

		banana.global_position += direccion * randf_range(20.0, 80.0)

	queue_free()
