extends Node

# Called when enter the tree
func _enter_tree():
	print(self.name,"Enter in the scene")

# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.name," Ready function called")
  
	


func _input(event):
	print(self.name,"input is called")


func _unhandled_input(event):
	print(self.name, "unhandled_input called")

func _unhandled_key_input(event):
	print(self.name, "unhandled_key_input called")

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
