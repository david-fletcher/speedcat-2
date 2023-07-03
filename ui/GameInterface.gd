extends Control

onready var coin_label = $MarginContainer/VBoxContainer/Coins
onready var time_label = $MarginContainer/VBoxContainer/Time
onready var start_time = OS.get_ticks_msec()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# set the time
	var elapsed_time = OS.get_ticks_msec() - start_time
	var minutes = elapsed_time / 1000 / 60
	var seconds = elapsed_time / 1000 % 60
	var milliseconds = stepify(elapsed_time % 1000 / 1000.0, 0.01)
	
	var new_timer_text = "%02d" % minutes + ":" + "%02d" % seconds + ":" + ("%.2f" % milliseconds).substr(2)
	time_label.text = new_timer_text
	
	# set the coin count
	coin_label.text = "coins: " + str(Global.coins_collected)
