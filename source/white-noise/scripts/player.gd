extends CharacterBody2D
@onready var player: CharacterBody2D = $"."

var dead=false
const SPEED = 80.0
const JUMP_VELOCITY = -250.0
var time_jump_charge=0.0
var can_jump = true

#define a cor
enum tinta {preto, azul}
@export var cor_atual : tinta

func _physics_process(delta: float) -> void:
	#pega direção
	var direction := Input.get_axis("lookLeft", "lookRight")
	
	if Input.is_action_just_pressed("trocar_cor_tras"):
		print(tinta.find_key(cor_atual-1))
	if Input.is_action_just_pressed("trocar_cor_frente"):
		print(tinta.find_key(cor_atual+1))
	if not dead:	#input pras várias cores
		if cor_atual==tinta.preto:
			var frenagem=-10
			if can_jump:
				pulo_carimbo(delta,direction)
				can_jump = false
			if not is_on_floor():
				velocity+=get_gravity()*delta
			else:
				can_jump = true
				if velocity.x>0:
					velocity.x+=frenagem
				elif velocity.x<0:
					velocity.x-=frenagem
		elif cor_atual==tinta.azul:
			var frenagem=-0.5
			if can_jump:
				pulo_carimbo(delta,direction)
				can_jump = false
			if not is_on_floor():
				velocity+=get_gravity()*delta
			else:
				can_jump = true
				if velocity.x>0:
					velocity.x+=frenagem
				elif velocity.x<0:
					velocity.x -= frenagem
				#if (velocity.x>-0.01 or velocity.x <0.01) and velocity.x!=0.0:
				#	velocity.x-=velocity.x

	move_and_slide()

	#print(velocity.x)

func pulo_carimbo(delta_jump,direction_jump):
		if Input.is_action_pressed("jump") and is_on_floor():
			time_jump_charge+=2*delta_jump
			#print(direction_jump)
		if Input.is_action_just_released("jump"):
			time_jump_charge=clamp(time_jump_charge,1,2.1)
			#print(direction_jump)
			velocity.x = direction_jump*SPEED*time_jump_charge
			velocity.y = JUMP_VELOCITY*time_jump_charge
			time_jump_charge=0.0
