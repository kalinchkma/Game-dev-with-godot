<!-- @format -->

### Design Principle

- DRY: Don't repeat yourself
- KISS: Keep it simple silly

#### DRY:

- Principle that states, we should not be repeating lines of code

#### KISS:

- There are many ways to write code that solves a problem, use a code solution
  that is easy to read

#### SOLID:

- Solid is a more advanced set of design principle that help dictate how to
  write classes, function and interfaces

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
- Displacement = Average velocity \* time
- Acceleration = Velocity / Time
- Velocity = Acceleration \* Time
- Position, Velocity, Acceleration:
  - Position: Velocity \* Time
  - Velocity: Acceleration \* Time
  - Acceleration: Constant value (Never Changes)
- Pseudocode Gravity:
  - Velocity(0,0), Position(0,0)
  - Acceleration = (0, 9.8) # Positive Goes Down
  - Position += Velocity \* DeltaTime
  - Velocity += Acceleration \* DeltaTime
- Pseudocode Jumping:
  - Movement, Simplified Game
  - Velocity(0, -400), Position(0,0)
  - Gravity = (0, 9.81) # Position Goes Down
  - Position += Velocity \* DeltaTime
  - Velocity += Gravity \* DeltaTime

#### Node:

- Nodes can only have 1 parent (tree like structure)
- The node without a parent is called the root node
- Node inherit the transforms of their parents (consider the parent position as
  origin)
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
- One cool feature is that we can use a Scene Tree to organize our nodes into
  groups
- You can the iterate these groups or even call methods and set properties on
  the group members at once
- Scene are important to create a proper games

#### Scene Tree vs Scene:

- A scene is a collection of Nodes
  - Your game world is a scene
  - Your different enemies can be a scene
  - Everything you can make in Godot is a Scene
- Scene Tree:
  - The scene tree is a class and the most important one
  - Scene Tree in Godot is the default game loop that is provided to the OS
    class (When your game starts the OS class is the only thing running)
  - When you start a game, your game usually asks you for a default scene to run
  - A Scene needs a root node (class Node)
  - In order for you the programmer to havea functioning game; you need to
    provide a scene
  - SceneTree is a singleton

#### Root Viewport:

- Root Viewport is always at the top of your scenes
- Your nodes will always add itself to your root viewport as a child
- Root viewport contains the main viewport
- Anything that is a child of the viewport is drawn inside of the root viewport
  (default)
- If the root viewport is not the node at the top of your scenes, nothing will
  be seen on the player screen
- The root viewport cannot be created manually by the programmer, this is
  created automatically by the scene tree

#### Game Loop:

- At its core, all games can be understood as having one function that contains
  all the game logic
- The cycle of running this function repeatedly is called a game loop
- Everything on your Computer Screen is justa static image that updates itself
  repeatedly giving the illusion of movement
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
- Performance Updates (under the hood, such as remove unused objects, memory
  managements, culling, etc.)
- Repeatedly Loop until player quits or craches
- We have to be mindful of how we code. A while,a big for loop, complex
  mathematical algorithms/calculation can crash our game
- A good understanding of Scripts Lifecycles and where certain lines of code
  should be placed will help a lot

#### Nodes:

- Nodes Represent Behavior
- Nodes give you functionality. Draw a sprite simuate physics, manage player
  speed, etc
- Game Engine features Rely on Nodes

#### Resources:

- Resources are Data Container
- All they do is hold data. Nodes rely on the data contained in resourcesy

#### Script Lifecycles:

- Most game engines need to run scripts onto game objects
- In games, our game objects, such as real life, have a time to be born, to
  flourish, and then to perish
- Basic Script Life Cycle
  - Create/Start -> Exits -> Destroy/End
- Godot Script Lifecycles
  - A scene is loaded from disk or created by a script
  - The root node of the newly instantiated scene is added as a child of the
    root viewport or to any child of it
  - Every node of the newly added scene will receive the enter_tree()
    notification in top to bottom order.
  - The ready() notification is called when a node and all its children are
    inside the active scene
  - While the object is active in the scene callbacks such as the \_input(),
    \_process(), \_physics_process() are called if used.
  - When a scene is removed, they receive the "exit scene" notification in
    bottom to top order
  - All classes that inherit from Node class is allow for Lifecycles
  - Node class Provides the virtual functions we can replace and use to write
    code during certain steps in the cycle
  - Order of virtual function that call first in godot scripts:
    - "Enter Tree" | "\_enter_tree()"
    - "Ready" | "\_ready()"
    - "Input" | "\_input()"
    - "Physics Processing" | "\_physics_process()"
    - "Process" | "\_process()"
    - "Exit Tree" | "\_exit_tree()"
- Virtual Method:
  - Virtual method allows subclasses of the base class type that has the virtual
    method to override the method
  - For the purpopses of \*Godot, all virtual method means is that its methods
    will be called if the Node is active in the SceneTree
  - `_enter_tree()` Virtual method:
    - Enter Tree is a virtual method, the Node class and all its subclasses
      provides this virtual method
    - When to use it:
      - If you need property values reset and/or some type of action to happened
        immediately (every time the node is active on the Scence Tree)
      - Good for Scenes (Gameobjects) that will be active and inactive, and
        never released from memory
      - \*\_enter_tree() is very specialized; prioritize \_ready() over
        \_enter_tree() when setting inital property values
  - `_ready()` Virtual method:
    - The `_ready()` function can be used by any class that inherits from the
      node class
    - This function gets called in our game loop when a "Permanent" Node is
      added to the scene tree
    - If a Node has children, the children Node will have their `_ready()`
      function triggered first, and this works its way up to the parent Node
    - Root Node's `_ready()` function is called last
    - The `_ready()` method is called only once, will not be called a seconed
      time
    - Means removing a Node and adding it back to the scene will not call the
      \_ready() method, it only call at first initialization
    - When to use:
      - Use the ready function when you only want to initialize default property
        values once when an object is created/added to scene
      - Default Player health, points, items, etc
  - Delta Time:
    - Delta time (elapsed time) is a concept used by programmers in relation to
      hardware and network responsiveness
    - Delta time comes from the physics/math formula for "The Change in Time"
    - When to use it:
      - Movement, use it for movement. Any physics formula dealing with time
      - When you want to be frame rate independent
    - Two method pass delta time `_process` and `_physics_process`
  - `_process(delta)` virtual method:
    - Gives us the ability to be frame independent
    - If overridden by Node, it will run at every frame possible
    - When to use it:
      - When you need an action called or something updated at the fastest
        possible rate (Real Time)
      - Smoothest movement possible that the physics process virtual method is
        unable to output (Not movement)
      - The delta value is not reliable, it prefers speed over consistency. it
        sometime gives 0 value of delta time
      - However, the default settings for New project somtimes has
        `_process(delta)` run slower than `_physics_process(delta)`
      - process virtial method is not sync to hardware
      - run faster remove vsyn option from project setting
  - `_physics_process(delta)` virtual method:
    - Gives us the ability to be frame independent
    - If ovverridden by node, delta will be capped at 1/60 (Default), 60 frames
      per second 0.1 seconds per 6 frames(delta is constant)
    - Frame rate is synced to the physices
    - When to use it:
      - Dealing with physics, such as movement
      - Custom Timers (Not using the Timer Node)
      - Ideal for Game Logic (Path Finding, updating positions)
      - Delta is capped a 1/60
      - You may not get the smoothest "visual animations(varies)"
  - When to use \_process or \_physics_process:
    - start our with \_physics_process(delta)
    - If it feels weird upgrade to \_process(delta)
    - If game is to slow and bottleneck is \_process(delta), consider switching
      it back to \_physics_process(delta)
  - Player Input:
    - Mouse Movement, Mouse Clicks, Keyboard inputs, Controller Inputs ets
    - The easiest way to handle keyboard input is through the Godot Application,
      in Project settings, under the Input Map tab
    - Godot provide 4 Common Input Virtual Methods from Node Class
      - \_input(event):
      - \_gui_input(event):
      - \_unhandled_input(event):
      - \_unhandled_key_input(event):
    - \_input(event):
      - This is the first input method that gets called
      - You are free to put custom player movement code here
    - \_gui_input(event):
      - This is the second thing to be called the \_input(event) was unhandled
        (propagation was not manually stopped)
      - This is for control Nodes (Nodes that inherit the control Node)
      - Propagation of the event handling chain will be stopped for you, no need
        to manually handle that
    - \_unhandled_input(event):
      - Unhandled input is the third input event handler to be called
      - Best to use this for player input controls. That way player controls
        dose not interfere with Control Node input handler eg. player move
        up,down,left roght
    - \_unhandled_key_input(event):
      - Will only get called if a key press was/is detected (Mouse movements
        dose not activate this function)
      - Consider using this for input dealing with key presses
    - CollisionObject.\_input_event():
      - Fourth Input handler to be called
      - Collision Object is a Node class, inherited by Area and PhysicsBody
    - Viewport:
      - Last to be called
      - If input chain has been unhandled, the input event will be passed to the
        next viewport on the tree
    - Manually Stop the input event Propagation:
      - We must stop it through the root Viewport Singleton. Any node in the
        scene tree can call
      - `self.get_tree().get_root().set_input_as_handled()`
    - Handling inputs:
      - InputEventWithModifiers for leptop and desktop devices
      - InputEventJoypedButton for joystick etc
      - Input types for pcs:
        - `InputEventGesture` is trackpad gestures
        - `InputEventKey` is key inputs
        - `InputEventMouse` is mouse inputs
        ```
        Example:
        	if event is InputEventKey:
        		if event.get_physical_keycode_with_modifiers() == KEY_ALT:
        			# do somethings
        		elif event.get_physical_keycode_with_modifiers() == KEY_CTRL:
        			if not has_node("Child1"): # check this children has or not in the scene
        				self.add_child(Child1)
        				move_child(Child1, 0)
        	else:
        		print(event)
        ```
  - `_exit_tree()` Virtual method:
    - It called when node exit the seen tree
    - We can notify other code that we are leaving the scene tree, we can store
      our node in an array
    - The easiest thing to do as a bigginer is to delete the node from memory
      after it has left the scene tree
    - A Node leaving the scene tree dose not delete the Node/Object from memory,
      you must manually manage memory yourself
    - Two ways of deleting node from memory:
      - Node.queue_free()
      - Object.free()
    - Node.queue_free():
      - Queues a node for deletion at the end of the current frame. When
        deleted, all children nodes will be deleted. This method makes sure it
        is ok to delete the Node, and safer than using Object.free()
      - This is preferred method
    - Object.free():
      - Deletes the Object from memory. Any pre-existing reference to the freed
        object will become invalid (no built in safty neasures)
    - When to use queue_free() method:
      - Memory management is a complex topic and its best to start by deleting
        everything that leaves the scene tree, Best not to have Memory leaks
        ```
        Example:
        	func _exit_tree():
        		self.queue_free()
        ```
  - Adding and removing from scene tree:
    - add_child(<node object>)
    - remove_child(<node object>)
    - Removing an Object/Node from the scene tree does not remove the Node from
      Memory
    - You need to use Object.free() or Node.queue_free() (depends on the node)
    - When a node is added to the scene tree, it is called an "Active Node"
    - When a node is removed from the scene it is called an "Oprhaned Node"
  - Memory Leaks:
    - Godot manage memory manually that's means we as a programmer we have to
      manage memory ourself
    - One way to make better perpofmence is object pooling
  - Tween Pseudocode that use to create a health bar:
    ```
    	var tween = Tween.new()
    	tween.interpolate_property(...)
    	add_child(tween)
    	tween.start()
    ```

#### Pivot Point or Offsets:

- Pivot point is the reference point for positioning, rotating and scaling a
  game object
- Pivot point is where the transform portion of our Node object gets affected at

#### Windows Basic:

- Understanding window resulation is fundamental to game programming
- With most games its beneficial to understand how we can retrieve and edit the
  game view resolution
- Resolution is expressed as (width x height)
  - 1920 x 1080 -> Aspect Ratio 16:9 (x120)
- The aspect ratio of an image is the ratio of its width to its height. It is
  commonly expressed as two numbers separated by a colon
- Window in Godot:

  - Godot has two different window values we can retrieve
    - 1 Player device Screen/Resolution(Laptop, Monitor, Cellphone)
    - 2 Game Window/Resolution Size (Our game)

- Godot global OS singleton class:
  - godot provide getter method only
  - `screen = OS.get_screen_size()`
  - it return a Vector2(float x, float y)
  - Game view resolution:
    - Depricated:
      - setter
      - vector2 = Vector2(float x, float y)
      - OS.set_window_size(vector2)
      - Getter
      - OS.get_window_size()
      - getter method
      - OS.is_window_resizeable() return boolean
      - setter method
      - OS.set_window_resizeable(false) take boolean
      - adjust game resolution
      - OS.set_window_size(max)
      - OS.set_window_position(Vector2(0, 0))
    - Now window handle by DisplayServer:
      - It has a lot of method getter and setter

#### Game Scaling:

- In mobile development
  - Always good practice to design a game for portrait or landscape orientation,
    never both
  - SCREEN_ORIENTATION_LANDSCAPE = 0
  - SCREEN_ORIENTATION_PORTRATE = 1
  - Keep in mind Godot defaults to Landscape
    - To set screen orientation use:
      - DisplayServer.screen_set_orientation(screen_orientation)
- Different devices will have different resolutions, if your game view is in
  Fullscreen and adjusts to the devices resolution, images will be affected
- Godot offers us a way through project settings to handle this for us
  automatically
- Setting in Project settings > Display > Window > Stretch

#### CanvasItem class:

- set_visible(bool)
- is_visible() -> bool
- hide()
- show()

#### Sprite Class:

- Used with the Sprite Node
- Display a 2D texture (Sprite Sheets)
- Cannot Edit Image Directly
- Properties of Sprite
  - offset
    - set_offset(Vector2)
    - get_offset() -> Vector2
  - How it affects your sprite depends on the centered property
  - centerd:
    - set_centered(bool)
    - is_offset() -> bool
  - texture(Object to draw, example: Image)
    - set_texture(Texture)
    - get_texture() -> Texture

#### Texture Class:

- Texture are items you create by loading from a file
- Texture is a base for other resources, it cannot be used directly
- Your Image/png is a Stream Texture < Texture
- Cannot edit image directly through texture class
- Methods:
  - get_size() -> Vector2
  - get_height() -> int
  - get_width() -> int

#### Image Class:

- Native Image datatype and contains your image data, which is then/can be
  converted to texture
- Here we can edit our image file
- get_size() -> Vector2
- get_height() -> int
- get_width() -> int
- resize(int width, int height, Interpolation = 1)
- shrink_x2() -> void
- expand_x2_hq2x() -> void
- save_png("save file path")

#### Hierarchy:

- CanvasItems class -> Sprite Class -> Texture Class -> Image Class

---

#### Writing Code:

- Readable
- Maintainable
- Testable

#### Input Map:

- Godots Easiest Way of Handling/ Editing Player Inputs
- Using InputMaps
  - We can use Input Singleton
  - Ex: `Input.is_action_pressed("ui_left")`
- InputMaps Singleton that manages InputEventActions (InputEvents)
- If you want to add/edit/delete an input mapping during runtime, you can do so
  with the InputMap singleton

#### Collision:

- A collision is a interation between two bodies causing change in motion of
  bodies
- Collision are Based on Shapes. These shapes can be as simple as
  squares/rectangles and circles or more complex shapes (Polygons)
- In game programming collision detected through an complex `Algorithms`

#### Collision Shapes (Godot):

- Collisions define the area of an object inside the physics engine
- CollisionShape2D is the class Godot uses in order to define a space in which
  the collision algorithm can work with in detecting when Game Objects
  Intersect/Collide
- CollisionShape2D:
  - Collision Shapes by themselves are completly useless
  - Should be attached to a Node that inherits from the CollisionObject2D class
    (dealing with 2D)
  - Ex: Area2D and PhysicsBody2D

#### How to access Node from script:

- example:

```
$path or get_node("path")
```
