extends Node2D

onready var _currentRoom = $Room1;

# Called when the node enters the scene tree for the first time.
func _ready():
	_currentRoom.load_room();

func _process(_delta):
	# adjust camera if cat has crossed a boundary
	var catPosition = Global.CAT.position;
	if (_currentRoom._roomAbove != null && catPosition.distance_to(_currentRoom._roomAbove._ROOM_CENTER) < catPosition.distance_to(_currentRoom._ROOM_CENTER)):
		room_changed(_currentRoom._roomAbove);
		
	elif (_currentRoom._roomBelow != null && catPosition.distance_to(_currentRoom._roomBelow._ROOM_CENTER) < catPosition.distance_to(_currentRoom._ROOM_CENTER)):
		room_changed(_currentRoom._roomBelow);
		
	elif (_currentRoom._roomLeft != null && catPosition.distance_to(_currentRoom._roomLeft._ROOM_CENTER) < catPosition.distance_to(_currentRoom._ROOM_CENTER)):
		room_changed(_currentRoom._roomLeft);
		
	elif (_currentRoom._roomRight != null && catPosition.distance_to(_currentRoom._roomRight._ROOM_CENTER) < catPosition.distance_to(_currentRoom._ROOM_CENTER)):
		room_changed(_currentRoom._roomRight);


func room_changed(newRoom):
	# tell the camera to move towards the new room
	Global.CAMERA.move_to(newRoom._CAMERA_CENTER);
	
	# remove all nodes from the scene tree that are not _currentRoom or newRoom
	var rooms = get_tree().get_nodes_in_group("ROOM");
	for room in rooms:
		if (room.get_instance_id() != _currentRoom.get_instance_id() && room.get_instance_id() != newRoom.get_instance_id()):
			room.queue_free();
	
	# load newRoom (loading should only bring in new nodes)
	newRoom.load_room();
	
	# set _currentRoom = newRoom;
	_currentRoom = newRoom;
