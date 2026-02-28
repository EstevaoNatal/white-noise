extends Camera2D

@export var velocidade = 0.3
@export var fim = 0
@export var timer : Timer
var comecar=false
var contator = 0
@onready var comecar_creditos: Timer = $"../comecarCreditos"

func _ready() -> void:
	comecar_creditos.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if comecar:
		if fim > position.y:
			position += Vector2(0,1) * velocidade
		elif contator == 0 :
			contator = 1
			timer.start()
			##get_tree().quit()

func _on_timer_timeout() -> void:
	get_tree().quit()


func _on_comecar_creditos_timeout() -> void:
	comecar=true
