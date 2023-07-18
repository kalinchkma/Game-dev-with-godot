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
	- Velocity(0,0), Position(0,0)
	- Acceleration = (0, 9.8) # Positive Goes Down
	- Position += Velocity * DeltaTime
	- Velocity += Acceleration * DeltaTime
- Pseudocode Jumping:
	- Movement, Simplified Game
	- Velocity(0, -400), Position(0,0)
	- Gravity = (0, 9.81) # Position Goes Down
	- Position += Velocity * DeltaTime
	- Velocity += Gravity * DeltaTime

#### Node:
- Nodes can only have 1 parent (tree like structure)
- The node without a parent is called the root node
- Node inherit the transforms of their parents (consider the parent position as origin)
- The root node should manage creation and deletion of their child nodes
- Think of a root node as a "manager" class
- All scene needs a root node

#### Scenes:
- A tree of Nodes is called a Scene
- Every scene must have 1 root node
- Scenes can be saved to disk and instanced into other scences
- If you want to run a game, you must have 1 scene
- A single project can have multiple scenes
- Scenes can be switched, loaded and reloaded
- To add a new scene we need to create a file with the .tscn filename extension
- One cool feature is that we can use a Scene Tree to organize our nodes into groups
- You can the iterate these groups or even call methods and set properties on the group members at once
- Scene are important to create a proper games



