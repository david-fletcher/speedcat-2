extends Node2D

export(String) var _roomAbove = "";
export(String) var _roomBelow = "";
export(String) var _roomLeft = "";
export(String) var _roomRight = "";

signal room_changed(newRoom)

func _ready():
	pass # Replace with function body.


func _on_RoomBottomCollider_body_entered(body):
	if (body.is_in_group("CAT")):
		emit_signal("room_changed", "below", _roomBelow);


func _on_RoomTopCollider_body_entered(body):
	if (body.is_in_group("CAT")):
		emit_signal("room_changed", "above", _roomAbove);


func _on_RoomLeftCollider_body_entered(body):
	if (body.is_in_group("CAT")):
		emit_signal("room_changed", "left", _roomLeft);


func _on_RoomRightCollider_body_entered(body):
	if (body.is_in_group("CAT")):
		emit_signal("room_changed", "right", _roomRight);
