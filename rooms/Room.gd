extends Node2D

export(String, FILE) var _roomAboveScene = "";
export(String, FILE) var _roomBelowScene = "";
export(String, FILE) var _roomLeftScene = "";
export(String, FILE) var _roomRightScene = "";

var _roomAbove = null;
var _roomBelow = null;
var _roomLeft = null;
var _roomRight = null;

onready var _CAMERA_CENTER = position + Vector2(96, 54);
onready var _ROOM_CENTER = position + Vector2(72, 52);

func load_room():
	if (_roomAboveScene != ""):
		var foundRoom = find_room(_roomAboveScene);
		if (foundRoom != null):
			_roomAbove = foundRoom;
		else:
			_roomAbove = load(_roomAboveScene).instance();
			_roomAbove.position = self.position + Vector2(0.0, -96.0);
			self.get_parent().add_child(_roomAbove);
		
	if (_roomBelowScene != ""):
		var foundRoom = find_room(_roomBelowScene);
		if (foundRoom != null):
			_roomBelow = foundRoom;
		else:
			_roomBelow = load(_roomBelowScene).instance();
			_roomBelow.position = self.position + Vector2(0.0, 96.0);
			self.get_parent().add_child(_roomBelow);
		
	if (_roomLeftScene != ""):
		var foundRoom = find_room(_roomLeftScene);
		if (foundRoom != null):
			_roomLeft = foundRoom;
		else:
			_roomLeft = load(_roomLeftScene).instance();
			_roomLeft.position = self.position + Vector2(-128.0, 0.0);
			self.get_parent().add_child(_roomLeft);
		
	if (_roomRightScene != ""):
		var foundRoom = find_room(_roomRightScene);
		if (foundRoom != null):
			_roomRight = foundRoom;
		else:
			_roomRight = load(_roomRightScene).instance();
			_roomRight.position = self.position + Vector2(128.0, 0.0);
			self.get_parent().add_child(_roomRight);


func find_room(searchResourcePath):
	# get a list of rooms already loaded
	var rooms = get_tree().get_nodes_in_group("ROOM");
	for room in rooms:
		if room.filename == searchResourcePath:
			return room;
	
	return null;
