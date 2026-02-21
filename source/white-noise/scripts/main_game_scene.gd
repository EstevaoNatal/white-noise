extends Node2D
@onready var main_game_scene: Node2D = $"."
@onready var nivelAtual:Node
@onready var proximo:Resource
@onready var proximo_nivel
var contador=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	if Input.is_action_just_pressed("resetar"):
		nivelAtual = main_game_scene.get_node("first_area")
		main_game_scene.remove_child(nivelAtual)
		nivelAtual.call_deferred("free")
		proximo = load("res://scenes/first_stage.tscn")
		proximo_nivel = proximo.instantiate()
		main_game_scene.add_child(proximo_nivel)
