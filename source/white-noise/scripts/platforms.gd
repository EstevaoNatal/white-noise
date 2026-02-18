extends Node2D
signal createInk

func _on_platform_carimbou() -> void:
	createInk.emit()

func _on_platform_2_carimbou() -> void:
	createInk.emit()
