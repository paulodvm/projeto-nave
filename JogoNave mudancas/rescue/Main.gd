extends Node2D

onready var en = preload("res://Alien.tscn")
var e

var CombustivelShow = preload("res://Combustível.tscn")

# Função para spawnar uma bateria em uma posição aleatória
func spawn_battery():
	var battery_instance = CombustivelShow.instance()
	var random_x = rand_range(0, get_viewport().size.x)
	var random_y = rand_range(0, get_viewport().size.y)
	battery_instance.position = Vector2(random_x, random_y)
	add_child(battery_instance)

# Função para coletar a bateria e spawnar uma nova
func collect_battery(battery):
	battery.queue_free()
	spawn_battery()

func _ready():
	randomize()  # Inicializa o gerador de números aleatórios
	spawn_battery()  # Spawna a primeira bateria

func resp_enemy(pos):
	e = en.instance()
	e.position = pos
	yield(get_tree().create_timer(2.0), "timeout")
	resp()

func resp():
	add_child(e)

	randomize()
	translate(Vector2(0, rand_range(-5, 0)))


	
	
	
	

	
