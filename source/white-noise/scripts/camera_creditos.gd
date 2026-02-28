extends Camera2D

@export var velocidade = 0.3
@export var fim = 0
@export var timer : Timer

var contator = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if fim > position.y:
		position += Vector2(0,1) * velocidade
	elif contator == 0 :
		contator = 1
		timer.start()
		##get_tree().quit()

func _on_timer_timeout() -> void:
	get_tree().quit()
