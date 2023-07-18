### Design Principle
- DRY: Don't repeat yourself
- KISS: Keep it simple silly

#### DRY:
- Principle that states, we should not be repeating lines of code
	
#### KISS:
- There are many ways to write code that solves a problem, use a code solution that is easy to read
	
#### SOLID:
- Solid is a more advanced set of design principle that help dictate how to write classes, function and interfaces

### Godot API:
- API: Application Programming Interface
- Godot has 500+ API

#### Transform:
- Scale
- Rotation
- Position
	
#### Scalar:
- A scalar is noting more than a magnitude representation of a vector
	- Distance
	- Speed
	- Time
	- Mass
	- Length
	- Area
	- Volume

#### Vector:
- A vector is a value or quantity that has a direction as well as a magnitude
	- Velocity
	- Acceleration
	- Force
	- Momentum
- Data Type:
	- Vector2
	- Vector3

#### Formula of Velocity:
- Average velocity = (Displacement/Time)
- speed = (Distance/Time)
- Displacement = Average velocity * time
- Acceleration = Velocity / Time
- Velocity = Acceleration * Time
- Position, Velocity, Acceleration:
	- Position: Velocity * Time
	- Velocity: Acceleration * Time
	- Acceleration: Constant value (Never Changes)
- Pseudocode Gravity:
	- # Velocity(0,0), Position(0,0)
	- # Acceleration = (0, 9.8) # Positive Goes Down
	- Position += Velocity * DeltaTime
	- Velocity += Acceleration * DeltaTime

