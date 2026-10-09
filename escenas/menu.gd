extends Control

func _on_jugar_pressed() -> void:
	get_tree().paused = false 
	get_tree().change_scene_to_file("res://escenas/node.tscn")


func _on_salir_pressed() -> void:
	get_tree().quit()


func _on_creditos_pressed() -> void:
	$"../Creditos".show() 
