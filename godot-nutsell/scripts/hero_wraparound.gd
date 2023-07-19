extends Node2D

var hero
var gameWidth: int
var gameHeight: int
var heroHeight: int
var heroWidth: int
var halfHeroHeight: int
var halfHeroWidth: int

var speedOnXAxis: float = 0.0
var speedOnYAxis: float = 0.0

@export var maxSpeed: float = 1000.0
@export var acceleration: float = 300.0



# Limits
var lowerLimit: int
var upperLimit: int
var leftLimit: int
var rightLimit: int

func _ready():
	setupHero()
	setupGame()

func _physics_process(delta):
	if Input.is_key_pressed(KEY_W):
		moveUp(delta)
	if Input.is_key_pressed(KEY_S):
		moveDown(delta)
	if Input.is_key_pressed(KEY_D):
		moveRight(delta)
	if Input.is_key_pressed(KEY_A):
		moveLeft(delta)
	
	moveHero(delta)
	clampSpeed()
	wrapAroundCheck()
func setupHero():
	hero = get_node("wrap_hero")
	heroHeight = hero.texture.get_height()
	heroWidth = hero.texture.get_width()
	halfHeroHeight = heroHeight / 2
	halfHeroWidth = heroHeight / 2
	position.x = halfHeroWidth 
	position.y = 0 + halfHeroHeight

func setupGame():
	gameWidth = DisplayServer.window_get_size().x
	gameHeight = DisplayServer.window_get_size().y
	upperLimit = 0
	lowerLimit = gameHeight
	leftLimit = 0
	rightLimit = gameWidth
	
func moveRight(delta: float) -> void:
	accelerationOnX(delta)

func moveLeft(delta: float) -> void:
	accelerationOnX(-delta)

func moveUp(delta: float) -> void:
	accelerationOnY(-delta)

func moveDown(delta: float) -> void:
	accelerationOnY(delta)

func accelerationOnX(delta: float) -> void:
	if abs(speedOnXAxis) <= maxSpeed:
		speedOnXAxis += delta * acceleration

func accelerationOnY(delta: float) -> void:
	if abs(speedOnYAxis) <= maxSpeed:
		speedOnYAxis += delta * acceleration

func moveHero(delta: float) -> void:
	position.x += speedOnXAxis * delta
	position.y += speedOnYAxis * delta
	#position.x += clamp(speedOnXAxis, -maxSpeed, maxSpeed) * delta
	#position.y += clamp(speedOnYAxis, -maxSpeed, maxSpeed) * delta
	

func wrapAroundCheck() -> void:
	if position.y > lowerLimit:
		position.y = 0
	if position.y < upperLimit:
		position.y = gameHeight
	if position.x > rightLimit: 
		position.x = 0
	if position.x < leftLimit:
		position.x = gameWidth

func clampSpeed() -> void:
	
	# you can use the clamp method to keep a value within a range
	# speedOnXAxis = clamp(speedOnXAxis, -maxSpeed, maxSpeed)
	# speedOnYAxis = clamp(speedOnYAxis, -maxSpeed, maxSpeed)
	
	# check X
	if speedOnXAxis > maxSpeed:
		speedOnXAxis = maxSpeed
	if speedOnXAxis < -maxSpeed:
		speedOnXAxis = -maxSpeed
	
	# Check y
	if speedOnYAxis > maxSpeed:
		speedOnYAxis = maxSpeed
	if speedOnYAxis < - maxSpeed:
		speedOnYAxis = -maxSpeed
