extends StaticBody2D
@onready var ink_preto: Sprite2D = $Area2D/ink_preto
@onready var ink_verde: Sprite2D = $Area2D/ink_verde
@onready var ink_azul: Sprite2D = $Area2D/ink_azul
@onready var area_deteccao: CollisionShape2D = $Area2D/area_deteccao
#signal carimbou
var contador=0
var contador2=0
@onready var player: CharacterBody2D = %Player
var parado = true
@onready var can_bounce = false
var speed=0
var cor_atual_bloco=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	


func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	speed = Globais.player_jump_velocidade
	if ink_verde.visible==false:
		can_bounce=false
	if player.cor_atual==0:
		if ink_preto.visible==false:
			if player.can_ink:
				player.ultima_carimbada=0
				can_bounce=false
				ink_preto.visible = true
				ink_azul.visible=false
				ink_verde.visible=false
				player.diminuir_cargas=true
	elif player.cor_atual==1:
		if ink_azul.visible==false:
			if player.can_ink:
				player.ultima_carimbada=1
				can_bounce=false
				ink_azul.visible = true
				ink_verde.visible=false
				ink_preto.visible=false
				player.diminuir_cargas=true
	elif player.cor_atual==2:
		if not Input.is_action_pressed("down"):
			if GlobaisNode.get_node("tempo_verde").is_stopped() and can_bounce:
				GlobaisNode.get_node("tempo_verde").start()
				player.velocity.y = speed*0.8
				Globais.player_jump_velocidade = player.velocity.y
				print(player.velocity.y)
				print("aboba")
		if ink_verde.visible==false:
			if player.can_ink:
				player.ultima_carimbada=2
				can_bounce=true
				ink_azul.visible=false
				ink_preto.visible=false
				ink_verde.visible = true
				player.diminuir_cargas=true
