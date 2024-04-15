extends State

class_name GroundState

@export var Jump_velocity : float = -200.0
@export var air_state : State
@export var attack_state : State
@export var attack_animation : String = "Attack 1"

@onready var buffer_timer : Timer =$BufferTimer

func state_process(delta):
	if(!character.is_on_floor() && buffer_timer.is_stopped()):
		next_state = air_state


func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		jump()
	if(event.is_action_pressed("attack")):
		attack()




func jump():
	character.velocity.y = Jump_velocity
	next_state = air_state
	

func attack():
	next_state = attack_state
	playback.travel(attack_animation)
