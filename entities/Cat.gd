extends KinematicBody2D

export var GRAVITY = 450.0
export var JUMP = 200.0
export var WALK_SPEED = 100.0

var velocity = Vector2()

onready var sprite = $AnimatedSprite

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += delta * GRAVITY

	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
		sprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		velocity.x =  WALK_SPEED
		sprite.flip_h = false
	else:
		velocity.x = 0
		
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y = -JUMP

	move_and_slide(velocity, Vector2(0, -1))
