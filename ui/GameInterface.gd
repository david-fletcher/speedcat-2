extends Control

onready var _coinLabel = $MarginContainer/VBoxContainer/Coins;
onready var _timeLabel = $MarginContainer/VBoxContainer/Time;
onready var _STARTTIME = OS.get_ticks_msec();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# set the time
	var elapsed_time = OS.get_ticks_msec() - _STARTTIME;
	var minutes = elapsed_time / 1000 / 60;
	var seconds = elapsed_time / 1000 % 60;
	var milliseconds = stepify(elapsed_time % 1000 / 1000.0, 0.01);
	
	var newTimerText = "%02d" % minutes + ":" + "%02d" % seconds + ":" + ("%.2f" % milliseconds).substr(2);
	_timeLabel.text = newTimerText;
	
	# set the coin count
	_coinLabel.text = "coins: " + str(Global.COINS_COLLECTED);
