extends Node

func _enter_tree():
	print(self.name,"Enter in the scene")

# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.name," ready function call")

func _input(event):
	print(self.name,"input is called")


func _unhandled_input(event):
	print(self.name, "unhandled_input called")

func _unhandled_key_input(event):
	print(self.name, "unhandled_key_input called")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
