extends Control

func _on_volver_pressed() -> void:
	get_tree().change_scene_to_file("uid://clenpv52ljmiv")


func _on_reintentar_pressed() -> void:
	get_tree().paused = false 
	get_tree().reload_current_scene()
	
