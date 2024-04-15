extends CharacterBody2D

@onready var animation_tree : AnimationTree = $AnimationTree

@export var Starting_move_directions : Vector2 = Vector2.LEFT
@export var Movement_Speed : float = 30.0
@export var hit_state : State

@onready var state_machine : CharacterStateMachine = $CharacterStateMachine

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animation_tree.active = true

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	var direction : Vector2 = Starting_move_directions
	if direction &&  state_machine.check_if_can_move():
		velocity.x = direction.x * Movement_Speed
	elif state_machine.current_state != hit_state:
		velocity.x = move_toward(velocity.x, 0, Movement_Speed)
	
	move_and_slide()



