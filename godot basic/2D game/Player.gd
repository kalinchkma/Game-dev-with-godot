extends Area2D

@export var speed = 400 # speed of a player (player move in pixels)
var screen_size # size of a game window

signal hit

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	hide() # Player will be hidden when game starts


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # player movement
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	# prevent player from leaving the screen
	position += velocity * delta
	# this will prevent player to leaving the screen horizontaily
	position.x = clamp(position.x, 0, screen_size.x)
	# this will prevent player to leaving the screen vertically
	position.y = clamp(position.y, 0, screen_size.y) 
	
	# Choosing animations
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.flip_v = velocity.y > 0
	

# Body collision with enemy
func _on_body_entered(body):
	hide() # Player will disappears after being hit
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)





