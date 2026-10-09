extends CharacterBody2D

@onready var Player = $"../Player"
var PiñaEnemigo= preload("uid://dyqvsagajxpw4")
var vida = 90
var movimiento = Vector2()
var velocidad = 2.5
var EnMovimiento = false
var EnemigoMirando = 1
var PuedeAtacar = true

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
		$SpriteEnemigo.flip_h = false 
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
	if PuedeAtacar == false:
		return
	PuedeAtacar = false
	EnMovimiento = false
	movimiento = Vector2.ZERO 
	$SpriteEnemigo.play("enemigo_golpe")
	call_deferred("AtaqueEnemigo")
	await get_tree().create_timer(0.80).timeout
	$SpriteEnemigo.play("enemigo_idle")
	PuedeAtacar = true
	EnMovimiento = true
func AtaqueEnemigo():
	await get_tree().create_timer(0.45).timeout
	var Puñetaso = PiñaEnemigo.instantiate()
	get_parent().add_child(Puñetaso) 
	Puñetaso.position.x = global_position.x + 45 * EnemigoMirando 
	Puñetaso.position.y = global_position.y
	await get_tree().create_timer(Puñetaso.TiempoVida).timeout
func _on_area_2d_2_body_exited(_body: Node2D) -> void:
	if PuedeAtacar == false:
		return
