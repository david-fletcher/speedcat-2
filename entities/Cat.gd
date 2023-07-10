extends KinematicBody2D

const _JUMP = 100.0;
const _WALKSPEED = 100.0;

var _velocity = Vector2();

onready var _sprite = $AnimatedSprite;

func _ready():
	Global.CAT = self;

func _physics_process(delta):
	if not is_on_floor():
		_velocity.y += delta * Global.GRAVITY;
	else:
		_velocity.y = 0.0;

	if Input.is_action_pressed("ui_left"):
		_velocity.x = -_WALKSPEED;
		_sprite.flip_h = true;
	elif Input.is_action_pressed("ui_right"):
		_velocity.x =  _WALKSPEED;
		_sprite.flip_h = false;
	else:
		_velocity.x = 0;
		
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		_velocity.y = -_JUMP;

	move_and_slide(_velocity, Vector2(0, -1));
