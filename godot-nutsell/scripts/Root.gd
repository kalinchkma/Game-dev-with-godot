extends Node

# Called when enter the tree
func _enter_tree():
	print(self.name,"Enter in the scene")

# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.name," Ready function called")
	call_deferred('deleteChildren')
	
func deleteChildren():
	var child1 = get_node('Parent/Child1')
	self.remove_child(child1)
	print("child1 deleted")
	self.add_child(child1)
	move_child(child1,0)
	

# Called when input receive
func _input(event):
	# print("Input function called")
	pass

# Called when process physics
func _physics_process(delta):
	#print("Physics process function called")
	#print(delta)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print("Process function called")
	#print(delta)
	pass

# Called when scene exit
func _exit_tree():
	#print("Called when exit the scene")
	pass
