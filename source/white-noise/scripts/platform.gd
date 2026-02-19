extends StaticBody2D
@onready var ink: Sprite2D = $Area2D/ink
@onready var area_deteccao: CollisionShape2D = $Area2D/area_deteccao
#signal carimbou
var local_carimbado=false
var contador=0
var contador2=0
@onready var player: CharacterBody2D = %Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if contador==0:
		ink.visible = true
		local_carimbado = true
		player.diminuir_cargas=true
	contador+=1 # Replace with function body.
