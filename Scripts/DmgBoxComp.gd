extends Area2D

class_name DamageBoxComponent

@export var damage := 10


func get_damage() -> int:
	return damage
	

func set_damage(new_value):
	damage = new_value

