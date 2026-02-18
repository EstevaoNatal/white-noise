extends Node2D
@onready var game: Node2D = $"."
@onready var tile_map_layer: TileMapLayer = $TileMapLayer
@onready var player: CharacterBody2D = $Player_manager/Player
@onready var world: TileMapLayer = $world
@onready var area_2d: Area2D = $Area2D
@onready var sprite_2d: Sprite2D = $Area2D/Sprite2D
@onready var platforms: Node = $platforms

# Called when the node enters the scene tree for the first time.
