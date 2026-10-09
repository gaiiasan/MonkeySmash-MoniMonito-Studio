extends StaticBody2D

var destruido = false
var daño = 40
var PiñaEnemigo= preload("uid://ixo5ty685qcc")

func recibir_golpe():
	if destruido:
		return

	destruido = true
	explotar.call_deferred()


func explotar():
	var Puñetaso = PiñaEnemigo.instantiate() #crea la piña
	get_parent().add_child(Puñetaso) #la pone como hijo del nodo 2d
	Puñetaso.position.x = global_position.x
	Puñetaso.position.y = global_position.y
	print("KABOOOOOOOOOOOOOOM") #queque

	queue_free()
