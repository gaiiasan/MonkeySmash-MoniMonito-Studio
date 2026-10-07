extends CharacterBody2D

@onready var Player = get_node("../../../Player")

var PiñaEnemigo= preload("uid://dqytvfkuo6o6n")
var Ganaste = preload("uid://vu0vf53xxp6y")

var vida = 90
var movimiento = Vector2()
var velocidad = 3
var EnMovimiento = false
var EnemigoMirando = 1

# variables q afectan elecciond e objetivo a aatacar
var Objetivo
@onready var Barriles = get_node("../../barriles placeholder").get_children()
var tiempo_para_elegir = 0.1
var intervalo_eleccion = 5.0

func _ready() -> void:
	EnMovimiento = false
	Objetivo = Player
	$BossSprite.play("boss_idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	tiempo_para_elegir -= delta

	if tiempo_para_elegir <= 0:
		ElegirObjetivo()
		tiempo_para_elegir = intervalo_eleccion
	
	if EnMovimiento == true:
		var distancia = global_position.distance_to(Objetivo.global_position)

		if distancia > 100:
			move_and_collide(movimiento)
			set_vector(Objetivo.global_position - global_position)
			$BossSprite.play("boss_walk")
		else:
			movimiento = Vector2.ZERO
			$BossSprite.play("boss_idle")

	var direccion = Objetivo.global_position - global_position
	if direccion.x > 0:
		EnemigoMirando = 1
		$BossSprite.flip_h = false # pa q se giren
	if direccion.x < 0:
		EnemigoMirando = -1
		$BossSprite.flip_h = true

	$ProgressBar.value = vida
	$"../../../../UI_ingame/placeholder bananas contador/Label/vidaBoss".value = vida

	if $ProgressBar.value == 0: 
		###AGREGAR LUEGOO!!##get_parent().get_parent().EnemigoMurio()
		
		var capa_interfaz = CanvasLayer.new()
		get_tree().current_scene.add_child(capa_interfaz)
		
		# 2. Cargamos e instanciamos tu pantalla de victoria
		var escena_popup = preload("uid://vu0vf53xxp6y")
		var pantalla_victoria = escena_popup.instantiate()
		
		# 3. Metemos la pantalla ADENTRO del CanvasLayer
		capa_interfaz.add_child(pantalla_victoria)
		
		get_tree().paused = true 
		queue_free()
		
		#get_tree().change_scene_to_file("uid://vu0vf53xxp6y")


func set_vector(vector):
	movimiento = vector.normalized() * velocidad

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

func ElegirObjetivo():
	var numero = randi_range(0, 5)
	print("Estoy elijiendo a mi victima")

	if numero == 0 or numero == 1:
		Objetivo = Player
		print("ELIJO AL JUGADOR")
	else:
		Objetivo = Barriles.pick_random()
		print("ELIJO UN BARRIL")
