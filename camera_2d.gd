extends Camera2D

@onready var player = get_parent().get_node("Player")

func _ready() -> void:
	position = get_viewport_rect().size / 2

func _process(_delta: float) -> void:
	global_position.x = player.global_position.x 
