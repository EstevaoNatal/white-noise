extends CharacterBody2D
@onready var player: CharacterBody2D = $"."
@onready var cargas_de_tinta: Label = %"Cargas de tinta"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
signal mudou_tinta

var dead=false
const SPEED = 80.0
const JUMP_VELOCITY = -250.0
var time_jump_charge=0.0
var can_jump = true
var diagonal = 0.0
var max_velocidade_y=1
var ultima_carimbada:int = 0

#define a cor
enum tinta {preto, azul, verde}
@export var cor_atual : tinta
@onready var contador_tinta=100
@onready var diminuir_cargas: bool = false
@onready var contador_tinta_azul: int = 0
@onready var can_ink=false

func _on_ready() -> void:
	mudou_tinta.emit(cor_atual as tinta)
	diminuir_cargas = false
	cargas_de_tinta.text = "Tem " + str(contador_tinta/2) + " cargas"

func _physics_process(delta: float) -> void:
	#pega direção		
	var direction := Input.get_axis("lookLeft", "lookRight")
	if direction==-1:
		animated_sprite_2d.flip_h=true
	elif direction==1:
		animated_sprite_2d.flip_h=false
	
	if ultima_carimbada==0:
		if not is_on_floor():
			if velocity.y<0:
				animated_sprite_2d.play("pulando_preto")
			else:
				animated_sprite_2d.play("indo_pular_preto")
		else:
			animated_sprite_2d.play("idle_preto")
	elif ultima_carimbada==1:
		if not is_on_floor():
			if velocity.y<0:
				animated_sprite_2d.play("pulando_azul")
			else:
				animated_sprite_2d.play("indo_pular_azul")
		else:
			animated_sprite_2d.play("idle_azul")
	elif ultima_carimbada==2:
		if not is_on_floor():
			if velocity.y<0:
				animated_sprite_2d.play("pulando_verde")
			else:
				animated_sprite_2d.play("indo_pular_verde")
		else:
			animated_sprite_2d.play("idle_verde")

	if diminuir_cargas:
		if cor_atual!=1:
			contador_tinta-=2
			cargas_de_tinta.text = "Tem " + str(contador_tinta/2) + " cargas"
			diminuir_cargas=false
		else:
			contador_tinta-=1
			cargas_de_tinta.text = "Tem " + str(contador_tinta/2) + " cargas"
			diminuir_cargas=false
	
	if Input.is_action_just_pressed("trocar_cor_tras") && cor_atual>0:
		cor_atual= cor_atual - 1 as tinta
		mudou_tinta.emit(cor_atual as tinta)
	if Input.is_action_just_pressed("trocar_cor_frente") && cor_atual<tinta.size()-1:
		cor_atual= cor_atual + 1 as tinta
		mudou_tinta.emit(cor_atual as tinta)
	
	if not dead:	#input pras várias cores
		if cor_atual==tinta.preto:
			mov_cor_preta(delta,direction)
		if cor_atual==tinta.azul:
			mov_cor_azul(delta,direction)
		if cor_atual==tinta.verde:
			mov_cor_verde(delta,direction)
	move_and_slide()

func pulo_carimbo(delta_jump,direction_jump):
	#print(time_jump_charge)
	if Input.is_action_pressed("jump") and is_on_floor():
		#print(diagonal)
		time_jump_charge+=2*delta_jump
		print(time_jump_charge, " ", velocity.y)
	if Input.is_action_just_released("jump"):
		if Input.is_action_pressed("up"):
			diagonal=1.2
		elif Input.is_action_pressed("down"):
			diagonal=-0.7
		#print(diagonal)
		time_jump_charge=clamp(time_jump_charge,1,2.1)
		print(time_jump_charge, " ", velocity.y)
		velocity.x = direction_jump*SPEED*time_jump_charge
		velocity.y = JUMP_VELOCITY*time_jump_charge - 200*diagonal
		Globais.player_jump_velocidade = JUMP_VELOCITY*time_jump_charge - 200*diagonal
		time_jump_charge=0.0
		diagonal=0.0

func mov_cor_preta(deltaPreto,directionPreto):
	velocity.x = snappedf(velocity.x,10)
	#print(velocity.x)
	var frenagem=10
	if can_jump:
		pulo_carimbo(deltaPreto,directionPreto)
		can_jump = false
	if not is_on_floor():
		velocity+=get_gravity()*deltaPreto
	else:
		can_jump = true
		#print(velocity.x, velocity.y)
		if velocity.x>0:
			velocity.x-=frenagem
		elif velocity.x<0:
			velocity.x+=frenagem
					
func mov_cor_azul(deltaAzul,directionAzul):
	var frenagem=0.5
	if can_jump:
		pulo_carimbo(deltaAzul,directionAzul)
		can_jump = false
	if not is_on_floor():
		velocity+=get_gravity()*deltaAzul
	else:
		can_jump = true
		#print(velocity.x, velocity.y)
		if velocity.x>0:
			velocity.x-=frenagem
		elif velocity.x<0:
			velocity.x += frenagem

func mov_cor_verde(deltaVerde,directionVerde):
	velocity.x = snappedf(velocity.x,10)
	#print(velocity.x)
	var frenagem=10
	if can_jump:
		pulo_carimbo(deltaVerde,directionVerde)
		can_jump = false
	if not is_on_floor():
		velocity+=get_gravity()*deltaVerde
	else:
		can_jump = true
		#print(velocity.x, velocity.y)
		if velocity.x>0:
			velocity.x-=frenagem
		elif velocity.x<0:
			velocity.x+=frenagem
