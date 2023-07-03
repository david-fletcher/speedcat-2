extends Area2D

onready var sprite = $AnimatedSprite
onready var orig_pos_y = position.y

func _on_Coin_body_entered(body):
	if (body.is_in_group("CAT")):
		queue_free()
		Global.coins_collected += 1

func _on_AnimatedSprite_frame_changed():
	if (sprite.frame % 2 == 0):
		position.y = orig_pos_y
	else:
		position.y -= 1
