extends CharacterBody2D

@export var VelocidadJugador: float = 300.0
var PiñaLigera = preload("uid://c8av0r567r867")
var PiñaPesada = preload("uid://dtu0l5g2q51sl")
var AtaqueLanzamiento = preload("uid://crs8beah8sx5i")
var PlayerMirandoIzquierda = 1
var vida = 100
var PuedeMoverse = true
var PuedeAtacar = true
var Bananas = 10

func _ready() -> void:
	$AnimationPlayer.animation_finished.connect(_on_animation_finished)
	$AnimationPlayer.play("jorge_idle")

func _physics_process(_delta):
	#vida = 100     #para probar, lo hace inmortal, borrar despues
	$"../placeholder bananas contador/Label".text = "Bananas: " + str(Bananas) #contador de bananas
	if PuedeMoverse:
		var direccion = Input.get_vector("_MovimientoIzquierda", "_MovimientoDerecha", "_MovimientoArriba", "_MovimientoAbajo")
		velocity = direccion * VelocidadJugador
		move_and_slide()
		
		# CONTROL DE ANIMACIONES DE MOVIMIENTO (Solo si PuedeMoverse es true)
		if direccion != Vector2.ZERO:
			$AnimationPlayer.play("jorge_R_walk")
			if Input.is_action_pressed("_MovimientoIzquierda"):
				PlayerMirandoIzquierda = -1
				$PlayerSprite.flip_h = true
			elif Input.is_action_pressed("_MovimientoDerecha"):
				PlayerMirandoIzquierda = 1
				$PlayerSprite.flip_h = false
	
	if Input.is_action_just_released("_MovimientoDerecha") or Input.is_action_just_released("_MovimientoIzquierda") or Input.is_action_just_released("_MovimientoAbajo") or Input.is_action_just_released("_MovimientoArriba"):
		$AnimationPlayer.play("jorge_idle")
	$ProgressBar.value = vida


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("_AtaqueLigero"):
		$AnimationPlayer.play("jorge_golpe")
		AtaqueLigero()
	if Input.is_action_just_pressed("_AtaquePesado"):
		$AnimationPlayer.play("jorge_golpe")
		AtaquePesado()
	if Input.is_action_just_pressed("_AtaqueDistancia"):
		AtaqueDistancia()
	if Input.is_action_just_pressed("_Pruebas"): #tecla M
		print(position)

func AtaqueLigero():
	if PuedeAtacar == false:
		return
	
	PuedeAtacar = false #anti-spam
	PuedeMoverse = false

	var Puñetaso = PiñaLigera.instantiate() #crea la piña
	get_parent().add_child(Puñetaso) #la pone como hijo del nodo 2d
	Puñetaso.position.x = global_position.x + 45 * PlayerMirandoIzquierda #crea la piña adelante del jugador
	Puñetaso.position.y = global_position.y
	await get_tree().create_timer(0.25).timeout #duracion de la piña
	PuedeMoverse = true #anti-spam
	PuedeAtacar = true
	print("toma piña ligera") #queque

func AtaquePesado():
	if PuedeAtacar == false:
		return
	
	PuedeAtacar = false #anti-spam
	PuedeMoverse = false
	var Puñetaso = PiñaPesada.instantiate() #crea la piña
	get_parent().add_child(Puñetaso) #la pone como hijo del nodo 2d
	Puñetaso.position.x = global_position.x + 45 * PlayerMirandoIzquierda #crea la piña adelante del jugador
	Puñetaso.position.y = global_position.y
	await get_tree().create_timer(0.4).timeout #duracion de la piña
	PuedeMoverse = true #anti-spam
	PuedeAtacar = true
	print("toma piña Pesada") #queque

func AtaqueDistancia():
	if PuedeAtacar == false:
		return
	if Bananas > 0:
		PuedeAtacar = false
		PuedeMoverse = false
		Bananas -= 1
		var Lanzamiento = AtaqueLanzamiento.instantiate()
		get_parent().add_child(Lanzamiento)
		Lanzamiento.position.x = global_position.x + 45 * PlayerMirandoIzquierda 
		Lanzamiento.position.y = global_position.y
		await get_tree().create_timer(0.20).timeout #variable en su script
		PuedeMoverse = true
		PuedeAtacar = true
		print("toma banana wachin")
	
func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "jorge_golpe" :
		PuedeMoverse = true 
		PuedeAtacar = true
		$AnimationPlayer.play("jorge_idle")
		
		
		#esto es un cambio
