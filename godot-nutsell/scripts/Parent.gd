extends Node

var Child1

func _enter_tree():
	print(self.name, "Enter in the scene")

# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.name,"Ready function call")
	

func deleteChildren():
	Child1 = get_node('Child1')
	self.remove_child(Child1)
	print("child1 deleted")
	
	

func _input(event):
	print(self.name,"input is called")


func _unhandled_input(event):
	print(self.name, "unhandled_input called")
	if event.is_action_pressed("delete"):
		call_deferred('deleteChildren')
	if event.is_action_pressed("add"):
		self.add_child(Child1)
		move_child(Child1, 0)

func _unhandled_key_input(event):
	print(self.name, "unhandled_key_input called")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
