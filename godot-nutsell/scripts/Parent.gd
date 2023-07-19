extends Node

var Child1

func _enter_tree():
	print(self.name, "Enter in the scene")

# Called when the node enters the scene tree for the first time.
func _ready():
	Child1 = get_node('Child1')
	print(self.name,"Ready function call")
	

func deleteChildren():
	self.remove_child(Child1)
	print("child1 deleted")
	
	

func _input(event):
	print(self.name,"input is called")


func _unhandled_input(event):
	print(self.name, "unhandled_input called")
	if event is InputEventKey:
		if event.get_physical_keycode_with_modifiers() == KEY_ALT:
			if has_node('Child1'):
				call_deferred('deleteChildren')
		elif event.get_physical_keycode_with_modifiers() == KEY_CTRL:
			if not has_node("Child1"):
				self.add_child(Child1)
				move_child(Child1, 0)
	else:
		print(event)

func _unhandled_key_input(event):
	print(self.name, "unhandled_key_input called")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
