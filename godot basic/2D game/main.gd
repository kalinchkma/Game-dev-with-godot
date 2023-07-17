extends Node

@export var mob_scene: PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# game over signal (hit signal connect from player scene)
func game_over():
	# score timer stop win game is over
	$ScoreTimer.stop()
	# mob timer stop when game is stop
	$MobTimer.stop()
	# game over message show 
	$Hub.show_game_over()
	# music play stop wihen game is over
	$Music.stop()
	# player death music play one time
	$DeathSound.play()

# new game signal (start_game signal conneted from hun scene)
func new_game():
	# new score initialize
	score = 0
	# player start from given position
	$Player.start($StartPosition.position)
	# start startTimer
	$StartTimer.start()
	# update new score
	$Hub.update_score(score)
	# show message
	$Hub.show_message("Get Ready!")
	# all mob deleted when game new start
	get_tree().call_group("mobs", "queue_free")
	# play music
	$Music.play()

# score timer
func _on_score_timer_timeout():
	# update score based on score timer
	score += 1
	$Hub.update_score(score)

# start game timer one time
func _on_start_timer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()

# randomly spawn mon(enemy)
func _on_mob_timer_timeout():
	# Create a new instance of the Mob Scene
	var mob = mob_scene.instantiate()
	
	# Choose a random location on Path2D
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.progress_ratio = randf()

	# Set the mob direction perpendicular to the path direction
	var direction = mob_spawn_location.rotation + PI / 2
	
	# Set the mob's position to a random location
	mob.position = mob_spawn_location.position
	
	# Add some randomness to the direction
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	
	# Choose the velocity for the mob
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)
	
	# Spwan the mob by adding it to the main scene
	add_child(mob)

