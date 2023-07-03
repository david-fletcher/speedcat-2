extends Node2D

export(Resource) var RoomAbove = null
export(Resource) var RoomBelow = null
export(Resource) var RoomLeft = null
export(Resource) var RoomRight = null

func _ready():
	pass # Replace with function body.


func _on_RoomBottomCollider_body_entered(body):
	if (body.is_in_group("CAT")):
		pass # Replace with function body.


func _on_RoomTopCollider_body_entered(body):
	if (body.is_in_group("CAT")):
		pass # Replace with function body.


func _on_RoomLeftCollider_body_entered(body):
	if (body.is_in_group("CAT")):
		pass # Replace with function body.


func _on_RoomRightCollider_body_entered(body):
	if (body.is_in_group("CAT")):
		pass # Replace with function body.
