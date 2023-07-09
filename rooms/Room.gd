extends Node2D

export(String) var RoomAbove = "";
export(String) var RoomBelow = "";
export(String) var RoomLeft = "";
export(String) var RoomRight = "";

signal room_changed(new_room)

func _ready():
	pass # Replace with function body.


func _on_RoomBottomCollider_body_entered(body):
	if (body.is_in_group("CAT")):
		emit_signal("room_changed", "below", RoomBelow, body);


func _on_RoomTopCollider_body_entered(body):
	if (body.is_in_group("CAT")):
		emit_signal("room_changed", "above", RoomAbove, body);


func _on_RoomLeftCollider_body_entered(body):
	if (body.is_in_group("CAT")):
		emit_signal("room_changed", "left", RoomLeft, body);


func _on_RoomRightCollider_body_entered(body):
	if (body.is_in_group("CAT")):
		emit_signal("room_changed", "right", RoomRight, body);
