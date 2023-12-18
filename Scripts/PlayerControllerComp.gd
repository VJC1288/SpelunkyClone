extends Node2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animation_player = $"../AnimationPlayer"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var actor: CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	actor = get_parent()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if not actor.is_on_floor():
		actor.velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and actor.is_on_floor():
		actor.velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	
	if direction > 0:
		actor.unflip_sprite()
	elif direction < 0:
		actor.flip_sprite()
	
	if direction:
		actor.velocity.x = direction * SPEED
		animation_player.play("running")
	else:
		actor.velocity.x = move_toward(actor.velocity.x, 0, SPEED)
		animation_player.play("idle")
		
	actor.move_and_slide()
