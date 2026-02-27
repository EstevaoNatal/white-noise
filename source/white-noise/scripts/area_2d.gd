extends Area2D
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var player: CharacterBody2D = %Player


func _on_body_entered(body: CharacterBody2D) -> void:
	sprite_2d.visible = true
