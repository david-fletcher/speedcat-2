extends Node2D

export(String, FILE) var _roomAboveScene = "";
export(String, FILE) var _roomBelowScene = "";
export(String, FILE) var _roomLeftScene = "";
export(String, FILE) var _roomRightScene = "";

var _roomAbove = null;
var _roomBelow = null;
var _roomLeft = null;
var _roomRight = null;

onready var _CENTER = position + Vector2(54, 48);

func load_room(comingFrom):
	# the "comingFrom" parameter keeps us from spawning duplicate room nodes
	if (_roomAboveScene != "" && comingFrom != "above"):
		_roomAbove = load(_roomAboveScene).instance();
		_roomAbove.position = self.position + Vector2(0.0, -96.0);
		self.get_parent().add_child(_roomAbove);
		
	if (_roomBelowScene != "" && comingFrom != "below"):
		_roomBelow = load(_roomBelowScene).instance();
		_roomBelow.position = self.position + Vector2(0.0, 96.0);
		self.get_parent().add_child(_roomBelow);
		
	if (_roomLeftScene != "" && comingFrom != "left"):
		_roomLeft = load(_roomLeftScene).instance();
		_roomLeft.position = self.position + Vector2(-128.0, 0.0);
		self.get_parent().add_child(_roomLeft);
		
	if (_roomRightScene != "" && comingFrom != "right"):
		_roomRight = load(_roomRightScene).instance();
		_roomRight.position = self.position + Vector2(128.0, 0.0);
		self.get_parent().add_child(_roomRight);
		

