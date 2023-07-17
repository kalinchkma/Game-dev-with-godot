using Godot;
using System;

public partial class Player : Area2D
{
	// Declare member variables here. Examples:
	[Export]
	public int Speed = 400;

	[Signal]
	public delegate void HitEventHandler();

	public Vector2 ScreenSize;

	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
		ScreenSize = GetViewportRect().Size;
		GD.Print(ScreenSize);
		// for hiding when game start
		// Hide();
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(float delta)
	{
		/// Player movement vector
		var velocity = Vector2.Zero;

		if(Input.IsActionPressed("move_right")) {
			velocity.x += 1;
		}
		if(Input.IsActionPressed("move_left")) {
			velocity.x -= 1;
		}
		if(Input.IsActionPressed("move_down")) {
			velocity.y += 1;
		}
		if(Input.IsActionPressed("move_up")) {
			velocity.y -= 1;
		}

		var animationSprite2D = GetNode<AnimatedSprite2D>("AnimatedSprite2D");

		if(velocity.Length() > 0) {
			velocity = velocity.Normalized() * Speed;
			animationSprite2D.Play();
		}
		else {
			animationSprite2D.Stop();
		}

		Position += velocity * (float)delta;

		Position = new Vector2(
			x: Mathf.Clamp(Position.x, 0, ScreenSize.x),
			y: Mathf.Clamp(Position.y, 0, ScreenSize.y)
		);

		// playing animation
		if(velocity.x != 0) {
			animationSprite2D.Animation = "walk";
			animationSprite2D.FlipV = false;

			animationSprite2D.FlipH = velocity.x < 0;
		}
		else if (velocity.y != 0) {
			animationSprite2D.Animation = "up";
			animationSprite2D.FlipV = velocity.y > 0;
		}
	}



	private void OnPlayerBodyEntered(object body)
	{
		Hide();
		EmitSignal("HitEventHandler");
		GetNode<CollisionShape2D>("CollisionShape2D").SetDeferred("disabled", true);
	}


	public void Start(Vector2 pos) {
		Position = pos;
		Show();
		GetNode<CollisionShape2D>("CollisionShape2D").Disabled = false;
	}
}



