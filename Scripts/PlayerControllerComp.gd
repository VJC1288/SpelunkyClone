extends Node2D

enum PlayerMoveStates {IDLE, WALKING, RUNNING, JUMPING, LOOKING_UP, DUCKING}
enum PlayerAttackStates {PASSIVE, ATTACKING}

@export var speed = 300.0
@export var jump_speed = -400.0
var gravity = 980




@onready var animation_player = $"../AnimationPlayer"

var actor: CharacterBody2D
var currentMoveState: PlayerMoveStates

# Called when the node enters the scene tree for the first time.
func _ready():
	actor = get_parent()
	currentMoveState = PlayerMoveStates.IDLE
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match currentMoveState:
		PlayerMoveStates.IDLE:
			if not actor.is_on_floor():
				actor.velocity.y += gravity * delta
			
			if Input.is_action_just_pressed("jump") and actor.is_on_floor():
				actor.velocity.y = jump_speed


			var direction = Input.get_axis("left", "right")
			
			if direction > 0:
				actor.unflip_sprite()
			elif direction < 0:
				actor.flip_sprite()
			
			if direction:
				actor.velocity.x = direction * speed
				animation_player.play("running")
			else:
				actor.velocity.x = move_toward(actor.velocity.x, 0, speed)
				animation_player.play("idle")
	
				
	actor.move_and_slide()
