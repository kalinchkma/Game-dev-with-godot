extends Sprite2D

var screenX: float
var screenY: float
var gameScreen

# Position the node
func _enter_tree():
	# positionTopCenter()
	# positionBottomCenter()
	positionCenterCenter()
	# positionLeftCenter()
	# positionRightCenter()
	

func _physics_process(delta):
	# positionTopCenter()
	# positionBottomCenter()
	# positionCenterCenter()
	# positionLeftCenter()
	# positionRightCenter()
	pass
	


func _unhandled_input(event):
	#if event is InputEventKey:
	#	if event.get_physical_keycode_with_modifiers() == KEY_W:
	#		positionTopCenter()
	#	elif event.get_physical_keycode_with_modifiers() == KEY_S:
	#		positionBottomCenter()
	#	elif  event.get_physical_keycode_with_modifiers() == KEY_A:
	#		positionLeftCenter()
	#	elif event.get_physical_keycode_with_modifiers() == KEY_D:
	#		positionRightCenter()
	pass


func  positionTopCenter() -> void:
	positionHorizontalCenter()
	self.position.y = texture.get_height() / 2

func positionBottomCenter() -> void:
	screenY = positionHorizontalCenter()
	self.position.y = screenY - texture.get_height() / 2

func positionCenterCenter() -> void:
	positionHorizontalCenter()
	positionVerticalCenter()
	
func positionLeftCenter() -> void:
	positionVerticalCenter()
	self.position.x = texture.get_width() / 2
	

func positionRightCenter() -> void:
	screenX = positionVerticalCenter()
	self.position.x = screenX - texture.get_width() / 2
	
func positionHorizontalCenter():
	gameScreen = DisplayServer.window_get_size()
	self.position.x = gameScreen.x / 2 
	return gameScreen.y

func positionVerticalCenter():
	gameScreen = DisplayServer.window_get_size()
	self.position.y = gameScreen.y / 2
	return gameScreen.x
