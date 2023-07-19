extends Node

var timerNode

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	addRemoveTimerWithScript()
	# addRemoveDeleteTimerNode()
	# addTimeNode()
	# addRemoveTimeNode()
	pass


## This function will add node infinite
func addTimeNode():
	timerNode = Timer.new()
	self.add_child(timerNode)

## This will remove node and add node to orphan nodes
func addRemoveTimeNode():
	var timerNode = Timer.new()
	self.add_child(timerNode)
	self.remove_child(timerNode)

## This will add and rome node and free memory
func addRemoveDeleteTimerNode():
	var timerNode = Timer.new()
	self.add_child(timerNode)
	self.remove_child(timerNode)
	timerNode.queue_free()

func addRemoveTimerWithScript():
	var timerNode = Timer.new()
	var script = load("res://scripts/ExitTreeTimer.gd")
	timerNode.set_script(script)
	self.add_child(timerNode)
	self.remove_child(timerNode)
