extends CharacterBody2D

@onready var Player = $"../Player"
var PiñaEnemigo= preload("uid://dyqvsagajxpw4")
var vida = 90
var movimiento = Vector2()
var velocidad = 2.5
var EnMovimiento = false
var EnemigoMirando = 1

func _ready() -> void:
	EnMovimiento = true
	$SpriteEnemigo.play("enemigo_idle")


func _physics_process(_delta: float) -> void:

	if EnMovimiento == true:
		move_and_collide(movimiento)
		set_vector(get_node("../Player").global_position - global_position)
		$SpriteEnemigo.play("enemigo_walk")

	var direccion = Player.global_position - global_position
	if direccion.x > 0:
		EnemigoMirando = 1
		$SpriteEnemigo.flip_h = false # pa q se giren
	if direccion.x < 0:
		EnemigoMirando = -1
		$SpriteEnemigo.flip_h = true

	$ProgressBar.value = vida
	if $ProgressBar.value == 0: 
		get_parent().EnemigoMurio()
		queue_free()


func set_vector(vector):
	movimiento = vector.normalized() * velocidad
	pass

func _on_area_2d_2_body_entered(_body: Node2D) -> void:
	print("FUNCIONA")
	#$SpriteEnemigo.play("enemigo_idle")
	#if body.name == "Player":
	EnMovimiento = false
	movimiento = Vector2.ZERO # Esto pone x:0 e y:0 de una
	$SpriteEnemigo.play("enemigo_golpe")
	await get_tree().create_timer(0.35).timeout
	call_deferred("AtaqueEnemigo")
	await get_tree().create_timer(0.50).timeout
	$SpriteEnemigo.play("enemigo_idle")

func AtaqueEnemigo():
	var Puñetaso = PiñaEnemigo.instantiate() #crea la piña
	get_parent().add_child(Puñetaso) #la pone como hijo del nodo 2d
	Puñetaso.position.x = global_position.x + 45 * EnemigoMirando #crea la piña adelante del jugador
	Puñetaso.position.y = global_position.y
	await get_tree().create_timer(Puñetaso.TiempoVida).timeout #duracion de la piña, la variable esta en PiñaLigera.gd
	print("MUERE SUCIO JUGADORRRRRRRRR") #queque

func _on_area_2d_2_body_exited(_body: Node2D) -> void:
	EnMovimiento = true
	pass # Replace with function body.
