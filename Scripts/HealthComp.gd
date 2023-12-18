extends Node2D

class_name HealthComponent

@export var max_health:=100
var health
var actor

func _ready():
	actor = get_parent()
	health = max_health
	
func get_health() -> int:
	return health
	
func set_health_to(new_health):
	health = new_health
	if health <= 0:
		die()
	
func adjust_health(adjustment):
	health += adjustment
	if health <= 0:
		die()

func die():
	actor.queue_free()
