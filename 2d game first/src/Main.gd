extends Node

@export var mob_scene: PackedScene

var score

func _ready() -> void:
	new_game()



func game_over() -> void:
	$MobTimer.stop()
	# $ScoreTimer.stop()


func new_game():
	score = 0
	$Player.start($StartPosition.position)
	# $StartPosition.



func _on_StartTimer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()

func _on_ScoreTimer_timeout() -> void:
	score += 1


func _on_MobTimer_timeout() -> void:

	# new mob scene
	var mob = mob_scene.instantiate()

	# Choose a random location on path2D
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.set_progress_ratio(randf())

	# Set the mob direction perpendicular to the path direction
	var direction = mob_spawn_location.position + PI/2

	# Set the mob position at random location
	mob.position = mob_spawn_location.position

	# Add some randomness to the direction
	# direction += rand_range(-PI/4, PI/4)
	mob.rotation = direction

	# Choose the velocity for the mob
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it ot the Main scene

	add_child(mob)



