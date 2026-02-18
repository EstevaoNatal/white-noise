extends Area2D
@onready var sprite_2d: Sprite2D = $Sprite2D


func _on_body_entered(body: CharacterBody2D) -> void:
	sprite_2d.visible = true
