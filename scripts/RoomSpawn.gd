extends Node2D

onready var _currentRoom = $Room1;

# Called when the node enters the scene tree for the first time.
func _ready():
	_currentRoom.connect("room_changed", self, "_on_room_changed");

func _on_room_changed(dir, newRoom):
	# stop signals from the current room
	_currentRoom.disconnect("room_changed", self, "_on_room_changed");	
	
	# load the new scene
	var newRoomScene = load("res://rooms/" + newRoom);
	var newRoomInstance = newRoomScene.instance();
	
	var distanceToMove = Vector2(0.0, 0.0);
	
	if (dir == "left"):
		distanceToMove = Vector2(-128.0, 0.0);
	elif (dir == "right"):
		distanceToMove = Vector2(128.0, 0.0);
	elif (dir == "above"):
		distanceToMove = Vector2(0.0, -96.0);
	elif (dir == "below"):
		distanceToMove = Vector2(0.0, 96.0);
		
	newRoomInstance.position += distanceToMove;
		
	self.add_child(newRoomInstance);
	
	# tell the camera to move towards the new room
	Global.CAMERA.move_to(Global.CAMERA.position + distanceToMove);
