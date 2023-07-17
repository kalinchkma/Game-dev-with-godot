extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var start = get_node("Start")
	var stop = get_node("Stop")
	stop.visible = false
	start.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# start pressed
func _on_button_pressed():
	var start = get_node("Start")
	var stop = get_node("Stop")
	stop.visible = true
	start.visible = false

# stop pressed 
func _on_stop_pressed():
	var start = get_node("Start")
	var stop = get_node("Stop")
	var player = get_node("Player")
	#player.set_process(false)
	stop.visible = false
	start.visible = true
