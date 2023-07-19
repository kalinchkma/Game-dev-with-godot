extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var label = Label.new()
	var win_size = DisplayServer.window_get_size()
	label.text = str(win_size.x) + " X " + str(win_size.y)
	label.position =   win_size-win_size/2
	self.add_child(label)
	pass

func _unhandled_input(event):
	if event is InputEventKey:
		if event.get_physical_keycode_with_modifiers() == KEY_F11:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		elif event.get_physical_keycode_with_modifiers() == KEY_ESCAPE:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
