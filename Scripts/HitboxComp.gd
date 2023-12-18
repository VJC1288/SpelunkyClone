extends Area2D

class_name HitBoxComponent

@export var teamIdentifier:= 1 
@export var	healthComp: HealthComponent



func _on_area_entered(area:Area2D):
	if area.has_method("get_damage"):
		if area.teamIdentifier != teamIdentifier:
			take_damage(area.get_damage())
		
		
func take_damage(value):
	healthComp.adjust_health(value)
	
