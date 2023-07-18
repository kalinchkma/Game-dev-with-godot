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

#### Scene Tree vs Scene:
- A scene is a collection of Nodes
	- Your game world is a scene
	- Your different enemies can be a scene
	- Everything you can make in Godot is a Scene
- Scene Tree:
	- The scene tree is a class and the most important one
	- Scene Tree in Godot is the default game loop that is provided to the OS class (When your game starts the OS class is the only thing running)
	- When you start a game, your game usually asks you for a default scene to run
	- A Scene needs a root node (class Node)
	- In order for you the programmer to havea functioning game; you need to provide a scene
	- SceneTree is a singleton
#### Root Viewport:
- Root Viewport is always at the top of your scenes
- Your nodes will always add itself to your root viewport as a child
- Root viewport contains the main viewport
- Anything that is a child of the viewport is drawn inside of the root viewport (default)
- If the root viewport is not the node at the top of your scenes, nothing will be seen on the player screen
- The root viewport cannot be created manually by the programmer, this is created automatically by the scene tree

#### Game Loop:
- At its core, all games can be understood as having one function that contains all the game logic
- The cycle of running this function repeatedly is called a game loop
- Everything on your Computer Screen is justa static image that updates itself repeatedly giving the illusion of movement
- Computers are just like movies, still pictures being shown at fast speeds
- Game loop Pseudocode (Simplified):
	- While(userNotQuitOrCrash):
		- updatePhysics()
		- Scene.updateScenePicture()
		- passToNodeScripts(userInput)
		- performanceUpdate()
		- userNotQuiteOrCrash = updateAppState()
- Update Physics(under the hood)
- Update Our Scene(object moving)
- Pass inputs to scripts(player movement)
- Performance Updates (under the hood, such as remove unused objects, memory managements, culling, etc.)
- Repeatedly Loop until player quits or craches
- We have to be mindful of how we code. A while,a big for loop, complex mathematical algorithms/calculation can crash our game
- A good understanding of Scripts Lifecycles and where certain lines of code should be placed will help a lot

#### Nodes:
- Nodes Represent Behavior
- Nodes give you functionality. Draw a sprite simuate physics, manage player speed, etc
- Game Engine features Rely on Nodes
#### Resources:
- Resources are Data Container
- All they do is hold data. Nodes rely on the data contained in resourcesy

#### Script Lifecycles:
- Most game engines need to run scripts onto game objects
- In games, our game objects, such as real life, have a time to be born, to flourish, and then to perish
- Basic Script Life Cycle
	- Create/Start -> Exits -> Destroy/End
- Godot Script Lifecycles
	- A scene is loaded from disk or created by a script
	- The root node of the newly instantiated scene is added as a chile of the root viewport or to any child of it
	- Every node of the newly added scene will receive the enter_tree() notification in top to bottom order.
	- The ready() notification is called when a node and all its children are inside the active scene
	- While the object is active in the scene callbacks such as the _input(), _process(), _physics_process() are called if used.
	- When a scene is removed, they receive the "exit scene" notification in bottom to top order
	- All classes that inherit from Node class is allow for Lifecycles
	- Node class Provides the virtual functions we can replace and use to write code during certain steps in the cycle
	- Order of virtual function that call first in godot scripts:
		- 1. "Enter Tree"
		- 2. "Ready"
		- 3. "Input"
		- 4. "Physics Processing"
		- 5. "Process"
		- 6. "Exit Tree"
	

