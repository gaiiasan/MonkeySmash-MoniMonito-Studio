extends StaticBody2D

@onready var barril_banana: AnimatedSprite2D = $sprite_barril_banana
@onready var colision_barril_banana: CollisionShape2D = $barril_hitbox
@onready var area_barril: Area2D = $area_barril

var destruido = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func golpe_barril():
		destruido = true
		barril_banana.play("barril_banana_epxlosion")
		
func _on_sprite_barril_banana_animation_finished() -> void:
	if barril_banana.animation == "barril_banana_exlosion":
		queue_free()

func _on_area_barril_body_exited(body: Node2D):
	if destruido:
		return
		
	if area_barril.is_in_group("ataque_jorge"):
		golpe_barril()
