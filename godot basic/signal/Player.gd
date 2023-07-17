extends Sprite2D

var speed = 400
var angular_speed = PI
var round_start = false
# Called when the node enters the scene tree for the first time.
func _ready():
	#set_process(false)
	var timer = get_node("Timer")
	timer.timeout.connect(_on_Timer_timeout)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if round_start:
		rotation += angular_speed * delta
		var velocity = Vector2.UP.rotated(rotation) * speed
		position += velocity * delta
	if not round_start:
		var direction = 0
		if Input.is_action_pressed("left"):
			direction += 1
		if Input.is_action_pressed("right"):
			direction -= 1
		rotation += angular_speed * direction * delta
		
		var velocity = Vector2.ZERO
		if Input.is_action_pressed("up"):
			velocity = Vector2.UP.rotated(rotation) * speed
		if Input.is_action_pressed("down"):
			velocity = Vector2.DOWN.rotated(rotation) * speed
		if Input.is_action_pressed("right_mouse"):
			velocity = Vector2.UP.rotated(rotation) * speed
		
		position += velocity * delta

# start
func _on_button_pressed():
	# set_process(not is_processing())
	#set_process(true)
	round_start = true

# stop
func _on_stop_pressed():
	#set_process(false)
	round_start = false

func _on_Timer_timeout():
	# visible = not visible
	pass

