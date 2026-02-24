extends Node2D
@onready var tile_map_layer: TileMapLayer = $TileMapLayer
@onready var player: CharacterBody2D = $Player_manager/Player
@onready var world: TileMapLayer = $world
@onready var area_2d: Area2D = $Area2D
@onready var sprite_2d: Sprite2D = $Area2D/Sprite2D
@onready var platforms: Node = $platforms
@onready var cargas_de_tinta: Label = %"Cargas de tinta"
@onready var origin_spawnpoint: Marker2D = $spawnpoints/origin_spawnpoint
@onready var player_manager: Node = $Player_manager
@onready var current_spawnpoint = Globais.player_spawn
@onready var first_area: Node2D = $"."
signal load_second_level

var jogador = preload("res://scenes/player.tscn")

# Called when the node enters the scene tree for the first time. # Replace with function body.

func _ready() -> void:
	player.position = current_spawnpoint
	print(DisplayServer.screen_get_size())

func _on_player_ready() -> void:
	pass # Replace with function body.

#func _on_platforms_cargas() -> void:
	#get_node("Player_manager/Player").diminuir_cargas = true
	#cargas_de_tinta.text = "Cargas tem:" + str()



func _on_reload_timer_timeout() -> void:
	player.can_ink = true


func _on_killzone_body_entered(body: CharacterBody2D) -> void:
	Globais.fase_atual=4
