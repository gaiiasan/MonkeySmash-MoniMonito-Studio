extends CharacterBody2D

@onready var Player = get_node("../../Player")
var PiñaEnemigo= preload("uid://dqytvfkuo6o6n")
var vida = 90
var movimiento = Vector2()
var velocidad = 1
var EnMovimiento = false
var EnemigoMirando = 1

func _ready() -> void:
	EnMovimiento = true
	$BossSprite.play("boss_idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	if EnMovimiento == true:
		move_and_collide(movimiento)
		set_vector(get_node("../../Player").global_position - global_position)
		$BossSprite.play("boss_walk")

	var direccion = Player.global_position - global_position
	if direccion.x > 0:
		EnemigoMirando = 1
		$BossSprite.flip_h = false # pa q se giren
	if direccion.x < 0:
		EnemigoMirando = -1
		$BossSprite.flip_h = true

	#$ProgressBar.value = vida
	#if $ProgressBar.value == 0: 
		#queue_free()


func set_vector(vector):
	movimiento = vector.normalized() * velocidad
	pass

func AtaqueEnemigo():
	
	var Puñetaso = PiñaEnemigo.instantiate() #crea la piña
	get_parent().add_child(Puñetaso) #la pone como hijo del nodo 2d
	Puñetaso.global_position = global_position + Vector2(0 * EnemigoMirando, 35) #crea la piña adelante del jugador
	await get_tree().create_timer(Puñetaso.TiempoVida).timeout #duracion de la piña, la variable esta en PiñaLigera.gd
	print("MUERE asqueroso y repugnante JUGADORRRRRRRRR") #queque

func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "boss_golpe" :
		$BossSprite.play("boss_idle")

func _on_area_2d_body_entered(_body: Node2D) -> void:

		#if body.name == "Player":
	EnMovimiento = false
	movimiento = Vector2.ZERO # Esto pone x:0 e y:0 de una
	$BossSprite.offset = Vector2(0, -30) 
	$BossSprite.play("boss_golpe")
	await get_tree().create_timer(1.25).timeout
	call_deferred("AtaqueEnemigo")
	await get_tree().create_timer(0.25).timeout
	$BossSprite.offset = Vector2(0, 0) 
	$BossSprite.play("boss_idle")

func _on_area_2d_body_exited(_body: Node2D) -> void:
	await get_tree().create_timer(1.25).timeout
	EnMovimiento = true
