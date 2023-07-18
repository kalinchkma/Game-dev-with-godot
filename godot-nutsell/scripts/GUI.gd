extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.name, "is ready")

func _input(event):
	print(self.name,"input is called")

func _gui_input(event):
	print(self.name,"gui_input is called")

func _unhandled_input(event):
	print(self.name, "unhandled_input called")

func _unhandled_key_input(event):
	print(self.name, "unhandled_key_input called")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
