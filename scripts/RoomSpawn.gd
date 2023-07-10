extends Node2D

onready var _currentRoom = $Room1;

# Called when the node enters the scene tree for the first time.
func _ready():
	_currentRoom.load_room("");

func _process(_delta):
	var catPosition = Global.CAT.position;
	if (_currentRoom._roomAbove != null && catPosition.distance_to(_currentRoom._roomAbove._CENTER) < catPosition.distance_to(_currentRoom._CENTER)):
		room_changed(_currentRoom._roomAbove);
		
	elif (_currentRoom._roomBelow != null && catPosition.distance_to(_currentRoom._roomBelow._CENTER) < catPosition.distance_to(_currentRoom._CENTER)):
		room_changed(_currentRoom._roomBelow);
		
	elif (_currentRoom._roomLeft != null && catPosition.distance_to(_currentRoom._roomLeft._CENTER) < catPosition.distance_to(_currentRoom._CENTER)):
		room_changed(_currentRoom._roomLeft);
		
	elif (_currentRoom._roomRight != null && catPosition.distance_to(_currentRoom._roomRight._CENTER) < catPosition.distance_to(_currentRoom._CENTER)):
		room_changed(_currentRoom._roomRight);


func room_changed(newRoom):
	# tell the camera to move towards the new room
	Global.CAMERA.move_to(newRoom._CENTER);
