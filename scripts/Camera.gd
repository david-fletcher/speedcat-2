extends Camera2D

var _state = "LOCKED";
var _destination = null;

const _SPEED = 0.1;
const _EPSILON = 0.1;

func _ready():
	Global.CAMERA = self;


func _process(_delta):
	if (_state == "MOVING"):
		self.position = lerp(self.position, _destination, _SPEED);
		
		if (self.position.distance_to(_destination) < _EPSILON):
			self.position = _destination;
			_state = "LOCKED";


func move_to(newPosition):
	_destination = newPosition;
	_state = "MOVING";
