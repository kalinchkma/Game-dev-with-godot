extends CharacterBody3D

# movement speed of player
@export var speed = 14

# The downward acceleration when in the air, in meter per second squared
@export var fall_acceleration = 75


var target_velocity = Vector3.ZERO

func _physics_process(delta):
	# local variable that store the input direction
	var direction = Vector3.ZERO
	
	# check move input update direction
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("down"):
		direction.z += 1
	if Input.is_action_pressed("up"):
		direction.z -= 1
	
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at(position + direction, Vector3.UP	)
	
	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	
	# Vertical Velocity
	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)
		
	# Moving Character
	velocity = target_velocity
	# this function allow character move smoothly
	move_and_slide()
