extends Node
@onready var player: CharacterBody2D = $Player
@onready var camera_2d: Camera2D = $Camera2D
var dead=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera_2d.position = player.position
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.get_node("CollisionShape2D"):
		camera_2d.position = player.position
