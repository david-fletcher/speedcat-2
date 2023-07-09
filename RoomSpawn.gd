extends Node2D

onready var current_room = $Room1;
onready var next_room = null;

onready var STATE = "PLAYING";
var DIRECTION = "";
var EPSILON = 0.1;
var BODY = null;
var WEIGHT = 0.1;

# Called when the node enters the scene tree for the first time.
func _ready():
	current_room.connect("room_changed", self, "_on_room_changed");

func _process(_delta):
	if (STATE == "PLAYING"):
		pass;
	elif (STATE == "TRANSITIONING"):
		# move between rooms
		if (DIRECTION == "left"):
			current_room.position.x = lerp(current_room.position.x, 128.0, WEIGHT);
			next_room.position.x = lerp(next_room.position.x, 0.0, WEIGHT);
			BODY.position.x = lerp(BODY.position.x, 132.0, WEIGHT);
			
			if (abs(next_room.position.x) < EPSILON):
				finalize_room_change();
		elif (DIRECTION == "right"):
			current_room.position.x = lerp(current_room.position.x, -128.0, WEIGHT);
			next_room.position.x = lerp(next_room.position.x, 0.0, WEIGHT);
			BODY.position.x = lerp(BODY.position.x, 12.0, WEIGHT);
			
			if (abs(next_room.position.x) < EPSILON):
				finalize_room_change();
		elif (DIRECTION == "above"):
			current_room.position.y = lerp(current_room.position.y, 96.0, WEIGHT);
			next_room.position.y = lerp(next_room.position.y, 0.0, WEIGHT);
			BODY.position.y = lerp(BODY.position.y, 100.0, WEIGHT);
			
			if (abs(next_room.position.y) < EPSILON):
				finalize_room_change();
		elif (DIRECTION == "below"):
			current_room.position.y = lerp(current_room.position.y, -96.0, WEIGHT);
			next_room.position.y = lerp(next_room.position.y, 0.0, WEIGHT);
			BODY.position.y = lerp(BODY.position.y, 12.0, WEIGHT);
			
			if (abs(next_room.position.y) < EPSILON):
				finalize_room_change();
			
func finalize_room_change():
	next_room.position = Vector2(0.0, 0.0);
	current_room.queue_free();
	current_room = next_room;
	next_room = null;
	
	STATE = "PLAYING";
	DIRECTION = "";
	BODY.resume();
	
	current_room.connect("room_changed", self, "_on_room_changed");	

func _on_room_changed(dir, new_room, body):
	# stop signals from the current room
	current_room.disconnect("room_changed", self, "_on_room_changed");	
	
	# stop player input to the cat
	body.pause();
	
	# load the new scene
	var new_room_scene = load("res://rooms/" + new_room);
	var new_room_instance = new_room_scene.instance();
	
	# add the next room to the screen
	next_room = new_room_instance;
	DIRECTION = dir;
	BODY = body;
	STATE = "TRANSITIONING";
	
	if (dir == "left"):
		next_room.position.x = -128.0;
	elif (dir == "right"):
		next_room.position.x = 128.0;
	elif (dir == "above"):
		next_room.position.y = -96.0;
	elif (dir == "below"):
		next_room.position.y = 96.0;

	self.add_child(next_room);
	
