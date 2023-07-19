extends Sprite2D

## Here we implemented a bounded game movement

var gameWidth: int = DisplayServer.window_get_size().x
var gameHeight: int = DisplayServer.window_get_size().y
var heroHeight: int = get_texture().get_height()
var heroWidth: int = get_texture().get_width()


enum STATE {LEFT, RIGHT, UP, DOWN, IDLE}
var currentState: int = STATE.IDLE


# Limits
var lowerLimit: int = gameHeight - heroHeight / 6
var upperLimit: int = 0 + heroHeight / 6
var leftLimit: int = 0 + heroWidth / 6
var rightLimit: int = gameWidth - heroWidth / 6



@export var velocity: float = 1000.0
@export var acceleration: float = 300.0
@export var maxSpeed: float = 1500.0

func _enter_tree():
	pass

func _ready():
	setupHero()
	pass

func  _physics_process(delta):
	#gravity(delta)
	if Input.is_key_pressed(KEY_S):
		moveDown(delta)
	if Input.is_key_pressed(KEY_A):
		moveLeft(delta)
	if Input.is_key_pressed(KEY_D):
		moveRight(delta)
	if Input.is_key_pressed(KEY_W):
		moveUp(delta)
	
		




# Causes Small Issues
# we will always enter the event.pressed false once
# we cannot move in two directions at the same time
func _unhandled_input(event):
	# boundedPlayerMovement(event)
	pass

func boundedPlayerMovement(event):
	if event is InputEventKey:
		if event.pressed:
			if event.get_physical_keycode_with_modifiers() == KEY_W:
				currentState = STATE.UP
			if event.get_physical_keycode_with_modifiers() == KEY_S:
				currentState = STATE.DOWN
			if event.get_physical_keycode_with_modifiers() == KEY_D:
				currentState = STATE.RIGHT
			if event.get_physical_keycode_with_modifiers() == KEY_A:
				currentState = STATE.LEFT
		elif event.pressed == false:
			currentState = STATE.IDLE

func gravity(delta: float) -> void:
	moveDown(delta)
	if velocity < maxSpeed:
		addAcceleration(delta)
	
	if position.y > lowerLimit:
		resetFall()

func setupHero():
	# self.position.x = gameWidth / 4
	# self.position.y = gameHeight / 2
	positionBottomCenter()

func addAcceleration(delta: float) -> void:
	velocity += delta * acceleration

func moveRight(delta: float) -> void:
	# if currentState == STATE.RIGHT:
		if position.x < rightLimit:
			position.x += delta * velocity
		if position.x > rightLimit:
			position.x = rightLimit

func moveLeft(delta: float) -> void:
	# if currentState == STATE.LEFT:
		if position.x > leftLimit:
			position.x -= delta * velocity
		if position.x < leftLimit:
			position.x = leftLimit

func moveUp(delta: float) -> void:
	# if currentState == STATE.UP:
		if position.y > upperLimit:
			position.y -= delta * velocity
		if position.y < upperLimit:
			position.y = upperLimit

func moveDown(delta: float) -> void:
	# if currentState == STATE.DOWN:
		if position.y < lowerLimit:
			position.y += delta * velocity
		if position.y > lowerLimit:
			position.y = lowerLimit

func resetFall() -> void:
	position.y = 0 - heroHeight / 2
	

func positionToCenter() -> void:
	position.x = gameWidth / 2
	position.y = heroHeight / 2

func positionBottomCenter() -> void:
	position.x = gameWidth / 2
	position.y = gameHeight - heroHeight / 2
