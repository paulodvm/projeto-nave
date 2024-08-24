extends KinematicBody2D

onready var alvo = get_node("/root/Main/Player")

var dpers = 1000
var speed = 100
var controledano = 0

func _ready():
	randomize()
	translate((Vector2(0, rand_range(-5, 0))))
	
	

func _physics_process(delta):
	var dist = position.distance_to(alvo.position)
	if dist < dpers:
		var vel = (alvo.position - position).normalized()
		move_and_slide(vel*speed)
	if dist <= 57:
		$AnimatedSprite.animation = "explosao"
		$morte.start()
		if controledano == 0:
			alvo.tomadano()
			controledano=1

func morte():
	get_parent().resp_enemy(position)
	queue_free()
	

func _on_morte_timeout():
	morte()
