using Godot;
using System;

public  class Sprite : Godot.Sprite
{
	// Declare member variables here. Examples:
	// private int a = 2;
	// private string b = "text";
	
		// custom signal
	[Signal]
	public delegate void HealthDepletedEventHandler();
	
	private int Health = 10;
	
	// variable
	private int Speed = 400;
	private float AngularSpeed = Mathf.Pi;
	
	public Sprite()
	{
		GD.Print("Hello, Gamers!");
		
	}
	
	
	
	
	// Called when the node enters the scene tree for the first time.
	public override void _Ready()
	{
	
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	 public override void _Process(float delta)
	 {
		
		/*
		Godot.Vector2 velocity = Vector2.Up.Rotated(Rotation) * Speed;
		Position += velocity * (float) delta;
		Rotation += AngularSpeed * (float) delta;
		*/
		// Auto move 
		Vector2 velocity = Vector2.Up.Rotated(Rotation) * Speed;
		
		Rotation += AngularSpeed * (float) delta;
		Position += velocity * (float) delta;
		GD.Print(Vector2.Up);
		GD.Print("loll");
		/// User input movements
		/*
		Vector2 velocity = Vector2.Zero;
		int direction = 0;
		if(Input.IsActionPressed("move_left"))
		{
			direction = -1;
			
		}
		if (Input.IsActionPressed("move_right"))
		{
			direction = 1;
		}
		Rotation += AngularSpeed * direction * (float) delta;
		if(Input.IsActionPressed("move_up"))
		{
			velocity = Vector2.Up.Rotated(Rotation) * Speed;
		}
		Position += velocity * (float) delta;
		*/
	 }
	
	private void _on_Button_pressed()
	{
		SetProcess(!IsProcessing());
	}

	private void _on_Timer_timeout()
	{
			Visible = !Visible;
	}


}







