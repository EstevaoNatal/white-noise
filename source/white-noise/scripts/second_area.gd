extends Node2D
@onready var current_spawnpoint = Globais.player_spawn
@onready var player: CharacterBody2D = %Player
@onready var ui_cargas: Node2D = %UI_Cargas

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.position = current_spawnpoint
	Globais.fase_anterior = 2
	ui_cargas.get_node("icon").play("level2")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_killzone_body_entered(body: CharacterBody2D) -> void:
	Globais.fase_atual=4



func _on_reload_timer_timeout() -> void:
	player.can_ink = true
