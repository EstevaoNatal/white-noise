extends Sprite2D
@onready var player: CharacterBody2D = %Player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	player.carimbar_doc=true
	player.get_node("AnimatedSprite2D").play("carimbando")
	queue_free()
