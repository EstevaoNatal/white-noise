extends TileMapLayer
@onready var ink: Sprite2D = $ink
#signal carimbou

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	ink.visible = true
