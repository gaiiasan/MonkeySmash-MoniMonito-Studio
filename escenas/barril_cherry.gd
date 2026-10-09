extends StaticBody2D

var destruido = false
var daño = 40
var DañoAreaCherry= preload("uid://ixo5ty685qcc")

func recibir_golpe():
	if destruido:
		return

	destruido = true
	$BarrilCherrySprite.play("cherry_explosion")
	
	explotar.call_deferred()


func explotar():
	var Boom = DañoAreaCherry.instantiate()
	get_tree().current_scene.add_child(Boom)
	Boom.global_position = global_position
	print("KABOOOOOOOOOOOOOOM") #queque

	queue_free()
