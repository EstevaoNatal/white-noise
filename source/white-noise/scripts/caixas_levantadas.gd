extends AnimatableBody2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var contador=0




func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if contador==0:
		animation_player.play("subir")
		contador=1
	
