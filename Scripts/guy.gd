extends CharacterBody2D

@onready var sprite_2d = $Sprite2D


func flip_sprite():
	sprite_2d.flip_h = true

func unflip_sprite():
	sprite_2d.flip_h = false
