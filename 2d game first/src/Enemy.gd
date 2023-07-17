extends RigidBody2D

func _ready() -> void:
    $AnimatedSprite2D.play()
    var mob_types = $AnimatedSprite2D.get_sprite_frames().get_animation_names()
    $AnimatedSprite2D.animation = mob_types[randi() % mob_types.size()]

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
