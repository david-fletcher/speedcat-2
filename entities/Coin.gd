extends Area2D

onready var _sprite = $AnimatedSprite;
onready var _origPosY = position.y;

func _on_Coin_body_entered(body):
	if (body.is_in_group("CAT")):
		Global.COINS_COLLECTED += 1;
		self.queue_free();

func _on_AnimatedSprite_frame_changed():
	if (_sprite.frame % 2 == 0):
		self.position.y = _origPosY;
	else:
		self.position.y -= 1;
