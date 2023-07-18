extends Node

func _enter_tree():
	print(self.name,"Enter  in ther tree")

# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.name,"ready function call")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
