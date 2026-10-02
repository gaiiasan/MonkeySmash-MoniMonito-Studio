extends Camera2D

@onready var player = get_parent().get_node("Player") #toma la info del jugador

func _ready() -> void:
	position = get_viewport_rect().size / 2
	
func _process(_delta: float) -> void:
	global_position.x = player.global_position.x #pone al jugador en el centro de la camara

#layer 1 player
#layer 2 enemigo
#layer 3 piña ligera player
#layer 4 piña pesada player no implementado
#layer 5 piña enemigo
#layer 6 libre
#layer 7 libre
#layer 8 libre
#layer 9 libre
#layer 10 terreno no implementado
